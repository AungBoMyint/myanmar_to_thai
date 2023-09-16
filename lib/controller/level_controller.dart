import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class LevelController extends GetxController {
  //---------Ads Initialize
  Rxn<BannerAd> bannerAd = Rxn<BannerAd>();

  // TODO: replace this test ad unit with your own ad unit.

  final bannerAdUnitId = Platform.isAndroid
      ? 'ca-app-pub-4330867676940675/9532978388'
      : 'ca-app-pub-4741364579691602/6076542582';

  /// Loads an interstitial ad.

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
    loadBannerAds();
    super.onInit();
  }
}
