import 'package:flutter/material.dart';
import 'package:resources/resources.dart';

class IconBox extends StatelessWidget {
  const IconBox({
    Key? key,
    required this.imageAsset,
  }) : super(key: key);

  final String imageAsset;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppDimens.space10,
        vertical: AppDimens.space10,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(AppDimens.space10),
      ),
      child: Image.asset(
        imageAsset,
        cacheWidth: 60,
        cacheHeight: 60,
        width: AppDimens.space30,
        package: 'components',
      ),
    );
  }
}
