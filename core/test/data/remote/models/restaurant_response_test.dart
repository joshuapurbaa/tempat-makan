import 'dart:convert';

import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../dummy_data/json_reader.dart';

void main() {
  const tRestaurantModel = RestaurantModel(
    id: 'rqdv5juczeskfw1e867',
    name: 'Melting Pot',
    pictureId: '14',
    city: 'Medan',
    rating: 4.2,
  );
  const tRestaurantResponseModel = RestaurantResponse(
    restaurantList: <RestaurantModel>[tRestaurantModel],
    error: false,
  );

  group('FromJson', () {
    test('Should return a valid model from Json', () {
      // Arrange
      final Map<String, dynamic> jsonMap =
          json.decode(readJson('dummy_data/restaurant_list.json'));
      // Act
      final result = RestaurantResponse.fromJson(jsonMap);
      // Assert
      expect(result, tRestaurantResponseModel);
    });
  });
}
