import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/auth_controller.dart';
import '../widgets/core.dart';
import 'manage_study.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find();
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            verticalSpace(v: 20),
            CircleAvatar(
              radius: 100,
              backgroundColor: Colors.white,
              backgroundImage: NetworkImage(
                authController.authUser.value!.avatar ?? "",
              ),
            ),
            verticalSpace(),
            Text(authController.authUser.value?.userName ?? "Guest",
                style: textTheme.displayMedium),
            verticalSpace(v: 20),
            Obx(() {
              final isAdmin = authController.authUser.value!.role > 0;
              return isAdmin
                  ? Column(children: [
                      ManageItem(
                        size: size,
                        textTheme: textTheme,
                        text: "Manage STUDY",
                        onTap: () => Get.to(() => const ManageStudy()),
                      ),
                      verticalSpace(),
                      ManageItem(
                        size: size,
                        textTheme: textTheme,
                        text: "Manage PHRASES",
                        onTap: () {},
                      ),
                      verticalSpace(),
                      ManageItem(
                        size: size,
                        textTheme: textTheme,
                        text: "Manage QUIZ",
                        onTap: () {},
                      ),
                    ])
                  : const SizedBox();
            }),
          ],
        ),
      ),
    );
  }
}

class ManageItem extends StatelessWidget {
  const ManageItem({
    super.key,
    required this.size,
    required this.textTheme,
    required this.text,
    this.onTap,
  });

  final Size size;
  final TextTheme textTheme;
  final String text;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      hoverColor: Colors.grey,
      splashColor: Colors.grey,
      child: Container(
        height: 50,
        width: size.width * 0.9,
        color: Colors.white,
        padding: const EdgeInsets.all(8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                child: Text(
              text,
              style: textTheme.displayLarge,
            )),
            const Icon(
              Icons.arrow_circle_right,
              color: Colors.black,
              size: 20,
            )
          ],
        ),
      ),
    );
  }
}
