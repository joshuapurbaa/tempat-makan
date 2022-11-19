import 'package:app_state_manager/app_state_manager.dart';
import 'package:core/core.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
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
          effect: JumpingDotEffect(),
        ),
        MaterialButton(
          onPressed: () {
            Provider.of<AppStateManager>(context, listen: false).onBoarded();
          },
          child: Icon(
            Icons.chevron_right_rounded,
            color: AppColors.whiteColor,
            size: 40,
          ),
          padding: EdgeInsets.symmetric(vertical: 4),
          color: AppColors.darkBlue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        )
      ],
    );
  }
}
