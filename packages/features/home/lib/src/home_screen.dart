import 'package:flutter/material.dart';

import 'widgets/card_home.dart';
import 'widgets/home_header.dart';
import 'widgets/search_field.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: const HomeHeader(),
      ),
      body: Column(
        children: const [
          SearchField(),
          CardHome(),
        ],
      ),
    );
  }
}
