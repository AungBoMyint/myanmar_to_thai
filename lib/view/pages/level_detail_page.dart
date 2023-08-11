import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myanmar_to_thai/core/router/router.dart';

import '../../core/constant/app_icon.dart';
import '../../core/mock/mock_data.dart';
import '../widgets/core.dart';
import 'lesson_detail_page.dart';

class LevelDetailPage extends StatelessWidget {
  const LevelDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final title = Get.arguments["title"] as String;
    final level = Get.arguments["level"] as String;
    final levelImage = Get.arguments["level_image"] as String;
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          verticalSpace(v: 20),
          //Level
          /*    Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Image
              Image.asset(
                levelImage,
                width: 40,
                height: 40,
              ),
              horizontalSpace(v: 25),
              //text
              Text(
                level,
                style: textTheme.displaySmall,
              )
            ],
          ),
          verticalSpace(v: 20),
           */
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: GridView.builder(
                itemCount: lessonList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.9,
                ),
                itemBuilder: (context, index) {
                  final lesson = lessonList[index];
                  return InkWell(
                    onTap: () => Get.toNamed(
                      lessonDetailPage,
                      arguments: {
                        "title": title,
                        "level": level,
                        "level_image": levelImage,
                        "lesson": lesson.title,
                        "lesson_image": lesson.image,
                      },
                    ),
                    child: Card(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              15,
                            ),
                          ),
                          side: BorderSide(
                            color: Colors.grey,
                          )),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              lesson.image,
                              width: 40,
                              height: 40,
                            ),
                            verticalSpace(),
                            Text(
                              lesson.title,
                              style: textTheme.headlineSmall,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
