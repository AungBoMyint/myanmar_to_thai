import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:myanmar_to_thai/controller/lesson_detail_controller.dart';
import 'package:myanmar_to_thai/controller/question_controller.dart';

import '../../core/constant/app_icon.dart';
import '../widgets/core.dart';

class QuestionPage extends StatelessWidget {
  const QuestionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final QuestionController qController = Get.find();
    final lesson = Get.arguments["lesson"] as String;
    final lessonImage = Get.arguments["lesson_image"] as String;
    log("Title Image: $lessonImage");
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFF53A9),
        toolbarHeight: 80,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 25,
              backgroundColor: Color(0xffff98a2),
              child: CircleAvatar(
                radius: 24,
                backgroundColor: Colors.white,
                backgroundImage: AssetImage(
                  lessonImage,
                ),
              ),
            ),
            horizontalSpace(),
            Text(lesson),
          ],
        ),
        titleTextStyle: textTheme.displayMedium?.copyWith(color: Colors.white),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          InkWell(
            splashColor: Colors.grey.shade500,
            onTap: () => Get.back(),
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
      body: Stack(
        children: [
          CustomPaint(
            painter: CustomBackgroundPainter(),
            child: Container(),
          ),
          Obx(() {
            var questions = qController.questions;
            return PageView(
              controller: qController.pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: List.generate(questions.length, (index) {
                final question = qController.questions[index];
                return LayoutBuilder(builder: (context, constraints) {
                  final width = constraints.maxWidth;
                  final height = constraints.maxHeight;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      verticalSpace(),
                      //Question Card
                      SizedBox(
                        height: height * 0.3,
                        width: width * 0.8,
                        child: Card(
                          elevation: 3,
                          child: Stack(
                            children: [
                              Positioned(
                                top: 5,
                                right: 5,
                                child: Image.asset(
                                  AppIcon.play,
                                  width: 50,
                                  height: 50,
                                ),
                              ),
                              //Top Right Audio Play
                              Align(
                                alignment: Alignment.center,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      question.questionContentID
                                          .split("--")
                                          .first,
                                      style: textTheme.displayMedium,
                                    ),
                                    verticalSpace(),
                                    Text(
                                      question.questionContentID
                                          .split("--")
                                          .last,
                                      style: textTheme.displaySmall,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      verticalSpace(v: 45),
                      //Command Text
                      Text(
                        "Select the correct answer",
                        style: textTheme.displaySmall?.copyWith(
                          color: Colors.grey.shade700,
                        ),
                      ),
                      verticalSpace(),
                      //Choice List
                      Container(
                        height: size.height * 0.4,
                        child: ListView.separated(
                          itemCount: question.choiceItems.length,
                          separatorBuilder: (context, index) => verticalSpace(),
                          itemBuilder: (context, index) {
                            final item = question.choiceItems[index];
                            return Obx(() {
                              var isUserTrue = (qController.isPressed.value &&
                                  item == question.answer &&
                                  qController.selectedAnswer.value ==
                                      question.answer);
                              var isFalse = (qController.isPressed.value &&
                                  item == qController.selectedAnswer.value);
                              return InkWell(
                                onTap: () => qController.selectAnswer(item),
                                child: Card(
                                  elevation: 3,
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
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
                                      title: Center(
                                        child: Text(
                                          item,
                                          style: textTheme.displayMedium,
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
                        ),
                      ).withSymmetricPadding(v: 0, h: 20)
                    ],
                  );
                });
              }),
            );
          }),
        ],
      ),
    );
  }
}

class CustomBackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    log("Canvas Size: $size");
    var paint = Paint()
      ..color = Color(0xFFFF53A9)
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
