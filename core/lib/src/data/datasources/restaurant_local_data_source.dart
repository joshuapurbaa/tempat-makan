import 'dart:convert';

import 'package:core/src/data/models/restaurant_model.dart';
import 'package:core/src/data/models/restaurant_response.dart';
import 'package:flutter/services.dart';

abstract class RestaurantLocalDataSource {
  Future<List<RestaurantModel>> getRestaurantList();
}

class RestaurantLocalDataSourceImpl implements RestaurantLocalDataSource {
  @override
  Future<List<RestaurantModel>> getRestaurantList() async {
    String jsonString = await rootBundle.loadString('assets/raw-data.json');
    final restaurant =
        RestaurantResponse.fromJson(json.decode(jsonString)).restaurants;
    return restaurant;
  }
}
