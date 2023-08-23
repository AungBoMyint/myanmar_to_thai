import 'dart:async';
import 'dart:io';
import 'dart:math' hide log;
import 'dart:developer';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:myanmar_to_thai/controller/data_controller.dart';
import 'package:myanmar_to_thai/core/constant/constant.dart';
import 'package:myanmar_to_thai/core/router/router.dart';
import 'package:myanmar_to_thai/model/api/parser/question_all_parser.dart';
import 'package:myanmar_to_thai/model/api/question_all.dart';
import 'package:myanmar_to_thai/view/widgets/core.dart';

import '../core/other/loading.dart';
import '../model/api/question.dart';
import '../service/api/client.dart';

class QuestionController extends GetxController {
  DataController dController = Get.find();
  PageController pageController = PageController();
  String lesson = "";
  String lessonImage = "";
  RxList<Question> questions = <Question>[].obs;
  var currentIndex = 0.obs;
  var selectedAnswer = "".obs;
  var isPressed = false.obs;
  StreamSubscription<PlayerState>? playerStateStreams;
  var playerState = PlayerState.paused.obs;
  AudioPlayer? player;
  var loading = false.obs;
  var page = 0.obs;
  var limit = 10.obs;
  var total = 0.obs;
  var goToComplete = false.obs;
  var playerLoading = false.obs;

  Future<void> playNormal(String source) async {
    if (playerLoading.value) return;
    playerLoading.value = true;
    if (!(player == null)) pausePlayer();
    player = null;
    player = AudioPlayer();
    await player?.setPlaybackRate(1);
    await player?.play(UrlSource(source));
    if (!(playerStateStreams == null)) playerStateStreams?.cancel();
    playerStateStreams = player?.onPlayerStateChanged.listen((event) {
      playerState.value = event;
    });
    playerLoading.value = false;
  }

  bool hasPrevious() => currentIndex.value == 0 ? false : true;
  bool hasNext() => currentIndex.value == questions.length - 1 ? false : true;

  void selectAnswer(String inputAnswer) {
    pausePlayer();
    selectedAnswer.value = inputAnswer;
    isPressed.value = true;
    //Need to check answer if correct or not
    if (selectedAnswer.value != questions[currentIndex.value].answer) {
      //if not equal,show "Try Again"
      Get.bottomSheet(
          TryAgainOrContinueWidget(
            color: Colors.red,
            onPressed: () {
              //we shuffle previous optinAnswerlist

              var currentQ = questions[currentIndex.value];
              var list = currentQ.choiceItems.map((e) => e).toList();
              list.shuffle();
              currentQ = currentQ.copyWith(
                choiceItems: list,
              );
              questions[currentIndex.value] = currentQ;
              reset();
              Get.back();
            },
            alternativeText:
                retryAlternatives[Random().nextInt(retryAlternatives.length)],
            buttonText: "TRY AGAIN",
          ),
          isDismissible: false,
          barrierColor: Colors.black45,
          backgroundColor: Colors.white,
          elevation: 3,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          )));
    } else {
      //Success BottomSheet
      Get.bottomSheet(
          TryAgainOrContinueWidget(
            color: Colors.green,
            onPressed: () {
              reset();
              //BottomSheet Dismiss
              if (Get.isBottomSheetOpen == true) Get.back();
              //if has Next,we go next
              if (hasNext()) {
                next();
              } else {
                goToComplete.value = true;
                interstitialAd?.show();
              }
            },
            alternativeText: successAlternatives[
                Random().nextInt(successAlternatives.length)],
            buttonText: "CONTINUE",
          ),
          isDismissible: false,
          barrierColor: Colors.black45,
          backgroundColor: Colors.white,
          elevation: 3,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          )));
    }
  }

  void reset() {
    isPressed.value = false;
    selectedAnswer = "".obs;
  }

  ///[index] is currentIndex
  Future<void> next() async {
    if (currentIndex.value == total.value) {
      //That is all.Go back.
      Get.back();
    } else if (currentIndex.value < questions.length) {
      currentIndex.value += 1;
      pageController.animateToPage(
        currentIndex.value,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeIn,
      );
    }

    if ((currentIndex.value != total.value) &&
        (currentIndex.value == questions.length - 1) &&
        ((currentIndex.value + 1) != total.value)) {
      //This index is last index - 1.so,we need to pre-getNext contents
      getNextContents().then((value) {
        pageController = PageController(initialPage: currentIndex.value);
        log("=====Preloading finished: Total Questions=>${questions.length}");
      }).onError((error, stackTrace) {
        errorSnap("Something was wrong.Please back!");
        Get.back();
      });
    }
  }

  ///[currentIndex.value] is currentcurrentIndex.value
  void back() {
    currentIndex.value -= 1;
    pageController.animateToPage(
      currentIndex.value,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeOut,
    );
  }

  Future<void> getNextContents() async {
    page.value += 1;
    loading.value = true;
    final result = await RequestREST(
      endPoint: question,
      queryParameter: {
        "classId": dController.selectedClass.value?.id,
        "levelId": dController.selectedLevel.value?.id,
        "lessonId": dController.selectedLesson.value?.id,
        "page": page.value,
        "limit": limit.value,
      },
    ).executeGet<QuestionAll>(QuestionAllParser());
    loading.value = false;
    questions.addAll(result?.data ?? []);
  }

  Future<void> getContents() async {
    loading.value = true;
    log("===ClassID:${dController.selectedClass.value?.id}\nLevelID:${dController.selectedLevel.value?.id}\nLessonID:${dController.selectedLesson.value?.id}");
    final result = await RequestREST(
      endPoint: question,
      queryParameter: {
        "classId": dController.selectedClass.value?.id,
        "levelId": dController.selectedLevel.value?.id,
        "lessonId": dController.selectedLesson.value?.id,
      },
    ).executeGet<QuestionAll>(QuestionAllParser());
    loading.value = false;
    questions.value = result?.data ?? [];
    total.value = result?.count ?? 0;
  }

  //---------Ads Initialize
  InterstitialAd? interstitialAd;
  Rxn<BannerAd> bannerAd = Rxn<BannerAd>();

  // TODO: replace this test ad unit with your own ad unit.
  final adUnitId = Platform.isAndroid
      ? 'ca-app-pub-3940256099942544/1033173712'
      : 'ca-app-pub-3940256099942544/4411468910';
  final bannerAdUnitId = Platform.isAndroid
      ? 'ca-app-pub-3940256099942544/6300978111'
      : 'ca-app-pub-3940256099942544/2934735716';

  /// Loads an interstitial ad.
  Future<void> loadAd() async {
    await InterstitialAd.load(
        adUnitId: adUnitId,
        request: const AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          // Called when an ad is successfully received.
          onAdLoaded: (ad) {
            ad.fullScreenContentCallback = FullScreenContentCallback(
                // Called when the ad showed the full screen content.
                onAdShowedFullScreenContent: (ad) {},
                // Called when an impression occurs on the ad.
                onAdImpression: (ad) {},
                // Called when the ad failed to show full screen content.
                onAdFailedToShowFullScreenContent: (ad, err) {
                  // Dispose the ad here to free resources.
                  ad.dispose();
                },
                // Called when the ad dismissed full screen content.
                onAdDismissedFullScreenContent: (ad) {
                  // Dispose the ad here to free resources.
                  ad.dispose();
                  if (goToComplete.value) {
                    Get.toNamed(completePage, arguments: {
                      "title": completeQuizTitleAlternatives[Random()
                          .nextInt(completeQuizTitleAlternatives.length)],
                      "description": completeQuizDescriptionAlternatives[
                          Random().nextInt(
                              completeQuizDescriptionAlternatives.length)],
                    });
                  } else {
                    Get.back();
                  }
                },
                // Called when a click is recorded for an ad.
                onAdClicked: (ad) {});

            debugPrint('$ad loaded.');
            // Keep a reference to the ad so you can show it later.
            interstitialAd = ad;
          },
          // Called when an ad request failed.
          onAdFailedToLoad: (LoadAdError error) {
            debugPrint('InterstitialAd failed to load: $error');
          },
        ));
  }

  Future<void> loadBannerAds() async {
    bannerAd.value = BannerAd(
      adUnitId: bannerAdUnitId,
      request: const AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        // Called when an ad is successfully received.
        onAdLoaded: (ad) {
          debugPrint('$ad loaded.');
        },
        // Called when an ad request failed.
        onAdFailedToLoad: (ad, err) {
          debugPrint('BannerAd failed to load: $err');
          // Dispose the ad here to free resources.
          ad.dispose();
        },
      ),
    )..load();
  }

  //-----------------------------//

  @override
  void onInit() {
    getContents();
    loadAd();
    loadBannerAds();
    super.onInit();
  }

  void pausePlayer() {
    try {
      player?.pause();
    } catch (e) {
      log("========Player pause error: $e");
    }
  }

  @override
  void onClose() {
    pausePlayer();
    super.onClose();
  }

  @override
  InternalFinalCallback<void> get onDelete {
    pausePlayer();
    return super.onDelete;
  }
}
