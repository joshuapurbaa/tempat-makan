import 'package:flutter/material.dart';
import 'package:resources/resources.dart';

class TextButtonAlertDialog extends StatelessWidget {
  const TextButtonAlertDialog({
    Key? key,
    required this.textAction,
    required this.onpresed,
  }) : super(key: key);
  final String textAction;
  final VoidCallback onpresed;
  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    return TextButton(
      style: TextButton.styleFrom(
        padding: EdgeInsets.all(AppSize.size10),
        elevation: 0,
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.size20),
        ),
      ),
      onPressed: onpresed,
      child: Text(
        textAction,
        style: text.subtitle1,
      ),
    );
  }
}
