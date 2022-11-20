import 'package:flutter/material.dart';
import 'package:resources/resources.dart';

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
      height: AppDimens.space60,
      child: MaterialButton(
        onPressed: onTap,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimens.space15),
        ),
        color: AppPalette.darkBlue,
        child: Text(
          buttonType,
          style: Theme.of(context).textTheme.button,
        ),
      ),
    );
  }
}
