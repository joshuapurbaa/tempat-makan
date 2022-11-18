import 'package:components/components.dart';
import 'package:flutter/material.dart';
import 'package:theme/theme.dart';

import 'widgets/detail_scrollable_content.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: size.height * 0.4,
            child: Image.network(
              'https://restaurant-api.dicoding.dev/images/medium/14',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 60,
            left: 20,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const ContainerIcon(
                backgroundColor: AppColors.greyColor2,
                icon: Icons.arrow_back_rounded,
              ),
            ),
          ),
          const DetailScrollableContent(),
        ],
      ),
      bottomSheet: Container(
        height: 80,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const ContainerIcon(
              backgroundColor: AppColors.greyColor2,
              icon: Icons.favorite_rounded,
              iconColor: AppColors.blue,
            ),
            const Gaps(w: 20),
            Expanded(
              child: TextButton(
                onPressed: () {},
                child: Text(
                  'Book Now',
                  style: Theme.of(context).textTheme.button,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
