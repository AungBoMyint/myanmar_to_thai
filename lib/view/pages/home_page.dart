import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myanmar_to_thai/controller/data_controller.dart';
import 'package:myanmar_to_thai/core/constant/constant.dart';
import 'package:myanmar_to_thai/model/api/class_scope.dart';
import 'package:myanmar_to_thai/model/api/class_scope_all.dart';
import 'package:myanmar_to_thai/model/api/level_all.dart';
import 'package:myanmar_to_thai/model/api/parser/level_all_parser.dart';
import '../../controller/auth_controller.dart';
import '../../core/constant/app_icon.dart';
import '../../core/router/router.dart';
import '../../model/api/parser/class_scope_all_parser.dart';
import '../../service/api/client.dart';
import '../widgets/core.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<ClassScopeAll?>? classScopeFuture;

  @override
  void initState() {
    getClassScope();
    super.initState();
  }

  Future<void> getClassScope() async {
    classScopeFuture = RequestREST(
      endPoint: classscope,
    ).executeGet<ClassScopeAll>(ClassScopeAllParser());
  }

  @override
  Widget build(BuildContext context) {
    final DataController dController = Get.find();
    final AuthController authController = Get.find();
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(
            left: 20,
          ),
          child: CircleAvatar(
            radius: 18,
            backgroundColor: Theme.of(context).primaryColor,
            child: Image.asset(
              AppIcon.book,
              /*  width: 35,
              height: 35, */
              fit: BoxFit.fill,
            ),
          ), /* Container(
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
          ), */
        ),
        leadingWidth: 60,
        title: const Text(
          "MyanThai LearnUp by KZN",
        ),
        centerTitle: false,
        titleTextStyle: textTheme.displayMedium,
        /*   actions: [
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
       */
      ),
      body: RefreshIndicator(
        onRefresh: () {
          setState(() {
            getClassScope();
          });
          return Future.delayed(Duration.zero);
        },
        child: FirebaseSnapHelper<ClassScopeAll?>(
            future: classScopeFuture!,
            onSuccess: (classScopeAll) {
              return ListView.separated(
                /*  shrinkWrap: true, */
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: classScopeAll?.data.length ?? 0,
                separatorBuilder: (context, index) => verticalSpace(),
                itemBuilder: (context, index) {
                  final classScope = classScopeAll?.data[index];
                  return [
                    FirstStyleWidget(
                        textTheme: textTheme, classScope: classScope),
                    SecondStyleWidget(
                        size: size,
                        textTheme: textTheme,
                        classScope: classScope),
                    ThirdStyleWidget(
                        size: size,
                        textTheme: textTheme,
                        classScope: classScope)
                  ][index % 3];
                },
              );
            }),
      ),
    );
  }
}

class ThirdStyleWidget extends StatelessWidget {
  const ThirdStyleWidget({
    super.key,
    required this.size,
    required this.textTheme,
    required this.classScope,
  });

  final Size size;
  final TextTheme textTheme;
  final ClassScope? classScope;

  @override
  Widget build(BuildContext context) {
    final DataController dController = Get.find();
    return Container(
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
            classScope?.name ?? "",
            style: textTheme.headlineMedium,
          ),
          verticalSpace(),
          FirebaseSnapHelper<LevelAll?>(
              future: RequestREST(
                endPoint: level,
                queryParameter: {
                  "classId": classScope?.id,
                },
              ).executeGet<LevelAll>(LevelAllParser()),
              onSuccess: (levelAll) {
                return ListView.separated(
                  shrinkWrap: true,
                  primary: false,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: levelAll?.data.length ?? 0,
                  separatorBuilder: (context, index) => verticalSpace(),
                  itemBuilder: (context, index) {
                    final level = levelAll?.data[index];
                    return InkWell(
                      onTap: () {
                        dController.setClassLevel(
                            classScope: classScope!, level: level!);
                        Get.toNamed(
                          levelDetailPage,
                        );
                      },
                      child: Container(
                        height: 65,
                        padding: const EdgeInsets.all(
                          8,
                        ),
                        decoration: BoxDecoration(
                          color: colors[index % 4],
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
                            Image.network(
                              level?.image ?? "",
                              width: 55,
                              height: 55,
                              fit: BoxFit.cover,
                              frameBuilder: (c, w, _, __) {
                                return ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                  child: w,
                                );
                              },
                            ),
                            //Label Text
                            horizontalSpace(
                              v: 15,
                            ),
                            Text(
                              level?.name ?? "",
                              style: textTheme.headlineSmall?.copyWith(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }),
          verticalSpace(),
        ],
      ),
    );
  }
}

class SecondStyleWidget extends StatelessWidget {
  const SecondStyleWidget({
    super.key,
    required this.size,
    required this.textTheme,
    required this.classScope,
  });

  final Size size;
  final TextTheme textTheme;
  final ClassScope? classScope;

  @override
  Widget build(BuildContext context) {
    final DataController dController = Get.find();
    return Container(
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
              classScope?.name ?? "",
              style: textTheme.headlineMedium,
            ),
          ),
          verticalSpace(),
          FirebaseSnapHelper<LevelAll?>(
              future: RequestREST(
                endPoint: level,
                queryParameter: {
                  "classId": classScope?.id,
                },
              ).executeGet<LevelAll>(LevelAllParser()),
              onSuccess: (levelAll) {
                return SizedBox(
                  height: 120,
                  child: ListView.separated(
                    itemCount: levelAll?.data.length ?? 0,
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    separatorBuilder: (context, index) => horizontalSpace(),
                    itemBuilder: (context, index) {
                      final level = levelAll?.data[index];
                      return Padding(
                        padding: EdgeInsets.only(left: index == 0 ? 25 : 0),
                        child: SizedBox(
                          width: size.width * 0.35,
                          child: InkWell(
                            onTap: () {
                              dController.setClassLevel(
                                  classScope: classScope!, level: level!);
                              Get.toNamed(
                                levelDetailPage,
                              );
                            },
                            child: Card(
                              color: colors[index % 4],
                              shape: const RoundedRectangleBorder(
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
                                  Image.network(
                                    level?.image ?? "",
                                    width: 55,
                                    height: 55,
                                    fit: BoxFit.cover,
                                    frameBuilder: (c, w, _, __) {
                                      return ClipRRect(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5)),
                                        child: w,
                                      );
                                    },
                                  ),
                                  verticalSpace(),
                                  Text(
                                    level?.name ?? "",
                                    style: textTheme.headlineSmall?.copyWith(
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              }),
        ],
      ),
    );
  }
}

class FirstStyleWidget extends StatelessWidget {
  const FirstStyleWidget({
    super.key,
    required this.textTheme,
    required this.classScope,
  });

  final TextTheme textTheme;
  final ClassScope? classScope;

  @override
  Widget build(BuildContext context) {
    final DataController dController = Get.find();
    return Container(
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
            classScope?.name ?? "",
            style: textTheme.headlineMedium,
          ),

          FirebaseSnapHelper<LevelAll?>(
              future: RequestREST(
                endPoint: level,
                queryParameter: {
                  "classId": classScope?.id,
                },
              ).executeGet<LevelAll>(LevelAllParser()),
              onSuccess: (levelAll) {
                return LayoutBuilder(builder: (context, constrains) {
                  return Wrap(
                    children: levelAll?.data
                            .map(
                              (e) => Padding(
                                padding: const EdgeInsets.only(right: 15),
                                child: RowContainer(
                                  onTap: () {
                                    dController.setClassLevel(
                                        classScope: classScope!, level: e);
                                    Get.toNamed(
                                      levelDetailPage,
                                    );
                                  },
                                  textTheme: textTheme,
                                  iconImage: e.image ?? "",
                                  text: e.name,
                                  width: constrains.maxWidth * 0.45,
                                ),
                              ),
                            )
                            .toList() ??
                        [Container()],
                  );
                });
              }),
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
              Image.network(
                iconImage,
                width: 55,
                height: 55,
                fit: BoxFit.cover,
                frameBuilder: (c, w, _, __) {
                  return ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    child: w,
                  );
                },
              ),
              //Label Text
              horizontalSpace(
                v: 10,
              ),
              Expanded(
                child: Text(
                  text,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.headlineSmall,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
