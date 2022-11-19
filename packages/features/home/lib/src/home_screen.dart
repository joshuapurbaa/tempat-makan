import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'widgets/card_home.dart';
import 'widgets/home_header.dart';
import 'widgets/search_field.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => Provider.of<RestaurantListNotifier>(context, listen: false)
        ..fetchRestaurantData(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: const HomeHeader(),
      ),
      body: Column(
        children: [
          const SearchField(),
          Consumer<RestaurantListNotifier>(
            builder: (context, data, child) {
              final state = data.restaurantState;
              switch (state) {
                case RequestState.loading:
                case RequestState.empty:
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                case RequestState.loaded:
                  return Expanded(
                    child: CardHome(restaurants: data.restaurant),
                  );
                case RequestState.error:
                  return const Text('ERROR');
                default:
                  return const Text('please log in later');
              }
            },
          ),
        ],
      ),
    );
  }
}
