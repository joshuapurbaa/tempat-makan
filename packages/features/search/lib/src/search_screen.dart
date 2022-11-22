import 'package:components/components.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resources/resources.dart';
import 'package:search/src/widgets/card_search.dart';
import 'package:search/src/widgets/search_field.dart';

import 'view_model/search_restaurant_notifier.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: AppDimens.space70,
        title: const SearchField(),
      ),
      body: Consumer<RestaurantSearchNotifier>(
        builder: (context, data, child) {
          final state = data.searchState;
          switch (state) {
            case RequestState.empty:
              return const Center(
                child: Text('No Result'),
              );
            case RequestState.loading:
              return const PaddingOnlyWithDimens(
                top: 250,
                child: LoadingIndicator(),
              );
            case RequestState.loaded:
              return CardSearch(restaurants: data.dataResult);
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
