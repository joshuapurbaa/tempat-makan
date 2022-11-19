import 'package:components/components.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theme/theme.dart';

import 'widgets/detail_scrollable_content.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({
    super.key,
    required this.index,
  });

  final String index;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final restaurant =
        Provider.of<RestaurantListNotifier>(context, listen: false)
            .restaurant[int.parse(index)];
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: size.height * 0.4,
            child: Image.network(
              restaurant.pictureId,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 60,
            left: 20,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const ContainerIcon(
                backgroundColor: AppColors.greyColor2,
                icon: Icons.arrow_back_rounded,
              ),
            ),
          ),
          DetailScrollableContent(
            restaurant: restaurant,
          ),
        ],
      ),
      bottomSheet: Container(
        height: 80,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const ContainerIcon(
              backgroundColor: AppColors.greyColor2,
              icon: Icons.favorite_rounded,
              iconColor: AppColors.blue,
            ),
            const Gaps(w: 20),
            Expanded(
              child: TextButton(
                onPressed: () {},
                child: Text(
                  'Book Now',
                  style: Theme.of(context).textTheme.button,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
