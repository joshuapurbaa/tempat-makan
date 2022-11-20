import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaddingOnlyWithDimens extends StatelessWidget {
  const PaddingOnlyWithDimens({
    super.key,
    this.left = 0,
    this.top = 0,
    this.right = 0,
    this.bottom = 0,
    required this.child,
  });

  final double left;
  final double top;
  final double right;
  final double bottom;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: left.w,
        top: top.w,
        right: right.w,
        bottom: bottom.w,
      ),
      child: child,
    );
  }
}
