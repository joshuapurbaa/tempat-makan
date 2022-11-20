import 'package:components/components.dart';
import 'package:flutter/material.dart';
import 'package:resources/resources.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PaddingSymetricWithDimens(
      horizontal: 20,
      child: Row(
        children: [
          Expanded(
            child: TextField(
              keyboardType: TextInputType.text,
              cursorColor: AppPalette.darkBlue,
              decoration: InputDecoration(
                prefixIcon: PaddingOnlyWithDimens(
                  left: 20,
                  right: 10,
                  child: Icon(
                    Icons.search_rounded,
                    size: AppDimens.space30,
                  ),
                ),
                contentPadding: EdgeInsets.symmetric(
                  vertical: AppDimens.space24,
                ),
                hintText: AppStrings.homeHintext,
                hintStyle: Theme.of(context)
                    .textTheme
                    .bodyText1
                    ?.copyWith(color: Colors.grey),
              ),
            ),
          ),
          const GapsWithDimens(w: 10),
          const ContainerIcon(
            backgroundColor: AppPalette.yellow,
            icon: Icons.filter_list,
          )
        ],
      ),
    );
  }
}
