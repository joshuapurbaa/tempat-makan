import 'package:app_state_manager/app_state_manager.dart';
import 'package:detail/detail.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:home/home.dart';
import 'package:onboarding/onboarding.dart';
import 'package:profile/profile.dart';
import 'package:search/search.dart';
import 'package:sign_in/sign_in.dart';
import 'package:sign_up/sign_up.dart';

enum Routes {
  root('/'),
  splashScreen('/splashScreen'),
  signIn('/signIn'),
  signUp('/signUp'),
  onBoarding('/onBoarding'),
  home('/home'),
  profile('profile'),
  search('search'),
  ;

  const Routes(this.path);
  final String path;
}

class AppRouter {
  final AppStateManager appStateManager;

  AppRouter(this.appStateManager);

  late final router = GoRouter(
    debugLogDiagnostics: true,
    refreshListenable: appStateManager,
    initialLocation: Routes.signIn.path,
    routes: [
      GoRoute(
        name: Routes.signIn.name,
        path: Routes.signIn.path,
        builder: (context, state) => const SignInScreen(),
      ),
      GoRoute(
        name: Routes.signUp.name,
        path: Routes.signUp.path,
        builder: (context, state) => const SignUpScreen(),
      ),
      GoRoute(
        name: Routes.onBoarding.name,
        path: Routes.onBoarding.path,
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        name: Routes.home.name,
        path: Routes.home.path,
        builder: (context, state) => const HomeScreen(),
        routes: [
          GoRoute(
            name: 'detail',
            path: 'detail/:id',
            builder: (context, state) {
              final id = state.params['id'] ?? 'rqdv5juczeskfw1e867';
              return DetailScreen(id: id);
            },
          ),
          GoRoute(
            name: Routes.profile.name,
            path: Routes.profile.name,
            builder: (context, state) => const ProfileScreen(),
          ),
          GoRoute(
            name: Routes.search.name,
            path: Routes.search.name,
            builder: (context, state) => const SearchScreen(),
          ),
        ],
      ),
    ],
    redirect: (context, state) {
      final signedIn = appStateManager.isSignedIn;
      final signingIn = state.subloc == Routes.signIn.path;
      if (!signedIn) return signingIn ? null : Routes.signIn.path;

      final isOnboardingComplete = appStateManager.isOnboardingComplete;
      final onboarding = state.subloc == Routes.onBoarding.path;
      if (!isOnboardingComplete) return onboarding ? null : Routes.onBoarding.path;

      if (signingIn || onboarding) return Routes.home.path;
      return null;
    },
    errorPageBuilder: (context, state) {
      return MaterialPage(
        child: Scaffold(
          body: Center(
            child: Text(
              state.error.toString(),
            ),
          ),
        ),
      );
    },
  );
}
