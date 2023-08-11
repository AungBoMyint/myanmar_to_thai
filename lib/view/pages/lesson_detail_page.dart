import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:myanmar_to_thai/controller/lesson_detail_controller.dart';

import '../../core/constant/app_icon.dart';
import '../widgets/core.dart';

class LessonDetailPage extends StatelessWidget {
  const LessonDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final LessonDetailController ldController = Get.find();
    final title = Get.arguments["title"] as String;
    final level = Get.arguments["level"] as String;
    final levelImage = Get.arguments["level_image"] as String;
    final lesson = Get.arguments["lesson"] as String;
    final lessonImage = Get.arguments["lesson_image"] as String;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
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
        titleTextStyle: textTheme.displayMedium,
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
      body: PageView(
        controller: ldController.pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(ldController.contents.length, (index) {
          final content = ldController.contents[index];
          return LayoutBuilder(builder: (context, constraints) {
            final width = constraints.maxWidth;
            final height = constraints.maxHeight;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                verticalSpace(),
                //Thailand Flag
                Image.asset(
                  AppIcon.thailand,
                  width: 40,
                  height: 40,
                ),
                //Image
                Image.network(
                  content.image ?? "",
                  width: width * 0.5,
                  height: height * 0.3,
                ),
                verticalSpace(),
                //Thai Language
                Text(
                  content.thai,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                verticalSpace(v: 25),
                //Play Audio Icon
                Image.asset(
                  AppIcon.play,
                  width: 50,
                  height: 50,
                ),
                verticalSpace(v: 25),
                //Slow Audio Icon
                SizedBox(
                  width: 120,
                  child: containerWithBoxDecoration(
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
                  ).withSymmetricPadding(v: 5, h: 5)),
                ),
                verticalSpace(),
                //Horizontal Divider
                const Divider(
                  thickness: 0.8,
                ),
                //Myanmar Language
                verticalSpace(),

                Image.asset(
                  AppIcon.myanmar,
                  width: 40,
                  height: 40,
                ),

                verticalSpace(),
                Text(
                  content.myanmar,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            );
          });
        }),
      ),
      bottomNavigationBar: SizedBox(
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Previous Button
            Obx(() {
              return ldController.currentIndex.value != 0
                  ? Expanded(
                      flex: 3,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey.shade800,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            )),
                        onPressed: () => ldController.back(),
                        child: const Text(
                          "Previous",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    )
                  : Expanded(flex: 0, child: Container());
            }),
            horizontalSpace(),
            //Next
            Obx(() {
              return ldController.currentIndex.value !=
                      ldController.contents.length - 1
                  ? Expanded(
                      flex: 7,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.pink,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            )),
                        onPressed: () => ldController.next(),
                        child: Text(
                          "Next",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
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
    );
  }
}
