import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:myanmar_to_thai/controller/data_controller.dart';
import 'package:myanmar_to_thai/controller/level_controller.dart';
import 'package:myanmar_to_thai/core/constant/constant.dart';
import 'package:myanmar_to_thai/core/router/router.dart';
import 'package:myanmar_to_thai/model/api/lesson_all.dart';
import 'package:myanmar_to_thai/model/api/lesson_quiz.dart';
import 'package:myanmar_to_thai/view/pages/connectivity_page.dart';
import 'package:myanmar_to_thai/view/widgets/shimmer_loading.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';

import '../../core/constant/app_icon.dart';
import '../../core/mock/mock_data.dart';
import '../../model/api/parser/lesson_all_parser.dart';
import '../../service/api/client.dart';
import '../widgets/core.dart';
import 'lesson_detail_page.dart';

class LevelDetailPage extends StatefulWidget {
  const LevelDetailPage({super.key});

  @override
  State<LevelDetailPage> createState() => _LevelDetailPageState();
}

class _LevelDetailPageState extends State<LevelDetailPage> {
  Future<LessonAll?>? lessonAllFuture;
  final DataController dController = Get.find();

  @override
  void initState() {
    getLessons();
    super.initState();
  }

  Future<void> getLessons() async {
    lessonAllFuture = RequestREST(
      endPoint: lesson,
      queryParameter: {
        "classId": dController.selectedClass.value?.id,
        "levelId": dController.selectedLevel.value?.id,
      },
    ).executeGet<LessonAll>(LessonAllParser());
  }

  @override
  Widget build(BuildContext context) {
    final LevelController levelController = Get.find();
    String level = dController.selectedLevel.value?.name ?? "";
    String levelImage = dController.selectedLevel.value?.image ?? "";
    final textTheme = Theme.of(context).textTheme;
    final theme = Theme.of(context);
    return Scaffold(
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
                backgroundColor: Colors.black,
                backgroundImage: NetworkImage(
                  levelImage,
                ),
              ),
            ),
            horizontalSpace(),
            Text(level),
          ],
        ),
        titleTextStyle: textTheme.displayMedium,
        centerTitle: true,
        leading: Center(
          child: InkWell(
            splashColor: Colors.grey.shade500,
            onTap: () => Get.back(),
            child: CircleAvatar(
              radius: 18,
              backgroundColor: Colors.grey.shade200,
              child: Image.asset(
                AppIcon.leftArrow,
                width: 15,
                height: 15,
              ),
            ),
          ),
        ),
      ),
      body: ConnectivityPage(
        connected: RefreshIndicator(
          onRefresh: () {
            setState(() {
              getLessons();
            });
            return Future.delayed(Duration.zero);
          },
          child: Stack(
            children: [
              FirebaseSnapHelper<LessonAll?>(
                  future: lessonAllFuture!,
                  onLoading: () => const LevelDetailShimmerLoading(),
                  onSuccess: (lessonAll) {
                    return Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                      ),
                      child: GridView.builder(
                        itemCount: lessonAll?.data.length ?? 0,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: ResponsiveBreakpoints.of(context)
                                  .largerThan(MOBILE)
                              ? 4
                              : 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: ResponsiveBreakpoints.of(context)
                                  .largerThan(MOBILE)
                              ? 1 / 1
                              : 1,
                        ),
                        itemBuilder: (context, index) {
                          final lesson = lessonAll?.data[index];
                          return InkWell(
                            onTap: () {
                              dController.setSelectedLesson(lesson!);
                              if (lesson.forQuestion == true) {
                                Get.toNamed(questionPage);
                              } else {
                                Get.toNamed(lessonDetailPage);
                              }
                            },
                            child:
                                LayoutBuilder(builder: (context, constraints) {
                              log("===Height: ${constraints.maxHeight}");
                              log("===Width: ${constraints.maxWidth}");
                              return Card(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(
                                        15,
                                      ),
                                    ),
                                    side: BorderSide(
                                      color: theme.primaryColor,
                                    )),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Image.network(
                                          lesson?.image ?? "",
                                          width: constraints.maxWidth,
                                          height: constraints.maxHeight * 0.5,
                                          fit: BoxFit.contain,
                                          frameBuilder: (c, w, _, __) {
                                            return ClipRRect(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(10),
                                              ),
                                              child: w,
                                            );
                                          },
                                        ),
                                        verticalSpace(),
                                        Expanded(
                                          child: Text(
                                            lesson?.name ?? "",
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: textTheme.headlineSmall,
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }),
                          );
                        },
                      ),
                    );
                  }),
              Align(
                alignment: Alignment.bottomCenter,
                child: Obx(() {
                  final bannerAd = levelController.bannerAd.value;
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
            ],
          ),
        ),
      ),
    );
  }
}
