import 'package:app_state_manager/app_state_manager.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:tempat_makan/app_router.dart';
import 'package:theme/theme.dart';
import 'injection.dart' as di;

void main() async {
  di.init();
  WidgetsFlutterBinding.ensureInitialized();
  final appStateManager = AppStateManager();
  await appStateManager.initializeApp();
  runApp(
    TempatMakan(
      appStateManager: appStateManager,
    ),
  );
}

class TempatMakan extends StatefulWidget {
  const TempatMakan({super.key, required this.appStateManager});
  final AppStateManager appStateManager;

  @override
  State<TempatMakan> createState() => _TempatMakanState();
}

class _TempatMakanState extends State<TempatMakan> {
  late final _appRouter = AppRouter(widget.appStateManager);
  @override
  Widget build(BuildContext context) {
    final router = _appRouter.router;
    final theme = AppTheme.light();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => widget.appStateManager,
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<RestaurantListNotifier>(),
        ),
      ],
      child: MaterialApp.router(
        builder: (context, child) => ResponsiveWrapper.builder(
          child,
          defaultScale: true,
        ),
        theme: theme,
        title: 'Tempat Makan',
        routerDelegate: router.routerDelegate,
        routeInformationParser: router.routeInformationParser,
        routeInformationProvider: router.routeInformationProvider,
      ),
    );
  }
}
