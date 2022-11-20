import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GapsWithDimens extends StatelessWidget {
  const GapsWithDimens({
    super.key,
    this.h = 0.0,
    this.w = 0.0,
  });

  final double h;
  final double w;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: h.h,
      width: w.w,
    );
  }
}
