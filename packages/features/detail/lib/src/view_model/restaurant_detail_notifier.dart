import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';

class RestaurantDetailNotifier extends ChangeNotifier {
  late RestaurantDetail _restaurantDetail;
  RestaurantDetail get restaurantDetail => _restaurantDetail;

  RequestState _restaurantDetailState = RequestState.empty;
  RequestState get restaurantDetailState => _restaurantDetailState;

  String? _message;
  String? get message => _message;

  RestaurantDetailNotifier({required this.getRestaurantDetail});
  final GetRestaurantDetail getRestaurantDetail;

  Future<void> fetchRestaurantDetail(String id) async {
    _restaurantDetailState = RequestState.loading;
    notifyListeners();

    final result = await getRestaurantDetail.execute(id);

    result.fold(
      (failure) {
        _restaurantDetailState = RequestState.error;
        _message = failure.message;
        notifyListeners();
      },
      (restaurantDetail) {
        _restaurantDetailState = RequestState.loaded;
        _restaurantDetail = restaurantDetail;
        notifyListeners();
      },
    );
  }
}
