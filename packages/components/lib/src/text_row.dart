import 'package:flutter/material.dart';
import 'package:resources/resources.dart';

class TextRow extends StatelessWidget {
  const TextRow({
    Key? key,
    required this.textRow1,
    required this.textRow2,
    this.onTap,
  }) : super(key: key);

  final String textRow1;
  final String textRow2;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          textRow1,
          style: text.caption,
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            textRow2,
            style: text.caption!.copyWith(
              color: AppPalette.darkBlue,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
