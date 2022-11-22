import 'package:components/components.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resources/resources.dart';
import 'package:search/search.dart';

class SearchField extends StatefulWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  TextEditingController searchController = TextEditingController();
  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PaddingOnlyWithDimens(
      right: 20,
      bottom: 10,
      child: Row(
        children: [
          Expanded(
            child: TextField(
              onSubmitted: (query) {
                Provider.of<RestaurantSearchNotifier>(context, listen: false)
                    .searchRestaurantQuery(query);
              },
              autofocus: true,
              textInputAction: TextInputAction.search,
              keyboardType: TextInputType.text,
              cursorColor: AppPalette.darkBlue,
              minLines: 1,
              maxLines: 1,
              decoration: InputDecoration(
                prefixIcon: PaddingOnlyWithDimens(
                  left: 20,
                  right: 10,
                  child: Icon(
                    Icons.search_rounded,
                    size: AppDimens.space20,
                  ),
                ),
                contentPadding: EdgeInsets.zero,
                hintText: AppStrings.homeHintext,
                hintStyle: Theme.of(context)
                    .textTheme
                    .caption
                    ?.copyWith(color: Colors.grey),
                suffixIcon: IconButton(
                  splashRadius: 5,
                  onPressed: () {
                    setState(() {
                      searchController.clear();
                    });
                  },
                  icon: const Icon(
                    Icons.close_rounded,
                    color: AppPalette.darkBlue,
                  ),
                ),
              ),
            ),
          ),
          const GapsWithDimens(w: 20),
          Icon(
            Icons.email_rounded,
            size: AppDimens.space30,
          ),
          const GapsWithDimens(w: 20),
          Icon(
            Icons.notifications,
            size: AppDimens.space30,
          )
        ],
      ),
    );
  }
}
