import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myanmar_to_thai/core/constant/app_animation.dart';
import 'package:myanmar_to_thai/core/router/router.dart';
import 'package:rive/rive.dart';
import '../widgets/core.dart';

class CompletePage extends StatelessWidget {
  const CompletePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final title = Get.arguments["title"] as String;
    final description = Get.arguments["description"] as String;
    final textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
          body: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                verticalSpace(),
                //Success Icon
                SizedBox(
                    height: size.height * 0.5,
                    width: size.width,
                    child:
                        const RiveAnimation.asset(AppAnimation.successLight)),

                //Title
                Text(
                  title,
                  style: textTheme.headlineLarge,
                ),
                verticalSpace(v: 25),
                //Description
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 20),
                  child: Text(
                    description,
                    style: textTheme.headlineMedium,
                  ),
                ),
                verticalSpace(v: 25),
              ],
            ),
          ),
          bottomNavigationBar: SizedBox(
            height: 50,
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  )),
              onPressed: () => Get.offNamedUntil(
                  levelDetailPage, ModalRoute.withName(homePage)),
              child: const Text(
                "CONTINUE",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ).withPadding(const EdgeInsets.all(20))),
    );
  }
}
