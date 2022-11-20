import 'package:components/components.dart';
import 'package:flutter/material.dart';
import 'package:resources/resources.dart';

class DetailContainerBorder extends StatelessWidget {
  const DetailContainerBorder({
    Key? key,
    required this.image,
    required this.name,
  }) : super(key: key);

  final String image;
  final String name;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 0.55;
    final text = Theme.of(context).textTheme;
    return Container(
      margin: EdgeInsets.only(right: AppDimens.space10),
      width: width,
      padding: EdgeInsets.all(AppDimens.space10),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppPalette.darkBlue.withOpacity(0.2),
        ),
        borderRadius: BorderRadius.circular(AppDimens.space20),
      ),
      child: Row(
        children: [
          SizedBox(
            height: AppDimens.space60,
            width: AppDimens.space60,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(
                AppDimens.space20,
              ),
              child: Image.asset(
                image,
                package: 'detail',
                fit: BoxFit.cover,
              ),
            ),
          ),
          const GapsWithDimens(w: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  name,
                  style: text.subtitle1,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  'Rp.20.000',
                  style: text.subtitle2,
                )
              ],
            ),
          ),
          ContainerIcon(
            backgroundColor: AppPalette.yellow,
            icon: Icons.add,
            height: AppDimens.space50,
            width: AppDimens.space50,
          )
        ],
      ),
    );
  }
}
