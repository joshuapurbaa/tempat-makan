import 'package:core/core.dart';
import 'package:flutter/material.dart';

class FilledButton extends StatelessWidget {
  const FilledButton({
    super.key,
    required this.buttonType,
    this.onTap,
  });

  final String buttonType;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: MaterialButton(
        onPressed: onTap,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        color: AppColors.darkBlue,
        child: Text(
          buttonType,
          style: Theme.of(context).textTheme.button,
        ),
      ),
    );
  }
}
