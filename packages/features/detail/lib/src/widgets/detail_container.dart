import 'package:components/components.dart';
import 'package:core/core.dart';
import 'package:detail/src/widgets/tab__view_detail.dart';
import 'package:detail/src/widgets/title_listview.dart';
import 'package:flutter/material.dart';
import 'package:resources/resources.dart';

import 'custom_buttom_bar.dart';

class DetailContainer extends StatelessWidget {
  const DetailContainer({
    Key? key,
    required this.detail,
  }) : super(key: key);

  final RestaurantDetail detail;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSize.detailContainerH,
      padding: EdgeInsets.symmetric(horizontal: AppSize.size20),
      decoration: BoxDecoration(
        color: AppPalette.whiteColor,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppSize.size40),
        ),
      ),
      child: Column(
        children: [
          const ResponsiveGaps(h: 20),
          TitleListView(detail: detail),
          TabViewDetail(detail: detail),
          const CustomBottomBar(),
        ],
      ),
    );
  }
}
