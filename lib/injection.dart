import 'package:core/core.dart';
import 'package:detail/detail.dart';
import 'package:get_it/get_it.dart';
import 'package:home/home.dart';
import 'package:http/http.dart' as http;
import 'package:search/search.dart';

final locator = GetIt.instance;

void init() {
  // provider
  locator.registerFactory(
    () => RestaurantListNotifier(
      getRestaurantData: locator(),
    ),
  );
  locator.registerFactory(
    () => RestaurantDetailNotifier(
      getRestaurantDetail: locator(),
    ),
  );
  locator.registerFactory(
    () => RestaurantSearchNotifier(
      searchRestaurant: locator(),
    ),
  );

  // usecases
  locator.registerLazySingleton(() => GetRestaurantList(locator()));
  locator.registerLazySingleton(() => GetRestaurantDetail(locator()));
  locator.registerLazySingleton(() => SearchRestaurant(locator()));

  // repository
  locator.registerLazySingleton<RestaurantRepository>(
    () => RestaurantRepositoryImpl(
      remoteDataSource: locator(),
    ),
  );

  // data sources
  locator.registerLazySingleton<RestaurantRemoteDataSource>(
    () => RestaurantRemoteDataSourceImpl(client: locator()),
  );

  // external
  locator.registerLazySingleton(() => http.Client());
}
