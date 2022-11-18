import 'package:components/components.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:theme/theme.dart';

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
            height: 140,
            width: 140,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: DottedBorder(
                    color: AppColors.blue,
                    strokeCap: StrokeCap.round,
                    dashPattern: const [15],
                    borderType: BorderType.Circle,
                    padding: const EdgeInsets.all(5),
                    strokeWidth: 2.5,
                    child: const CircleAvatar(
                      radius: 55,
                      backgroundImage: AssetImage(
                        AppStrings.profilePerson,
                        package: 'profile',
                      ),
                    ),
                  ),
                ),
                const Align(
                  alignment: Alignment.bottomCenter,
                  child: CircleAvatar(
                    radius: 24,
                    backgroundColor: AppColors.whiteColor,
                    child: CircleAvatar(
                      backgroundColor: AppColors.darkBlue,
                      radius: 20,
                      child: Icon(
                        Icons.edit_rounded,
                        size: 20,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          const Gaps(h: 10),
          Text(
            'Adrian',
            style: Theme.of(context).textTheme.headline6,
          ),
          const Gaps(h: 5),
          Text(
            '082212345678',
            style: Theme.of(context).textTheme.subtitle2,
          )
        ],
      ),
    );
  }
}
