import 'package:components/components.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:resources/resources.dart';

class ProfileUserInfo extends StatelessWidget {
  const ProfileUserInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: AppDimens.profileUserH,
            width: AppDimens.profileUserH,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: DottedBorder(
                    color: AppPalette.blue,
                    strokeCap: StrokeCap.round,
                    dashPattern: const [15],
                    borderType: BorderType.Circle,
                    padding: EdgeInsets.all(AppDimens.space5),
                    strokeWidth: 2.5,
                    child: CircleAvatar(
                      radius: AppDimens.space55,
                      backgroundImage: const AssetImage(
                        AppStrings.profilePerson,
                        package: 'profile',
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: CircleAvatar(
                    radius: AppDimens.space24,
                    backgroundColor: AppPalette.whiteColor,
                    child: CircleAvatar(
                      backgroundColor: AppPalette.darkBlue,
                      radius: AppDimens.space20,
                      child: Icon(
                        Icons.edit_rounded,
                        size: AppDimens.space20,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          const GapsWithDimens(h: 10),
          Text(
            'Adrian',
            style: Theme.of(context).textTheme.headline6,
          ),
          const GapsWithDimens(h: 5),
          Text(
            '082212345678',
            style: Theme.of(context).textTheme.subtitle2,
          )
        ],
      ),
    );
  }
}
