import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:myanmar_to_thai/controller/data_controller.dart';
import 'package:myanmar_to_thai/controller/lesson_detail_controller.dart';
import 'package:myanmar_to_thai/view/pages/connectivity_page.dart';
import 'package:myanmar_to_thai/view/widgets/shimmer_loading.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';

import '../../core/constant/app_icon.dart';
import '../widgets/core.dart';

class LessonDetailPage extends StatelessWidget {
  const LessonDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final LessonDetailController ldController = Get.find();
    final DataController dController = Get.find();
    final lesson = dController.selectedLesson.value?.name ?? "";
    final lessonImage = dController.selectedLesson.value?.image ?? "";
    final textTheme = Theme.of(context).textTheme;
    final theme = Theme.of(context);
    return WillPopScope(
      onWillPop: () async {
        if (ldController.interstitialAd == null) return true;
        await ldController.interstitialAd?.show();
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 25,
                backgroundColor: theme.primaryColor,
                child: CircleAvatar(
                  radius: 24,
                  backgroundColor: Colors.white,
                  backgroundImage: NetworkImage(
                    lessonImage,
                  ),
                ),
              ),
              horizontalSpace(),
              Expanded(
                child: Text(
                  lesson,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          titleTextStyle: textTheme.displayMedium,
          centerTitle: true,
          automaticallyImplyLeading: false,
          actions: [
            InkWell(
              splashColor: Colors.grey.shade500,
              onTap: () {
                if (ldController.interstitialAd == null) Get.back();
                ldController.interstitialAd?.show();
              },
              child: CircleAvatar(
                radius: 18,
                backgroundColor: Colors.grey.shade200,
                child: Image.asset(
                  AppIcon.close,
                  width: 15,
                  height: 15,
                ),
              ),
            ),
            horizontalSpace(v: 10)
          ],
        ),
        body: ConnectivityPage(
          connected: Obx(() {
            final contents = ldController.contents;
            final isLoading = ldController.loading.value;
            return isLoading
                ? const LessonDetailShimmerLoading()
                : Stack(children: [
                    PageView(
                      controller: ldController.pageController,
                      physics: const NeverScrollableScrollPhysics(),
                      children: List.generate(contents.length, (index) {
                        final content = contents[index];
                        return LayoutBuilder(builder: (context, constraints) {
                          final width = constraints.maxWidth;
                          final height = constraints.maxHeight;
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                //Thailand Flag
                                /* Image.asset(
                                  AppIcon.thailand,
                                  width: 40,
                                  height: 40,
                                ), */
                                verticalSpace(
                                    v: ResponsiveBreakpoints.of(context)
                                            .largerThan(MOBILE)
                                        ? 25
                                        : 10),
                                //Image
                                Container(
                                  width: width * 0.8,
                                  height: height * 0.3,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(content.image),
                                      fit: BoxFit
                                          .contain, // Use BoxFit.contain instead of BoxFit.cover
                                    ),
                                  ),
                                ),

                                /* Container(
                                  /* color: Colors.blue.withOpacity(0.8), */
                                  width: width * 0.8,
                                  height: height * 0.3,
                                  child: Image.network(
                                    content.image,
                                    width: width * 0.8,
                                    height: height * 0.28,
                                    fit: BoxFit.cover,
                                  ),
                                ), */
                                verticalSpace(),
                                //Thai Language
                                Text(
                                  content.thai,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                verticalSpace(v: 25),
                                Text(
                                  content.pronuncation,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w300,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                verticalSpace(v: 25),

                                //Slow Audio Icon
                                SizedBox(
                                  /*  width: 125, */
                                  child: containerWithBoxDecoration(
                                      child: InkWell(
                                    onTap: () =>
                                        ldController.playSnail(content.audio),
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            AppIcon.snail,
                                            width: 30,
                                            height: 30,
                                          ),
                                          horizontalSpace(v: 8),
                                          const Text(
                                            "Play Slowly",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ],
                                      ).withSymmetricPadding(v: 5, h: 5),
                                    ),
                                  )),
                                ),
                                verticalSpace(),
                                //Horizontal Divider
                                const Divider(
                                  thickness: 0.8,
                                ),
                                //Myanmar Language
                                verticalSpace(),

                                /*  Image.asset(
                                  AppIcon.myanmar,
                                  width: 40,
                                  height: 40,
                                ), */

                                /* verticalSpace(
                                    v: ResponsiveBreakpoints.of(context)
                                            .largerThan(MOBILE)
                                        ? 25
                                        : 10), */
                                Text(
                                  content.myanmar,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                verticalSpace(v: 10),
                                //Play Audio Icon
                                InkWell(
                                  onTap: () =>
                                      ldController.playNormal(content.audio),
                                  child: Image.asset(
                                    AppIcon.play,
                                    width: 80,
                                    height: 80,
                                  ),
                                ),
                                /* verticalSpace(v: 25), */
                              ],
                            ),
                          );
                        });
                      }),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Obx(() {
                        final bannerAd = ldController.bannerAd.value;
                        if (!(bannerAd == null)) {
                          return SafeArea(
                            child: SizedBox(
                              width: bannerAd.size.width.toDouble(),
                              height: bannerAd.size.height.toDouble(),
                              child: AdWidget(ad: bannerAd),
                            ),
                          );
                        }
                        return const SizedBox();
                      }),
                    ),
                  ]);
          }),
        ),
        bottomNavigationBar: ConnectivityPage(
          notConnected: const SizedBox(),
          connected: SizedBox(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //Previous Button
                Obx(() {
                  return ldController.currentIndex.value != 0
                      ? Expanded(
                          flex: 4,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.grey.shade800,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                )),
                            onPressed: () => ldController.back(),
                            child: const Padding(
                              padding: EdgeInsets.all(15.0),
                              child: Text(
                                "Previous",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        )
                      : Expanded(flex: 0, child: Container());
                }),
                horizontalSpace(),
                //Next
                Obx(() {
                  return (ldController.currentIndex.value !=
                              ldController.contents.length - 1) &&
                          (ldController.currentIndex.value !=
                              ldController.total.value)
                      ? Expanded(
                          flex: 6,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: theme.primaryColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                )),
                            onPressed: () => ldController.next(),
                            child: const Padding(
                              padding: EdgeInsets.all(15.0),
                              child: Text(
                                "Next",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        )
                      : Expanded(flex: 0, child: Container());
                }),
              ],
            ).withPadding(EdgeInsets.symmetric(
              horizontal: 20,
            )),
          ),
        ),
      ),
    );
  }
}
