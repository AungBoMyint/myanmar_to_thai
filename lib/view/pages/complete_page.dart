import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:myanmar_to_thai/core/constant/app_animation.dart';
import 'package:myanmar_to_thai/core/router/router.dart';
import 'package:rive/rive.dart';
import '../widgets/core.dart';

class CompletePage extends StatefulWidget {
  const CompletePage({super.key});

  @override
  State<CompletePage> createState() => _CompletePageState();
}

class _CompletePageState extends State<CompletePage> {
  //---------Ads Initialize
  InterstitialAd? interstitialAd;

  // TODO: replace this test ad unit with your own ad unit.
  final adUnitId = Platform.isAndroid
      ? 'ca-app-pub-4330867676940675/5503315606'
      : 'ca-app-pub-4330867676940675/8260947676';

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
                  Get.offNamedUntil(
                      levelDetailPage, ModalRoute.withName(homePage));
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

  //-----------------------------//
  @override
  void initState() {
    loadAd();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final title = Get.arguments["title"] as String;
    final description = Get.arguments["description"] as String;
    final textTheme = Theme.of(context).textTheme;
    return WillPopScope(
      onWillPop: () async {
        if (interstitialAd == null) return true;
        await interstitialAd?.show();
        return false;
      },
      child: SafeArea(
        child: Scaffold(
            body: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  verticalSpace(),
                  //Success Icon
                  SizedBox(
                      height: size.height * 0.5,
                      width: size.width,
                      child:
                          const RiveAnimation.asset(AppAnimation.successLight)),

                  //Title
                  Text(
                    title,
                    style: textTheme.headlineLarge,
                  ),
                  verticalSpace(v: 25),
                  //Description
                  Padding(
                    padding: const EdgeInsets.only(left: 30, right: 20),
                    child: Text(
                      description,
                      style: textTheme.headlineMedium,
                    ),
                  ),
                  verticalSpace(v: 25),
                ],
              ),
            ),
            bottomNavigationBar: SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    )),
                onPressed: () {
                  if (interstitialAd == null) return Get.back();
                  interstitialAd?.show();
                },
                child: const Text(
                  "CONTINUE",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ).withPadding(const EdgeInsets.all(20))),
      ),
    );
  }
}
