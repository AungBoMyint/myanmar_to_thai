import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/auth_controller.dart';
import '../../core/constant/app_icon.dart';
import '../../core/mock/mock_data.dart';
import '../../core/router/router.dart';
import '../widgets/core.dart';
import 'level_detail_page.dart';
import 'profile_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find();
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
        actions: [
          IconButton(
            onPressed: () {
              //first check user is auth or not
              if (!authController.checkUserAuth()) {
                Get.dialog(
                  Center(
                    child: SizedBox(
                      height: 180,
                      width: size.width * 0.6,
                      child: Card(
                          child: Padding(
                        padding: const EdgeInsets.only(
                          left: 25,
                          right: 25,
                          top: 10,
                          bottom: 10,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            //Title
                            Text(
                              "Sign In Option",
                              style: textTheme.displayMedium,
                            ),
                            verticalSpace(v: 20),
                            SignInButton(
                              textTheme: textTheme,
                              onPressed: () {
                                Get.back();
                                authController.signInWithGoogle(profilePage);
                              },
                              color: Color(0xFF2EB118),
                              text: "Google",
                              imageIcon: AppIcon.google,
                            ),
                            verticalSpace(v: 2),
                            SignInButton(
                              textTheme: textTheme,
                              onPressed: () {},
                              color: Color(0xFFD68BE3),
                              text: "Guest",
                              imageIcon: AppIcon.guest,
                            ),
                          ],
                        ),
                      )),
                    ),
                  ),
                  barrierColor: Colors.transparent,
                );
              } else {
                Get.toNamed(profilePage);
              }
            },
            icon: Image.asset(
              AppIcon.user,
              width: 25,
              height: 25,
            ),
          )
        ],
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
                        onTap: () => Get.toNamed(
                          levelDetailPage,
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
                    return InkWell(
                      onTap: () => Get.toNamed(
                        questionPage,
                        arguments: {
                          "lesson": uiModel.text,
                          "lesson_image": uiModel.imageIcon,
                        },
                      ),
                      child: Container(
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

class SignInButton extends StatelessWidget {
  const SignInButton({
    super.key,
    required this.textTheme,
    required this.onPressed,
    required this.color,
    required this.text,
    required this.imageIcon,
  });

  final TextTheme textTheme;
  final void Function()? onPressed;
  final Color color;
  final String text;
  final String imageIcon;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              20,
            ),
          ),
        ),
      ),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: textTheme.displaySmall?.copyWith(
                color: Colors.white,
              ),
            ),
            horizontalSpace(v: 20),
            Image.asset(
              imageIcon,
              width: 20,
              height: 20,
            )
          ]),
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
