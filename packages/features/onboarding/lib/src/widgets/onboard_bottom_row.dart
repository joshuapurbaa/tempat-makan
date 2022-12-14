import 'package:app_state_manager/app_state_manager.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:resources/resources.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardBottomRow extends StatelessWidget {
  const OnboardBottomRow({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SmoothPageIndicator(
          controller: controller,
          count: 3,
          effect: const JumpingDotEffect(),
        ),
        MaterialButton(
          onPressed: () {
            Provider.of<AppStateManager>(context, listen: false).onBoarded();
          },
          padding: EdgeInsets.symmetric(vertical: AppSize.size4),
          color: AppPalette.darkBlue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.size50),
          ),
          child: Icon(
            Icons.chevron_right_rounded,
            color: AppPalette.whiteColor,
            size: AppSize.size40,
          ),
        )
      ],
    );
  }
}
