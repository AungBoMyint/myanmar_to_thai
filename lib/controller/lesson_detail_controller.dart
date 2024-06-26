import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:myanmar_to_thai/controller/data_controller.dart';
import 'package:myanmar_to_thai/core/other/loading.dart';
import '../core/constant/constant.dart';
import '../model/api/content.dart';
import '../model/api/content_all.dart';
import '../model/api/parser/content_all_parser.dart';
import '../service/api/client.dart';

class LessonDetailController extends GetxController {
  DataController dController = Get.find();
  PageController pageController = PageController();
  late RxList<Content> contents = <Content>[].obs;
  var currentIndex = 0.obs;
  StreamSubscription<PlayerState>? playerStateStreams;
  var playerState = PlayerState.paused.obs;
  AudioPlayer? player;
  var loading = false.obs;
  var page = 0.obs;
  var limit = 10.obs;
  var total = 0.obs;
  var playerLoading = false.obs;

  bool hasPrevious() => currentIndex.value == 0 ? false : true;
  bool hasNext() => currentIndex.value == contents.length - 1 ? false : true;

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

  Future<void> playSnail(String source) async {
    if (playerLoading.value) return;
    playerLoading.value = true;
    if (!(player == null)) pausePlayer();
    player = null;
    player = AudioPlayer();
    await player?.setPlaybackRate(0.5);
    await player?.play(UrlSource(source));
    if (!(playerStateStreams == null)) playerStateStreams?.cancel();
    playerStateStreams = player?.onPlayerStateChanged.listen((event) {
      playerState.value = event;
    });
    playerLoading.value = false;
  }

  void pausePlayer() {
    try {
      player?.pause();
    } catch (e) {
      log("========Player pause error: $e");
    }
  }

  ///[index] is currentIndex
  Future<void> next() async {
    if (currentIndex.value == total.value) {
      //That is all.Go back.
      Get.back();
    } else if (currentIndex.value < contents.length) {
      pausePlayer();
      currentIndex.value += 1;
      pageController.animateToPage(
        currentIndex.value,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeIn,
      );
      playNormal(contents[currentIndex.value].audio);
    }

    if ((currentIndex.value != total.value) &&
        (currentIndex.value == contents.length - 1) &&
        ((currentIndex.value + 1) != total.value)) {
      //This index is last index - 1.so,we need to pre-getNext contents
      getNextContents().then((value) {
        pageController = PageController(initialPage: currentIndex.value);
        log("=====Preloading finished: Total Contents=>${contents.length}");
      }).onError((error, stackTrace) {
        errorSnap("Something was wrong.Please back!");
        Get.back();
      });
    }
  }

  ///[currentIndex.value] is currentcurrentIndex.value
  void back() {
    pausePlayer();
    currentIndex.value -= 1;
    pageController.animateToPage(
      currentIndex.value,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeOut,
    );
    playNormal(contents[currentIndex.value].audio);
  }

  @override
  void dispose() {
    pausePlayer();
    player?.dispose();
    super.dispose();
  }

  Future<void> getNextContents() async {
    page.value += 1;
    loading.value = true;
    final result = await RequestREST(
      endPoint: content,
      queryParameter: {
        "classId": dController.selectedClass.value?.id,
        "levelId": dController.selectedLevel.value?.id,
        "lessonId": dController.selectedLesson.value?.id,
        "page": page.value,
        "limit": limit.value,
      },
    ).executeGet<ContentAll>(ContentAllParser());
    loading.value = false;
    contents.addAll(result?.data ?? []);
  }

  Future<void> getContents() async {
    loading.value = true;
    log("===ClassID:${dController.selectedClass.value?.id}\nLevelID:${dController.selectedLevel.value?.id}\nLessonID:${dController.selectedLesson.value?.id}");
    final result = await RequestREST(
      endPoint: content,
      queryParameter: {
        "classId": dController.selectedClass.value?.id,
        "levelId": dController.selectedLevel.value?.id,
        "lessonId": dController.selectedLesson.value?.id,
      },
    ).executeGet<ContentAll>(ContentAllParser());

    loading.value = false;
    contents.value = result?.data ?? [];
    total.value = result?.count ?? 0;
    //Play First Song....if not empty
    if (contents.isNotEmpty) {
      playNormal(contents[0].audio);
    }
  }

  //---------Ads Initialize
  InterstitialAd? interstitialAd;
  Rxn<BannerAd> bannerAd = Rxn<BannerAd>();

  // TODO: replace this test ad unit with your own ad unit.
  final adUnitId = Platform.isAndroid
      ? 'ca-app-pub-4330867676940675/5503315606'
      : 'ca-app-pub-4330867676940675/8260947676';
  final bannerAdUnitId = Platform.isAndroid
      ? 'ca-app-pub-4330867676940675/9532978388'
      : 'ca-app-pub-4330867676940675/2873460447';

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

                  Get.back();
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
    /* final banner =  */ BannerAd(
      adUnitId: bannerAdUnitId,
      request: const AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        // Called when an ad is successfully received.
        onAdLoaded: (ad) {
          debugPrint('$ad loaded.');
          bannerAd.value = ad as BannerAd;
        },
        // Called when an ad request failed.
        onAdFailedToLoad: (ad, err) {
          debugPrint('BannerAd failed to load: $err');
          // Dispose the ad here to free resources.
          ad.dispose();
        },
      ),
    ).load();
    /* banner
        .load()
        .then((value) => bannerAd.value = banner)
        .onError((error, stackTrace) {
      log("========Lesson Detail Banner Error: $error");
      throw Exception;
    }); */
  }
  //-----------------------------//

  @override
  void onInit() {
    getContents();
    loadAd();
    loadBannerAds();
    super.onInit();
  }

  @override
  void onClose() {
    pausePlayer();
    bannerAd.value == null;
    super.onClose();
  }

  @override
  InternalFinalCallback<void> get onDelete {
    pausePlayer();
    return super.onDelete;
  }
}
