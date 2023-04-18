import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../widgets/core.dart';

class LessonDetailPage extends StatelessWidget {
  const LessonDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final title = Get.arguments["title"] as String;
    final level = Get.arguments["level"] as String;
    final levelImage = Get.arguments["level_image"] as String;
    final lesson = Get.arguments["lesson"] as String;
    final lessonImage = Get.arguments["lesson_image"] as String;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        titleTextStyle: textTheme.displayMedium,
        centerTitle: false,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          verticalSpace(v: 20),
          //Level
          RowTitle(
            image: levelImage,
            text: level,
            textTheme: textTheme,
            mainAxisAlignment: MainAxisAlignment.end,
          ).withPadding(
            const EdgeInsets.only(
              right: 20,
            ),
          ),

          verticalSpace(v: 15),
          RowTitle(
            image: lessonImage,
            text: lesson,
            textTheme: textTheme,
          ),
        ],
      ),
    );
  }
}

class RowTitle extends StatelessWidget {
  const RowTitle({
    super.key,
    required this.image,
    required this.text,
    required this.textTheme,
    this.mainAxisAlignment,
  });

  final String image;
  final String text;
  final TextTheme textTheme;
  final MainAxisAlignment? mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.center,
      children: [
        //Image
        Image.asset(
          image,
          width: 40,
          height: 40,
        ),
        horizontalSpace(v: 25),
        //text
        Text(
          text,
          style: textTheme.displaySmall,
        )
      ],
    );
  }
}

extension ExtensionOnWidget on Widget {
  Widget withPadding(EdgeInsetsGeometry padding) => Padding(
        padding: padding,
        child: this,
      );
}
