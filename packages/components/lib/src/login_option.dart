import 'package:components/components.dart';
import 'package:flutter/material.dart';

class LoginOption extends StatelessWidget {
  const LoginOption({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: const [
        IconBox(
          imageAsset: AppStrings.googleIcon,
        ),
        IconBox(
          imageAsset: AppStrings.facebookIcon,
        ),
      ],
    );
  }
}
