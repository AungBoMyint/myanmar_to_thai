import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constant/app_icon.dart';
import '../widgets/core.dart';
import 'manage_content.dart';

class ManageLessons extends StatefulWidget {
  const ManageLessons({super.key});

  @override
  State<ManageLessons> createState() => _ManageLessonsState();
}

class _ManageLessonsState extends State<ManageLessons>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  var selectedAddItem = "";
  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 300,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    const twoColumnHeight = 395.0;
    const oneColumnHeight = 65.0;
    final size = MediaQuery.of(context).size;
    final level = Get.arguments["level"] as String;

    return Scaffold(
      appBar: AppBar(
        title: Text("Manage STUDY"),
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          verticalSpace(),
          Align(
            alignment: Alignment.topCenter,
            child: Text(
              level,
              style: textTheme.displayLarge,
            ),
          ),
          verticalSpace(),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 20,
              ),
              child: Text(
                "Lessons:",
                style: textTheme.displaySmall,
              ),
            ),
          ),
          verticalSpace(v: 15),
          ListView.separated(
            shrinkWrap: true,
            itemCount: 10,
            separatorBuilder: (context, index) {
              return verticalSpace();
            },
            itemBuilder: (context, index) {
              return LessonItemWidget(
                editOnPressed: () => Get.to(
                  () => const ManageContent(),
                  arguments: {"level": "Beginner", "lesson": "Numbers"},
                ),
                addOnPressed: () {
                  if (mounted) {
                    if (selectedAddItem == "$index") {
                      animationController.reverse();
                      Future.delayed(const Duration(milliseconds: 10))
                          .then((value) {
                        setState(() {
                          selectedAddItem = "";
                        });
                      });
                    } else {
                      animationController.forward();
                      setState(() {
                        selectedAddItem = "$index";
                      });
                    }
                  }
                },
                text: "Numbers",
                imageIcon: AppIcon.oneTwoThree,
                isSelected: selectedAddItem == "$index",
                twoColumnHeight: twoColumnHeight,
                oneColumnHeight: oneColumnHeight,
                animationController: animationController,
                textTheme: textTheme,
                size: size,
              );
            },
          ),
        ],
      ),
    );
  }
}

class LessonItemWidget extends StatelessWidget {
  const LessonItemWidget({
    super.key,
    required this.isSelected,
    required this.twoColumnHeight,
    required this.oneColumnHeight,
    required this.animationController,
    required this.textTheme,
    this.addOnPressed,
    required this.size,
    required this.text,
    required this.imageIcon,
    this.editOnPressed,
  });

  final bool isSelected;
  final double twoColumnHeight;
  final double oneColumnHeight;
  final AnimationController animationController;
  final TextTheme textTheme;
  final void Function()? addOnPressed;
  final void Function()? editOnPressed;
  final Size size;
  final String text;
  final String imageIcon;

  @override
  Widget build(BuildContext context) {
    final textFieldBorder = OutlineInputBorder(
      borderSide: BorderSide(
        color: Theme.of(context).primaryColor,
      ),
    );
    return AnimatedBuilder(
        animation: animationController,
        builder: (context, child) {
          return AnimatedContainer(
            duration: animationController.duration!,
            height: isSelected
                ? (animationController.value * twoColumnHeight)
                : oneColumnHeight,
            child: Stack(
              children: [
                /*  isSelected
                    ?  */
                AnimatedBuilder(
                  animation: animationController,
                  builder: (context, child) {
                    final x = animationController.value;
                    final y = animationController.value * 45;
                    return Transform.translate(
                      offset: Offset(x, y),
                      child: child,
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                    ),
                    child: AnimatedOpacity(
                      opacity: animationController.value,
                      duration: animationController.duration!,
                      child: Container(
                        height: 350,
                        color: Colors.white,
                        padding: const EdgeInsets.only(
                          top: 25,
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: SingleChildScrollView(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    verticalSpace(v: 5),
                                    Text(
                                      "Add Content",
                                      style: textTheme.displaySmall,
                                    ),
                                    verticalSpace(v: 15),
                                    TextFormField(
                                      decoration: InputDecoration(
                                        labelText: "Myanmar",
                                        border: textFieldBorder,
                                        /* disabledBorder: textFieldBorder,
                                                  focusedBorder: textFieldBorder,
                                                  enabledBorder: textFieldBorder, */
                                        floatingLabelStyle: TextStyle(
                                          color: Theme.of(context).primaryColor,
                                        ),
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.always,
                                      ),
                                    ),
                                    verticalSpace(v: 15),
                                    TextFormField(
                                      decoration: InputDecoration(
                                        labelText: "Thai",
                                        border: textFieldBorder,
                                        /* disabledBorder: textFieldBorder,
                                                  focusedBorder: textFieldBorder,
                                                  enabledBorder: textFieldBorder, */
                                        floatingLabelStyle: TextStyle(
                                          color: Theme.of(context).primaryColor,
                                        ),
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.always,
                                      ),
                                    ),
                                    verticalSpace(v: 10),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20, right: 20),
                                      child: SizedBox(
                                          height: 50,
                                          child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                InkWell(
                                                  onTap: () {},
                                                  child: Image.asset(
                                                    AppIcon.addImage,
                                                    width: 50,
                                                    height: 50,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                InkWell(
                                                  onTap: () {},
                                                  child: Image.asset(
                                                    AppIcon.addAudio,
                                                    width: 50,
                                                    height: 50,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ])),
                                    ),
                                    verticalSpace(v: 20),
                                    SizedBox(
                                      width: 100,
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              Theme.of(context).primaryColor,
                                          shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(
                                                20,
                                              ),
                                            ),
                                          ),
                                        ),
                                        child: Text(
                                          "Save",
                                          style:
                                              textTheme.displaySmall?.copyWith(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ]),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                /*  : const SizedBox(), */
                Align(
                  alignment: Alignment.topCenter,
                  child: LessonRowContainer(
                    textTheme: textTheme,
                    text: text,
                    size: size,
                    imageIcon: imageIcon,
                    addOnPressed: addOnPressed,
                    editOnPressed: editOnPressed,
                  ),
                ),
              ],
            ),
          );
        });
  }
}

class LessonRowContainer extends StatelessWidget {
  const LessonRowContainer({
    super.key,
    required this.textTheme,
    required this.text,
    required this.imageIcon,
    this.onTap,
    this.addOnPressed,
    this.editOnPressed,
    this.deleteOnPressed,
    required this.size,
  });
  final TextTheme textTheme;
  final String text;
  final String imageIcon;
  final void Function()? onTap;
  final void Function()? addOnPressed;
  final void Function()? editOnPressed;
  final void Function()? deleteOnPressed;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
      ),
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 65,
          width: size.width * 0.9,
          padding: const EdgeInsets.all(
            8,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
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
              horizontalSpace(),
              //Icon
              Image.asset(
                imageIcon,
                width: 35,
                height: 35,
              ),
              //Label Text
              horizontalSpace(
                v: 15,
              ),
              Expanded(
                child: Text(
                  text,
                  style: textTheme.displaySmall,
                ),
              ),
              horizontalSpace(
                v: 15,
              ),
              //AddIcon
              IconButton(
                onPressed: addOnPressed,
                icon: Image.asset(
                  AppIcon.plus,
                  width: 20,
                  height: 20,
                ),
              ),
              //EditIcon
              IconButton(
                onPressed: editOnPressed,
                icon: Image.asset(
                  AppIcon.edit,
                  width: 20,
                  height: 20,
                ),
              ),
              //DeleteIcon
              IconButton(
                onPressed: deleteOnPressed,
                icon: Image.asset(
                  AppIcon.delete,
                  width: 20,
                  height: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
