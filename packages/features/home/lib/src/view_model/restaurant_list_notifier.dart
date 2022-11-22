import 'package:core/core.dart';
import 'package:flutter/material.dart';

class RestaurantListNotifier extends ChangeNotifier {
  List<Restaurant> _restaurant = <Restaurant>[];
  List<Restaurant> get restaurant => _restaurant;

  RequestState _restaurantState = RequestState.empty;
  RequestState get restaurantState => _restaurantState;

  String _message = '';
  String get message => _message;

  RestaurantListNotifier({required this.getRestaurantData});
  final GetRestaurantList getRestaurantData;

  Future<void> fetchRestaurantList() async {
    _restaurantState = RequestState.loading;
    notifyListeners();

    final result = await getRestaurantData.execute();

    result.fold(
      (failure) {
        _restaurantState = RequestState.error;
        _message = failure.message;
        notifyListeners();
      },
      (restaurantData) {
        _restaurantState = RequestState.loaded;
        _restaurant = restaurantData;
        notifyListeners();
      },
    );
  }
}
