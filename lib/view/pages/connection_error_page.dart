import 'package:flutter/material.dart';
import 'package:myanmar_to_thai/core/constant/app_icon.dart';
import 'package:myanmar_to_thai/view/widgets/core.dart';

class ConnectionErrorPage extends StatelessWidget {
  const ConnectionErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Image
            Image.asset(
              AppIcon.noInternet,
              height: size.height * 0.3,
              width: size.width * 0.8,
            ),
            verticalSpace(v: 25),
            Text(
              "Oops....",
              style: textTheme.displayLarge,
            ),
            verticalSpace(v: 25),
            //Text
            Text(
              "Please check your internet and try again!.",
              style: textTheme.displaySmall,
            ),
            verticalSpace(v: 25),
            //Try Again
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    )),
                onPressed: () {},
                child: const Text(
                  "Try Again",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
