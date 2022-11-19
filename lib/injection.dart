import 'package:core/core.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

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

  // usecases
  locator.registerLazySingleton(() => GetRestaurantList(locator()));
  locator.registerLazySingleton(() => GetRestaurantDetail(locator()));

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
