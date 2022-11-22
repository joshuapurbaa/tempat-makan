import 'package:core/core.dart';
import 'package:flutter/material.dart';

class RestaurantSearchNotifier extends ChangeNotifier {
  final SearchRestaurant searchRestaurant;

  RestaurantSearchNotifier({required this.searchRestaurant});

  RequestState _searchState = RequestState.empty;
  RequestState get searchState => _searchState;

  List<Restaurant> _dataResult = <Restaurant>[];
  List<Restaurant> get dataResult => _dataResult;

  String _message = '';
  String get message => _message;

  Future<void> searchRestaurantQuery(String query) async {
    _searchState = RequestState.loading;
    notifyListeners();

    final result = await searchRestaurant.execute(query);
    result.fold(
      (failure) {
        _searchState = RequestState.error;
        _message = failure.message;
        notifyListeners();
      },
      (searchResult) {
        _searchState = RequestState.loaded;
        _dataResult = searchResult;
        notifyListeners();
      },
    );
  }
}
