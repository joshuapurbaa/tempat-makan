import 'package:app_state_manager/app_state_manager.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:home/home.dart';
import 'package:onboarding/onboarding.dart';
import 'package:profile/profile.dart';
import 'package:search/search.dart';
import 'package:sign_in/sign_in.dart';
import 'package:detail/detail.dart';

class AppRouter {
  final AppStateManager appStateManager;

  AppRouter(this.appStateManager);

  late final router = GoRouter(
    debugLogDiagnostics: true,
    refreshListenable: appStateManager,
    initialLocation: '/signIn',
    routes: [
      GoRoute(
        name: 'signIn',
        path: '/signIn',
        builder: (context, state) => const SignInScreen(),
      ),
      GoRoute(
        name: 'onboarding',
        path: '/onboarding',
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        name: 'home',
        path: '/home',
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
            name: 'profile',
            path: 'profile',
            builder: (context, state) => const ProfileScreen(),
          ),
          GoRoute(
            name: 'search',
            path: 'search',
            builder: (context, state) => const SearchScreen(),
          ),
        ],
      ),
    ],
    redirect: (context, state) {
      final signedIn = appStateManager.isSignedIn;
      final signingIn = state.subloc == '/signIn';
      if (!signedIn) return signingIn ? null : '/signIn';

      final isOnboardingComplete = appStateManager.isOnboardingComplete;
      final onboarding = state.subloc == '/onboarding';
      if (!isOnboardingComplete) return onboarding ? null : '/onboarding';

      if (signingIn || onboarding) return '/home';
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
