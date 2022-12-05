class ListApi {
  ListApi._();

  // restaurant
  static const _baseUrlResto = 'https://restaurant-api.dicoding.dev';
  static const restaurantList = '$_baseUrlResto/list';
  static const restaurantDetail = '$_baseUrlResto/detail';
  static const searchRestaurant = '$_baseUrlResto/search?';

  // auth
  static const String _baseUrlAuth = 'https://reqres.in/';
  static const String register = '$_baseUrlAuth/api/register';
  static const String login = '$_baseUrlAuth/api/login';
  static const String user = '$_baseUrlAuth/api/users/2';
}
