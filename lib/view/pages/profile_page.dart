import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/core.dart';
import 'manage_study.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
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
            const CircleAvatar(
              radius: 100,
              backgroundColor: Colors.white,
            ),
            verticalSpace(),
            Text("David Willian", style: textTheme.displayMedium),
            verticalSpace(v: 20),
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
        width: size.width * 0.8,
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
