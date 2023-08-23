import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:shimmer/shimmer.dart';

import '../pages/home_page.dart';
import 'core.dart';

class HomeShimmerLoading extends StatelessWidget {
  const HomeShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      /*  shrinkWrap: true, */
      physics: const AlwaysScrollableScrollPhysics(),
      itemCount: 3,
      separatorBuilder: (context, index) => verticalSpace(),
      itemBuilder: (context, index) {
        return [
          const FirstStyleShimmerLoading(
            isHome: true,
          ),
          const SecondStyleShimmerLoading(
            isHome: true,
          ),
          const ThirdStyleShimmerLoading(
            isHome: true,
          ),
        ][index % 3];
      },
    );
  }
}

class FirstStyleShimmerLoading extends StatelessWidget {
  const FirstStyleShimmerLoading({super.key, required this.isHome});
  final bool isHome;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 15,
        bottom: 15,
        left: 25,
        right: 25,
      ),
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //STUDY
            isHome
                ? Container(
                    height: 20,
                    width: 100,
                    color: Colors.white,
                  )
                : const SizedBox(),

            LayoutBuilder(builder: (context, constrains) {
              return Wrap(
                children: ["1", "2", "3", "4"]
                    .map(
                      (e) => Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: RowContainerShimmerLoading(
                            width: constrains.maxWidth * 0.45),
                      ),
                    )
                    .toList(),
              );
            }),
          ],
        ),
      ),
    );
  }
}

class SecondStyleShimmerLoading extends StatelessWidget {
  const SecondStyleShimmerLoading({super.key, required this.isHome});

  final bool isHome;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.only(
        top: 15,
        bottom: 15,
        left: 25,
        right: 25,
      ),
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //STUDY
            isHome
                ? Container(
                    height: 20,
                    width: 50,
                    color: Colors.white,
                  )
                : const SizedBox(),

            SizedBox(
              height: 120,
              child: ListView.separated(
                itemCount: 4,
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                separatorBuilder: (context, index) => horizontalSpace(),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(left: index == 0 ? 25 : 0),
                    child: SizedBox(
                      width: size.width * 0.35,
                      child: InkWell(
                        onTap: () {},
                        child: Card(
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
                              Container(
                                color: Colors.white,
                                width: 55,
                                height: 55,
                              ),
                              verticalSpace(),
                              Container(
                                color: Colors.white,
                                width: 80,
                                height: 20,
                              ),
                            ],
                          ),
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
    );
  }
}

class ThirdStyleShimmerLoading extends StatelessWidget {
  const ThirdStyleShimmerLoading({super.key, required this.isHome});

  final bool isHome;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 15,
        bottom: 15,
        left: 25,
        right: 25,
      ),
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //STUDY
            isHome
                ? Container(
                    height: 20,
                    width: 50,
                    color: Colors.white,
                  )
                : const SizedBox(),

            ListView.separated(
              shrinkWrap: true,
              primary: false,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 4,
              separatorBuilder: (context, index) => verticalSpace(),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {},
                  child: Container(
                    height: 65,
                    padding: const EdgeInsets.all(
                      8,
                    ),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
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
                        Container(
                          color: Colors.white,
                          width: 55,
                          height: 55,
                        ),
                        //Label Text
                        horizontalSpace(
                          v: 15,
                        ),
                        Container(
                          height: 20,
                          width: 80,
                          color: Colors.white,
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
    );
  }
}

class LevelDetailShimmerLoading extends StatelessWidget {
  const LevelDetailShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
        ),
        child: GridView.builder(
          itemCount: 3,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.9,
          ),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {},
              child: LayoutBuilder(builder: (context, constraints) {
                return const Card(
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
                  child: SizedBox(),
                );
              }),
            );
          },
        ),
      ),
    );
  }
}

class LessonDetailShimmerLoading extends StatelessWidget {
  const LessonDetailShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.white,
      child: LayoutBuilder(builder: (context, constraints) {
        final width = constraints.maxWidth;
        final height = constraints.maxHeight;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            verticalSpace(),
            //Thailand Flag
            Container(
              color: Colors.white,
              width: 40,
              height: 40,
            ),
            verticalSpace(),
            //Image
            Container(
              color: Colors.white,
              width: width * 0.5,
              height: height * 0.3,
            ),
            verticalSpace(),
            //Thai Language
            Container(
              color: Colors.white,
              height: 20,
              width: 80,
            ),
            verticalSpace(v: 25),
            //Play Audio Icon
            Container(
              color: Colors.white,
              width: 50,
              height: 50,
            ),
            verticalSpace(v: 25),
            //Slow Audio Icon
            SizedBox(
              width: 120,
              child: containerWithBoxDecoration(
                  child: InkWell(
                onTap: () {},
                child: Row(
                  children: [
                    Container(
                      color: Colors.white,
                      width: 30,
                      height: 30,
                    ),
                    horizontalSpace(v: 8),
                    Container(
                      color: Colors.white,
                      height: 20,
                      width: 50,
                    ),
                  ],
                ).withSymmetricPadding(v: 5, h: 5),
              )),
            ),
            verticalSpace(),
            //Horizontal Divider
            const Divider(
              thickness: 0.8,
            ),
            //Myanmar Language
            verticalSpace(),

            Container(
              color: Colors.white,
              width: 40,
              height: 40,
            ),

            verticalSpace(),
            Container(
              height: 20,
              width: 50,
              color: Colors.white,
            ),
          ],
        );
      }),
    );
  }
}
