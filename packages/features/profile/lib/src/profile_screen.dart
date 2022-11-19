import 'package:app_state_manager/app_state_manager.dart';
import 'package:components/components.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'widgets/profile_user_info.dart';
import 'widgets/profile_header.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 100,
        title: const ProfileHeader(),
      ),
      body: Column(
        children: [
          const ProfileUserInfo(),
          const Gaps(h: 30),
          ListTile(
            leading: const Icon(
              Icons.card_membership,
              size: 35,
              color: AppColors.darkBlue,
            ),
            title: Text(
              'My Membership',
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          ListTile(
            onTap: () {
              Provider.of<AppStateManager>(context, listen: false).signOut();
            },
            leading: const Icon(
              Icons.logout_rounded,
              size: 35,
              color: AppColors.darkBlue,
            ),
            title: Text(
              'Sign Out',
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
        ],
      ),
    );
  }
}
