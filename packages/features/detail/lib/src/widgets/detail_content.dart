import 'package:components/components.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:resources/resources.dart';

import 'detail_container.dart';

class DetailContent extends StatelessWidget {
  const DetailContent({
    Key? key,
    required this.restaurantDetail,
  }) : super(key: key);

  final RestaurantDetail restaurantDetail;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: AppSize.detailImageH,
          child: Image.network(
            '${AppStrings.mediumImageUrl}${restaurantDetail.pictureId}',
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: AppSize.size60,
          left: AppSize.size20,
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const ContainerIcon(
              backgroundColor: AppPalette.greyColor2,
              icon: Icons.arrow_back_rounded,
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: DetailContainer(
            detail: restaurantDetail,
          ),
        ),
      ],
    );
  }
}
