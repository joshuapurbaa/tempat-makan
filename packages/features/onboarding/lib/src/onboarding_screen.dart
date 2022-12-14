import 'package:components/components.dart';
import 'package:flutter/material.dart';
import 'package:resources/resources.dart';

import 'widgets/onboard_bottom_row.dart';
import 'widgets/onboard_page_view.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: controller,
                children: const [
                  OnboardPageView(
                    image: AppStrings.onboard1,
                    headline: AppStrings.onboardHeadline1,
                  ),
                  OnboardPageView(
                    image: AppStrings.onboard2,
                    headline: AppStrings.onboardHeadline2,
                  ),
                  OnboardPageView(
                    image: AppStrings.onboard3,
                    headline: AppStrings.onboardHeadline3,
                  ),
                ],
              ),
            ),
            PaddingSymetricWithDimens(
              horizontal: 20,
              vertical: 20,
              child: OnboardBottomRow(controller: controller),
            ),
          ],
        ),
      ),
    );
  }
}
