import 'dart:math';

import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';

import '../../core/constant/constant.dart';

///if v is null,width's value must be 10
horizontalSpace({double? v}) => SizedBox(
      width: v ?? 10,
    );

///if v is null,height's value must be 10
verticalSpace({double? v}) => SizedBox(
      height: v ?? 10,
    );

class RowTitle extends StatelessWidget {
  const RowTitle({
    super.key,
    required this.image,
    required this.text,
    required this.textTheme,
    this.mainAxisAlignment,
  });

  final String image;
  final String text;
  final TextTheme textTheme;
  final MainAxisAlignment? mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.center,
      children: [
        //Image
        Image.asset(
          image,
          width: 40,
          height: 40,
        ),
        horizontalSpace(v: 25),
        //text
        Text(
          text,
          style: textTheme.displaySmall,
        )
      ],
    );
  }
}

extension ExtensionOnWidget on Widget {
  Widget withPadding(EdgeInsetsGeometry padding) => Padding(
        padding: padding,
        child: this,
      );
}

extension WidgetExtension on Widget {
  Widget withSymmetricPadding({required double v, required double h}) =>
      Padding(
        padding: EdgeInsets.symmetric(vertical: v, horizontal: h),
        child: this,
      );
}

Widget containerWithBoxDecoration({required Widget child}) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.grey.shade200,
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
    child: child,
  );
}

class TryAgainOrContinueWidget extends StatelessWidget {
  const TryAgainOrContinueWidget({
    super.key,
    required this.onPressed,
    required this.alternativeText,
    required this.buttonText,
    required this.color,
  });
  final void Function()? onPressed;
  final String alternativeText;
  final String buttonText;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    return Container(
      height: ResponsiveBreakpoints.of(context).largerThan(MOBILE)
          ? size.height * 0.1
          : size.height * 0.15,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //retry alternate
          Text(
            alternativeText,
            style: textTheme.headlineMedium,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          verticalSpace(),
          SizedBox(
            height: 50,
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: color,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  )),
              onPressed: onPressed,
              child: Text(
                buttonText,
                style: textTheme.headlineMedium?.copyWith(
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    ).withPadding(EdgeInsets.only(
      left: 20,
      right: 20,
      top: 20,
    ));
  }
}

class FirebaseSnapHelper<T> extends StatelessWidget {
  FirebaseSnapHelper({
    super.key,
    required this.future,
    required this.onSuccess,
    this.onLoading,
  });

  Future<T> future;
  Function(T) onSuccess;
  Function()? onLoading;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<T>(
        future: future,
        builder: (context, AsyncSnapshot<T> snap) {
          if (snap.hasError) {
            debugPrint("Something was wrong");
            return ErrorWidget("Something was wrong!");
          }
          if (snap.hasData) {
            return onSuccess(snap.data!);
          }
          return onLoading == null
              ? const Center(
                  child: SizedBox(
                    height: 50,
                    width: 50,
                    child: CircularProgressIndicator(),
                  ),
                )
              : onLoading!();
        });
  }
}

Widget loadingWidget() => const Center(
      child: SizedBox(
        height: 50,
        width: 50,
        child: CircularProgressIndicator(),
      ),
    );
