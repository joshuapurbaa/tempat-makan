import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaddingSymetricWithDimens extends StatelessWidget {
  const PaddingSymetricWithDimens({
    super.key,
    this.horizontal = 0,
    this.vertical = 0,
    required this.child,
  });

  final double horizontal;
  final double vertical;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: horizontal.w,
        vertical: vertical.h,
      ),
      child: child,
    );
  }
}
