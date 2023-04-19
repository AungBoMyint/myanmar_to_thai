import 'package:flutter/material.dart';

import '../../core/constant/app_icon.dart';
import '../widgets/core.dart';

class ManageStudy extends StatefulWidget {
  const ManageStudy({super.key});

  @override
  State<ManageStudy> createState() => _ManageStudyState();
}

class _ManageStudyState extends State<ManageStudy>
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
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Manage STUDY"),
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          verticalSpace(),
          LevelRowContainer(
            textTheme: textTheme,
            text: "Beginner",
            imageIcon: AppIcon.basic,
            addOnPressed: () {
              if (mounted) {
                if (selectedAddItem == "Beginner") {
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
                    selectedAddItem = "Beginner";
                  });
                }
              }
            },
          ),
          selectedAddItem == "Beginner"
              ? AnimatedBuilder(
                  animation: animationController,
                  builder: (context, child) {
                    return Transform.scale(
                      alignment: Alignment.topCenter,
                      scale: animationController.value * 1,
                      child: child,
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                    ),
                    child: Container(
                      height: 100,
                      color: Colors.red,
                    ),
                  ),
                )
              : const SizedBox(),
          verticalSpace(),
          LevelRowContainer(
            textTheme: textTheme,
            text: "Traveler Basic",
            imageIcon: AppIcon.travellerBasic,
          ),
          verticalSpace(),
          LevelRowContainer(
            textTheme: textTheme,
            text: "Traveler Advanced",
            imageIcon: AppIcon.travellerAdvanced,
          ),
          verticalSpace(),
          LevelRowContainer(
            textTheme: textTheme,
            text: "Expat",
            imageIcon: AppIcon.expat,
          ),
        ],
      ),
    );
  }
}

class LevelRowContainer extends StatelessWidget {
  const LevelRowContainer({
    super.key,
    required this.textTheme,
    required this.text,
    required this.imageIcon,
    this.onTap,
    this.addOnPressed,
    this.editOnPressed,
    this.deleteOnPressed,
  });
  final TextTheme textTheme;
  final String text;
  final String imageIcon;
  final void Function()? onTap;
  final void Function()? addOnPressed;
  final void Function()? editOnPressed;
  final void Function()? deleteOnPressed;

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
