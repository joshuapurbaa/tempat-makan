import 'package:components/components.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'view_model/restaurant_detail_notifier.dart';
import 'widgets/detail_content.dart';

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
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Consumer<RestaurantDetailNotifier>(
        builder: (context, detail, child) {
          final state = detail.restaurantDetailState;
          switch (state) {
            case RequestState.loading:
            case RequestState.empty:
              return const LoadingIndicator();
            case RequestState.loaded:
              final restaurantDetail = detail.restaurantDetail;
              return DetailContent(restaurantDetail: restaurantDetail);
            case RequestState.error:
              return const Text('ERROR');
            default:
              return const Text('please log in later');
          }
        },
      ),
    );
  }
}
