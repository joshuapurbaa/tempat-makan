import 'package:app_state_manager/app_state_manager.dart';
import 'package:flutter/material.dart';

import 'tempat_makan.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appStateManager = AppStateManager();
  await appStateManager.initializeApp();
  runApp(
    TempatMakan(
      appStateManager: appStateManager,
    ),
  );
}
