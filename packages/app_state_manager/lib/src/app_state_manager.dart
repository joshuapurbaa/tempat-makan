import 'package:app_cache/app_cache.dart';
import 'package:flutter/cupertino.dart';

class AppStateManager extends ChangeNotifier {
  bool _loggedIn = false;
  bool _onboardingComplete = false;
  final _appCache = AppCache();

  bool get isLoggedIn => _loggedIn;
  bool get isOnboardingComplete => _onboardingComplete;

  Future<void> initializeApp() async {
    _loggedIn = await _appCache.isUserLoggedIn();
    _onboardingComplete = await _appCache.didCompleteOnboarding();
  }

  void login(String username, String password) async {
    _loggedIn = true;
    await _appCache.cacheUser();
    notifyListeners();
  }

  void onBoarded() async {
    _onboardingComplete = true;
    await _appCache.completeOnboarding();
    notifyListeners();
  }

  void logout() async {
    _loggedIn = false;
    _onboardingComplete = false;

    await _appCache.invalidate();
    await initializeApp();
    notifyListeners();
  }
}
