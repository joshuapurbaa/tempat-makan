import 'package:flutter/material.dart';

class IconBox extends StatelessWidget {
  const IconBox({
    Key? key,
    required this.imageAsset,
  }) : super(key: key);

  final String imageAsset;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(10),
      ),
      // cacheWidth & cacheHeight untuk mengatasi image yang oversized
      child: Image.asset(
        imageAsset,
        cacheWidth: 60,
        cacheHeight: 60,
        width: 30,
        package: 'components',
      ),
    );
  }
}
