import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:myanmar_to_thai/controller/data_controller.dart';
import 'package:myanmar_to_thai/controller/lesson_detail_controller.dart';
import 'package:myanmar_to_thai/controller/question_controller.dart';
import 'package:myanmar_to_thai/core/constant/constant.dart';
import 'package:myanmar_to_thai/core/mock/mock_data.dart';
import 'package:myanmar_to_thai/model/remote/circle_position.dart';
import 'package:myanmar_to_thai/view/pages/connectivity_page.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';

import '../../core/constant/app_icon.dart';
import '../../model/api/question.dart';
import '../widgets/core.dart';

class QuestionPage extends StatelessWidget {
  const QuestionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final DataController dController = Get.find();
    final QuestionController qController = Get.find();
    final lesson = dController.selectedLesson.value?.name ?? "";
    final lessonImage = dController.selectedLesson.value?.image ?? "";
    log("Title Image: $lessonImage");
    final textTheme = Theme.of(context).textTheme;
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        if (qController.interstitialAd == null) return true;
        await qController.interstitialAd?.show();
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF050A30),
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
              Text(lesson),
            ],
          ),
          titleTextStyle:
              textTheme.displayMedium?.copyWith(color: Colors.white),
          centerTitle: true,
          automaticallyImplyLeading: false,
          actions: [
            InkWell(
              splashColor: Colors.grey.shade500,
              onTap: () {
                if (qController.interstitialAd == null) return Get.back();
                qController.interstitialAd?.show();
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
          connected: Stack(
            children: [
              CustomPaint(
                painter: CustomBackgroundPainter(),
                child: Container(),
              ),
              Obx(() {
                final questions = qController.questions;
                final isLoading = qController.loading.value;
                return isLoading
                    ? loadingWidget()
                    : PageView(
                        controller: qController.pageController,
                        physics: const NeverScrollableScrollPhysics(),
                        children: List.generate(questions.length, (index) {
                          final question = qController.questions[index];
                          return LayoutBuilder(builder: (context, constraints) {
                            final width = constraints.maxWidth;
                            final height = constraints.maxHeight;
                            return SizedBox(
                              height: size.height,
                              width: size.width,
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    verticalSpace(),
                                    //Question Card
                                    SizedBox(
                                      height: height * 0.3,
                                      width: width * 0.9,
                                      child: Card(
                                        elevation: 3,
                                        child: Stack(
                                          children: [
                                            Positioned(
                                              top: 5,
                                              right: 5,
                                              child: InkWell(
                                                onTap: () =>
                                                    qController.playNormal(
                                                        question.audioUrl ??
                                                            ""),
                                                child: Image.asset(
                                                  AppIcon.play,
                                                  width: 35,
                                                  height: 35,
                                                ),
                                              ),
                                            ),
                                            //Top Right Audio Play
                                            Align(
                                              alignment: Alignment.center,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10,
                                                    right: 10,
                                                    top: 10),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      question.question ?? "",
                                                      style: textTheme
                                                          .displayMedium,
                                                    ),
                                                    /* verticalSpace(),
                                                    Text(
                                                      question
                                                          .contentId.pronuncation,
                                                      style: textTheme.displaySmall,
                                                    ), */
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    verticalSpace(
                                        v: ResponsiveBreakpoints.of(context)
                                                .largerThan(MOBILE)
                                            ? 80
                                            : 60),
                                    //Command Text
                                    Text(
                                      "အဖြေမှန်ကို ရွေးချယ်ပါ",
                                      style: textTheme.displaySmall?.copyWith(
                                        color: theme.primaryColor,
                                      ),
                                    ),
                                    verticalSpace(
                                        v: ResponsiveBreakpoints.of(context)
                                                .largerThan(MOBILE)
                                            ? 85
                                            : 25),
                                    //Choice List
                                    SizedBox(
                                      height: ResponsiveBreakpoints.of(context)
                                              .largerThan(MOBILE)
                                          ? size.height * 0.5
                                          : size.height * 0.45,
                                      child: question.qestionType ==
                                                  selectRactangle ||
                                              question.qestionType ==
                                                  selectCircle
                                          ? SelectRectangleWidget(
                                              question: question,
                                              qController: qController,
                                              textTheme: textTheme)
                                          : /* question.qestionType == selectCircle
                                              ? SelectCircleWidget(
                                                  question: question,
                                                  qController: qController,
                                                  textTheme: textTheme,
                                                )
                                              : */
                                          Container(
                                              /* color: Colors.white, */
                                              padding: EdgeInsets.only(),
                                              child: GridView.builder(
                                                gridDelegate:
                                                    SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 2,
                                                  childAspectRatio:
                                                      ResponsiveBreakpoints.of(
                                                                  context)
                                                              .largerThan(
                                                                  MOBILE)
                                                          ? 10 / 5
                                                          : 10 / 8,
                                                  crossAxisSpacing: 40,
                                                  mainAxisSpacing: 40,
                                                ),
                                                itemCount:
                                                    question.choiceItems.length,
                                                itemBuilder: (context, index) {
                                                  final choiceItem = question
                                                      .choiceItems[index];
                                                  return Obx(() {
                                                    var isUserTrue = (qController
                                                            .isPressed.value &&
                                                        choiceItem ==
                                                            question.answer &&
                                                        qController
                                                                .selectedAnswer
                                                                .value ==
                                                            question.answer);
                                                    var isFalse = (qController
                                                            .isPressed.value &&
                                                        choiceItem ==
                                                            qController
                                                                .selectedAnswer
                                                                .value);
                                                    return InkWell(
                                                      onTap: () => qController
                                                          .selectAnswer(
                                                              choiceItem),
                                                      child: Container(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                vertical: 10,
                                                                horizontal: 10),
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              const BorderRadius
                                                                  .all(
                                                            Radius.circular(10),
                                                          ),
                                                          border: Border.all(
                                                            width: 3,
                                                            color: isUserTrue
                                                                ? Colors.green
                                                                : isFalse
                                                                    ? Colors.red
                                                                    : theme
                                                                        .primaryColor,
                                                          ),
                                                        ),
                                                        child: Image.network(
                                                          choiceItem,
                                                          /* width: ,
                                                                    height: , */
                                                          fit: BoxFit.contain,
                                                        ),
                                                      ),
                                                    );
                                                  });
                                                },
                                              ),
                                            ),
                                    ).withSymmetricPadding(v: 0, h: 20)
                                  ],
                                ),
                              ),
                            );
                          });
                        }),
                      );
              }),
              Align(
                alignment: Alignment.bottomCenter,
                child: Obx(() {
                  final bannerAd = qController.bannerAd.value;
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

class SelectCircleWidget extends StatelessWidget {
  const SelectCircleWidget({
    super.key,
    required this.question,
    required this.qController,
    required this.textTheme,
  });

  final Question question;
  final QuestionController qController;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
          color: theme.primaryColor,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: LayoutBuilder(builder: (context, constraints) {
        final h = constraints.maxHeight;
        final w = constraints.maxWidth;
        return Stack(
          children: List.generate(
            question.choiceItems.length,
            (index) {
              final item = question.choiceItems[index];
              final circlePosition = circlePositions[index];
              return Positioned(
                left: circlePosition.left,
                top: circlePosition.top,
                right: circlePosition.right,
                bottom: circlePosition.bottom,
                child: Obx(() {
                  var isUserTrue = (qController.isPressed.value &&
                      item == question.answer &&
                      qController.selectedAnswer.value == question.answer);
                  var isFalse = (qController.isPressed.value &&
                      item == qController.selectedAnswer.value);
                  return InkWell(
                    onTap: () => qController.selectAnswer(item),
                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor: isUserTrue
                          ? Colors.green
                          : isFalse
                              ? Colors.red
                              : Colors.white,
                      child: Center(
                        child: Text(
                          item,
                          style: textTheme.displayMedium,
                        ),
                      ),
                    ),
                  );
                }),
              );
            },
          )..add(Positioned(
              top: (h / 2) - 30,
              left: (w / 2) - 30,
              child: Obx(() {
                var isUserTrue = (qController.isPressed.value &&
                    "None" == question.answer &&
                    qController.selectedAnswer.value == question.answer);
                var isFalse = (qController.isPressed.value &&
                    "None" == qController.selectedAnswer.value);
                return InkWell(
                  onTap: () => qController.selectAnswer("None"),
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: isUserTrue
                        ? Colors.green
                        : isFalse
                            ? Colors.red
                            : Colors.white,
                    child: Center(
                      child: Text(
                        "None",
                        style: textTheme.displayMedium,
                      ),
                    ),
                  ),
                );
              }),
            )),
        );
      }),
    );
  }
}

class SelectRectangleWidget extends StatelessWidget {
  const SelectRectangleWidget({
    super.key,
    required this.question,
    required this.qController,
    required this.textTheme,
  });

  final Question question;
  final QuestionController qController;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListView.separated(
      itemCount: question.choiceItems.length,
      separatorBuilder: (context, index) => verticalSpace(),
      itemBuilder: (context, index) {
        final item = question.choiceItems[index];
        return Obx(() {
          var isUserTrue = (qController.isPressed.value &&
              item == question.answer &&
              qController.selectedAnswer.value == question.answer);
          var isFalse = (qController.isPressed.value &&
              item == qController.selectedAnswer.value);
          return InkWell(
            onTap: () => qController.selectAnswer(item),
            child: Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                side: BorderSide(
                  color: isUserTrue
                      ? Colors.green
                      : isFalse
                          ? Colors.red
                          : Colors.white,
                  width: 3,
                ),
              ),
              child: Center(
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 20,
                    backgroundColor: theme.primaryColor,
                    child: Text(
                      getLetter(index),
                      style: theme.textTheme.displaySmall?.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  title: Center(
                    child: Text(
                      item,
                      style: textTheme.displaySmall,
                    ),
                  ),
                  trailing: isUserTrue
                      ? const Icon(
                          Icons.done,
                          color: Colors.green,
                        )
                      : null,
                ),
              ),
            ),
          );
        });
      },
    );
  }
}

String getLetter(int index) {
  switch (index) {
    case 0:
      return "A";
    case 1:
      return "B";
    case 2:
      return "C";
    case 3:
      return "D";
    case 4:
      return "E";
    case 5:
      return "F";
    default:
      return "G";
  }
}

class CustomBackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    log("Canvas Size: $size");
    var paint = Paint()
      ..color = const Color(0xFF050A30)
      ..strokeWidth = 5
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round;
    Path path = Path();
    path.moveTo(0, size.height * 0.45);
    /* path.lineTo(size.width, size.height * 0.4); */
    path.quadraticBezierTo(
        size.width * 0.5, size.height * 0.25, size.width, size.height * 0.45);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    path.lineTo(0, size.height * 0.45);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
