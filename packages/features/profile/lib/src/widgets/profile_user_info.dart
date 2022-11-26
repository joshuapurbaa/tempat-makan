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
            height: AppSize.profileUserH,
            width: AppSize.profileUserH,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: DottedBorder(
                    color: AppPalette.blue,
                    strokeCap: StrokeCap.round,
                    dashPattern: const [15],
                    borderType: BorderType.Circle,
                    padding: EdgeInsets.all(AppSize.size5),
                    strokeWidth: 2.5,
                    child: CircleAvatar(
                      radius: AppSize.size55,
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
                    radius: AppSize.size24,
                    backgroundColor: AppPalette.whiteColor,
                    child: CircleAvatar(
                      backgroundColor: AppPalette.darkBlue,
                      radius: AppSize.size20,
                      child: Icon(
                        Icons.edit_rounded,
                        size: AppSize.size20,
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
