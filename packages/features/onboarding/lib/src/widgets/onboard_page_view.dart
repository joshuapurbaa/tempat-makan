import 'package:components/components.dart';
import 'package:flutter/material.dart';

class OnboardPageView extends StatelessWidget {
  const OnboardPageView({
    Key? key,
    required this.image,
    required this.headline,
  }) : super(key: key);

  final String image;
  final String headline;

  @override
  Widget build(BuildContext context) {
    return PaddingOnlyWithDimens(
      left: 20,
      right: 20,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Image.asset(
              image,
              package: 'onboarding',
            ),
          ),
          const ResponsiveGaps(h: 40),
          Text(
            headline,
            style: Theme.of(context).textTheme.headline4,
          )
        ],
      ),
    );
  }
}
