import 'package:flutter/material.dart';

class TextWithOverflow extends StatelessWidget {
  const TextWithOverflow({
    super.key,
    required this.text,
    this.style,
    this.maxLines = 1,
    this.overFlow = TextOverflow.ellipsis,
  });

  final String text;
  final TextStyle? style;
  final int? maxLines;
  final TextOverflow? overFlow;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
      maxLines: maxLines,
      overflow: overFlow,
    );
  }
}
