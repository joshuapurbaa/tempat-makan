import 'package:app_state_manager/app_state_manager.dart';
import 'package:components/components.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resources/resources.dart';

import 'widgets/profile_user_info.dart';
import 'widgets/profile_header.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: AppDimens.toolbarH,
        title: const ProfileHeader(),
      ),
      body: Column(
        children: [
          const ProfileUserInfo(),
          const GapsWithDimens(h: 30),
          ListTile(
            leading: Icon(
              Icons.card_membership,
              size: AppDimens.space35,
              color: AppPalette.darkBlue,
            ),
            title: Text(
              'My Membership',
              style: text.subtitle1,
            ),
          ),
          ListTile(
            onTap: () {
              Provider.of<AppStateManager>(context, listen: false).signOut();
            },
            leading: Icon(
              Icons.logout_rounded,
              size: AppDimens.space35,
              color: AppPalette.darkBlue,
            ),
            title: Text(
              'Sign Out',
              style: text.subtitle1,
            ),
          ),
        ],
      ),
    );
  }
}
