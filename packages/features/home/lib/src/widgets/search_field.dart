import 'package:components/components.dart';
import 'package:flutter/material.dart';
import 'package:theme/theme.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              keyboardType: TextInputType.text,
              cursorColor: AppColors.darkBlue,
              decoration: InputDecoration(
                prefixIcon: const Padding(
                  padding: EdgeInsets.only(left: 20, right: 10),
                  child: Icon(
                    Icons.search_rounded,
                    size: 30,
                  ),
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 24),
                hintText: AppStrings.homeHintext,
                hintStyle: Theme.of(context).textTheme.bodyText1,
              ),
            ),
          ),
          const Gaps(w: 10),
          const ContainerIcon(
            backgroundColor: AppColors.yellow,
            icon: Icons.filter_list,
          )
        ],
      ),
    );
  }
}
