import 'package:components/components.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'widgets/detail_scrollable_content.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({
    super.key,
    required this.id,
  });

  final String id;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  void initState() {
    super.initState();

    Future.microtask(
      () => Provider.of<RestaurantDetailNotifier>(context, listen: false)
        ..fetchRestaurantDetail(widget.id),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Consumer<RestaurantDetailNotifier>(
        builder: (context, detail, child) {
          final state = detail.restaurantDetailState;
          switch (state) {
            case RequestState.loading:
            case RequestState.empty:
              return const LoadingIndicator();
            case RequestState.loaded:
              final restaurantDetail = detail.restaurantDetail;
              return Stack(
                children: [
                  SizedBox(
                    height: size.height * 0.4,
                    child: Image.network(
                      '${AppStrings.mediumImageUrl}${restaurantDetail.pictureId}',
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
                    detail: restaurantDetail,
                  ),
                ],
              );
            case RequestState.error:
              return const Text('ERROR');
            default:
              return const Text('please log in later');
          }
        },
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
