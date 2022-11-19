import 'dart:convert';

import 'package:core/core.dart';
import 'package:core/src/data/models/restaurant_detail_model.dart';
import 'package:core/src/data/models/restaurant_detail_response.dart';
import 'package:core/src/data/models/restaurant_response.dart';
import 'package:core/src/utils/exception.dart';
import 'package:http/http.dart' as http;

abstract class RestaurantRemoteDataSource {
  Future<List<RestaurantModel>> getRestaurantList();
  Future<RestaurantDetailModel> getRestaurantDetail(String id);
}

class RestaurantRemoteDataSourceImpl implements RestaurantRemoteDataSource {
  static const baseUrl = 'https://restaurant-api.dicoding.dev';

  final http.Client client;

  RestaurantRemoteDataSourceImpl({required this.client});

  @override
  Future<List<RestaurantModel>> getRestaurantList() async {
    final response = await client.get(Uri.parse('$baseUrl/list'));

    if (response.statusCode == 200) {
      return RestaurantResponse.fromJson(json.decode(response.body))
          .restaurantList;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<RestaurantDetailModel> getRestaurantDetail(String id) async {
    final response = await client.get(Uri.parse('$baseUrl/detail/$id'));

    if (response.statusCode == 200) {
      return RestaurantDetailResponse.fromJson(json.decode(response.body))
          .restaurant;
    } else {
      throw ServerException();
    }
  }
}
