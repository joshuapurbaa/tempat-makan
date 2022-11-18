import 'package:app_cache/app_cache.dart';
import 'package:flutter/cupertino.dart';

class AppStateManager extends ChangeNotifier {
  bool _signedIn = false;
  bool _onboardingComplete = false;
  final _appCache = AppCache();

  bool get isSignedIn => _signedIn;
  bool get isOnboardingComplete => _onboardingComplete;

  Future<void> initializeApp() async {
    _signedIn = await _appCache.isUserSignedIn();
    _onboardingComplete = await _appCache.didCompleteOnboarding();
  }

  void signIn(String username, String password) async {
    _signedIn = true;
    await _appCache.cacheUser();
    notifyListeners();
  }

  void onBoarded() async {
    _onboardingComplete = true;
    await _appCache.completeOnboarding();
    notifyListeners();
  }

  void signOut() async {
    _signedIn = false;
    _onboardingComplete = false;

    await _appCache.invalidate();
    await initializeApp();
    notifyListeners();
  }
}
