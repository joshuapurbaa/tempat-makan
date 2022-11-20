import 'package:flutter/material.dart';
import 'package:resources/resources.dart';

class ContainerIcon extends StatelessWidget {
  const ContainerIcon({
    Key? key,
    required this.backgroundColor,
    required this.icon,
    this.height = 60,
    this.width = 60,
    this.iconColor = AppPalette.darkBlue,
  }) : super(key: key);

  final Color backgroundColor;
  final IconData icon;
  final double height;
  final double width;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppDimens.space20),
      ),
      elevation: 4,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(AppDimens.space20),
        ),
        child: Icon(
          icon,
          color: iconColor,
          size: AppDimens.space30,
        ),
      ),
    );
  }
}
