import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const tRestaurantModel = RestaurantModel(
    id: 'rqdv5juczeskfw1e867',
    name: 'Melting Pot',
    pictureId: '14',
    city: 'Medan',
    rating: 4.2,
  );

  const tRestaurant = Restaurant(
    id: 'rqdv5juczeskfw1e867',
    name: 'Melting Pot',
    pictureId: '14',
    city: 'Medan',
    rating: 4.2,
  );

  test('Should be a subclass of Movie entitiy', () {
    final result = tRestaurantModel.toEntity();
    expect(result, tRestaurant);
  });
}
