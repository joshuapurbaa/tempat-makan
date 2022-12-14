import 'package:app_state_manager/app_state_manager.dart';
import 'package:detail/detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home/home.dart';
import 'package:provider/provider.dart';
import 'package:resources/resources.dart';
import 'package:search/search.dart';
import 'package:tempat_makan/app_router.dart';

import 'injection.dart' as di;

void main() async {
  di.init();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => widget.appStateManager,
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<RestaurantListNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<RestaurantDetailNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<RestaurantSearchNotifier>(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(411, 898),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.light(),
            title: 'Tempat Makan',
            routerDelegate: router.routerDelegate,
            routeInformationParser: router.routeInformationParser,
            routeInformationProvider: router.routeInformationProvider,
          );
        },
      ),
    );
  }
}
