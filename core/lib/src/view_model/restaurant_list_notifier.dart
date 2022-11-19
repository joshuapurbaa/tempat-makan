import 'package:core/src/domain/entity/restaurant.dart';
import 'package:core/src/domain/usecases/get_restaurant_list.dart';
import 'package:core/src/utils/state_enum.dart';
import 'package:flutter/cupertino.dart';

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
