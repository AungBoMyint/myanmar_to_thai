import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constant/app_icon.dart';
import '../../core/mock/mock_data.dart';
import '../widgets/core.dart';
import 'level_detail_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(
            left: 20,
          ),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              border: Border.all(
                color: Theme.of(context).primaryColor,
                width: 2,
              ),
            ),
            child: Image.asset(
              AppIcon.book,
              width: 15,
              height: 15,
            ),
          ),
        ),
        leadingWidth: 60,
        title: const Text(
          "Myanmar To Thai",
        ),
        centerTitle: false,
        titleTextStyle: textTheme.displayMedium,
      ),
      body: ListView(
        /*  shrinkWrap: true, */
        physics: const BouncingScrollPhysics(),
        children: [
          verticalSpace(),
          Container(
            color: Colors.white,
            padding: const EdgeInsets.only(
              top: 15,
              bottom: 15,
              left: 25,
              right: 25,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //STUDY
                Text(
                  "STUDY",
                  style: textTheme.headlineMedium,
                ),

                LayoutBuilder(builder: (context, constrains) {
                  return Wrap(
                    children: [
                      RowContainer(
                        onTap: () => Get.to(
                          () => LevelDetailPage(),
                          arguments: {
                            "title": 'STUDY',
                            "level": 'Beginner',
                            "level_image": AppIcon.basic,
                          },
                        ),
                        textTheme: textTheme,
                        iconImage: AppIcon.basic,
                        text: "Beginner",
                        width: constrains.maxWidth * 0.45,
                      ),
                      horizontalSpace(),
                      RowContainer(
                        textTheme: textTheme,
                        iconImage: AppIcon.travellerBasic,
                        text: "Traveler Basics",
                        width: constrains.maxWidth * 0.5,
                      ),
                      verticalSpace(),
                      RowContainer(
                        textTheme: textTheme,
                        iconImage: AppIcon.travellerAdvanced,
                        text: "Traveler Advanced",
                        width: constrains.maxWidth * 0.55,
                      ),
                      horizontalSpace(),
                      RowContainer(
                        textTheme: textTheme,
                        iconImage: AppIcon.expat,
                        text: "Expat",
                        width: constrains.maxWidth * 0.38,
                      ),
                    ],
                  );
                }),
              ],
            ),
          ),
          verticalSpace(),
          //PHRASES
          Container(
            /*  height: 150, */
            width: size.width,
            color: Colors.white,
            padding: const EdgeInsets.only(
              top: 15,
              bottom: 15,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: Text(
                    "PHRASES",
                    style: textTheme.headlineMedium,
                  ),
                ),
                verticalSpace(),
                SizedBox(
                  height: 120,
                  child: ListView.separated(
                    itemCount: phrasesUiModelList.length,
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    separatorBuilder: (context, index) => horizontalSpace(),
                    itemBuilder: (context, index) {
                      final uiModel = phrasesUiModelList[index];
                      return Padding(
                        padding: EdgeInsets.only(left: index == 0 ? 25 : 0),
                        child: SizedBox(
                          width: size.width * 0.35,
                          child: Card(
                            color: uiModel.color,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(
                                  15,
                                ),
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  uiModel.imageIcon,
                                  width: 40,
                                  height: 40,
                                ),
                                verticalSpace(),
                                Text(
                                  uiModel.text,
                                  style: textTheme.headlineSmall?.copyWith(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          verticalSpace(),
          //QUIZ
          Container(
            /*  height: 150, */
            width: size.width,
            color: Colors.white,
            padding: const EdgeInsets.only(
              left: 25,
              right: 25,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpace(),
                Text(
                  "QUIZ",
                  style: textTheme.headlineMedium,
                ),
                verticalSpace(),
                ListView.separated(
                  shrinkWrap: true,
                  primary: false,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: phrasesUiModelList.length,
                  separatorBuilder: (context, index) => verticalSpace(),
                  itemBuilder: (context, index) {
                    final uiModel = phrasesUiModelList[index];
                    return Container(
                      height: 65,
                      padding: const EdgeInsets.all(
                        8,
                      ),
                      decoration: BoxDecoration(
                        color: uiModel.color,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(
                            15,
                          ),
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          horizontalSpace(),
                          //Icon
                          Image.asset(
                            uiModel.imageIcon,
                            width: 35,
                            height: 35,
                          ),
                          //Label Text
                          horizontalSpace(
                            v: 15,
                          ),
                          Text(
                            uiModel.text,
                            style: textTheme.headlineSmall?.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class RowContainer extends StatelessWidget {
  const RowContainer({
    super.key,
    required this.textTheme,
    required this.iconImage,
    required this.text,
    required this.width,
    this.onTap,
  });

  final TextTheme textTheme;
  final String iconImage;
  final String text;
  final double width;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 50,
          width: width,
          padding: const EdgeInsets.all(
            8,
          ),
          decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).primaryColor,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(
                15,
              ),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //Icon
              Image.asset(
                iconImage,
                width: 30,
                height: 30,
              ),
              //Label Text
              horizontalSpace(
                v: 15,
              ),
              Text(
                text,
                style: textTheme.headlineSmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}