import 'package:app_state_manager/app_state_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tempat_makan/app_router.dart';
import 'package:theme/theme.dart';

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
    final theme = AppTheme.dark();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => widget.appStateManager,
        )
      ],
      child: MaterialApp.router(
        theme: theme,
        title: 'Tempat Makan',
        routerDelegate: router.routerDelegate,
        routeInformationParser: router.routeInformationParser,
        routeInformationProvider: router.routeInformationProvider,
      ),
    );
  }
}
