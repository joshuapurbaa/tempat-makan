import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:core/core.dart';
import 'package:http/http.dart' as http;

import '../datasources.dart';

abstract class RestaurantRemoteDataSource {
  Future<List<RestaurantModel>> getRestaurantList();
  Future<RestaurantDetailModel> getRestaurantDetail(String id);
  Future<List<RestaurantModel>> searchRestaurant(String query);
}

class RestaurantRemoteDataSourceImpl implements RestaurantRemoteDataSource {
  final http.Client client;

  RestaurantRemoteDataSourceImpl({required this.client});

  @override
  Future<List<RestaurantModel>> getRestaurantList() async {
    try {
      final response = await client
          .get(Uri.parse(ListApi.restaurantList))
          .timeout(const Duration(seconds: 10));
      final result = RestaurantResponse.fromJson(json.decode(response.body));

      if (response.statusCode == 200) {
        return result.restaurantList;
      } else {
        throw ServerException(result.error.toString());
      }
    } on ServerException catch (e) {
      throw ServerException(e.message);
    } on SocketException catch (e) {
      throw SocketException(e.message);
    } on TimeoutException catch (e) {
      throw TimeoutException(e.message);
    }
  }

  @override
  Future<RestaurantDetailModel> getRestaurantDetail(String id) async {
    try {
      final response = await client
          .get(Uri.parse('${ListApi.restaurantDetail}/$id'))
          .timeout(const Duration(seconds: 10));
      final result =
          RestaurantDetailResponse.fromJson(json.decode(response.body));
      if (response.statusCode == 200) {
        return result.restaurant;
      } else {
        throw ServerException(result.error.toString());
      }
    } on ServerException catch (e) {
      throw ServerException(e.message);
    } on SocketException catch (e) {
      throw SocketException(e.message);
    } on TimeoutException catch (e) {
      throw TimeoutException(e.message);
    }
  }

  @override
  Future<List<RestaurantModel>> searchRestaurant(String query) async {
    try {
      final response = await client
          .get(Uri.parse('${ListApi.searchRestaurant}q=$query'))
          .timeout(const Duration(seconds: 10));
      final result = RestaurantResponse.fromJson(json.decode(response.body));
      if (response.statusCode == 200) {
        return result.restaurantList;
      } else {
        throw ServerException(result.error.toString());
      }
    } on ServerException catch (e) {
      throw ServerException(e.message);
    } on SocketException catch (e) {
      throw SocketException(e.message);
    } on TimeoutException catch (e) {
      throw TimeoutException(e.message);
    }
  }
}
