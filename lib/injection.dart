import 'package:core/core.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void init() {
  // provider
  locator.registerFactory(
    () => RestaurantListNotifier(
      getRestaurantData: locator(),
    ),
  );

  // usecases
  locator.registerLazySingleton(() => GetRestaurantData(locator()));

  // repository
  locator.registerLazySingleton<RestaurantRepository>(
    () => RestaurantRepositoryImpl(
      restaurantLocalDataSource: locator(),
    ),
  );

  // data sources
  locator.registerLazySingleton<RestaurantLocalDataSource>(
    () => RestaurantLocalDataSourceImpl(),
  );
}
