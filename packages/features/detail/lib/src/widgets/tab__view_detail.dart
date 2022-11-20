import 'package:components/components.dart';
import 'package:core/core.dart';
import 'package:detail/src/widgets/text_button_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:resources/resources.dart';

import 'food_and_drink_listview.dart';

class TabViewDetail extends StatelessWidget {
  const TabViewDetail({Key? key, required this.detail}) : super(key: key);
  final RestaurantDetail detail;
  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    return SizedBox(
      height: AppDimens.detailTabViewH,
      child: DefaultTabController(
        initialIndex: 0,
        length: 2,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TabBar(
              tabs: const [
                Tab(text: 'Detail'),
                Tab(text: 'Reviews'),
              ],
              labelColor: AppPalette.darkBlue,
              indicatorColor: AppPalette.blue,
              labelStyle: text.caption,
              indicatorSize: TabBarIndicatorSize.label,
              unselectedLabelColor: AppPalette.darkBlue.withOpacity(0.5),
              indicatorWeight: 4,
            ),
            Expanded(
              child: TabBarView(
                children: [
                  ListView(
                    padding: EdgeInsets.only(top: AppDimens.space10),
                    children: [
                      ReadMoreText(
                        detail.description,
                        style: text.bodyText2,
                        trimLines: 5,
                        moreStyle:
                            text.bodyText2?.copyWith(color: AppPalette.blue),
                      ),
                      const GapsWithDimens(h: 20),
                      FoodAndDrinkListView(
                        menus: detail.menus,
                      ),
                      const GapsWithDimens(h: 20),
                    ],
                  ),
                  Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          padding: EdgeInsets.only(
                            top: AppDimens.space10,
                            bottom: AppDimens.space20,
                          ),
                          itemCount: detail.customerReviews.length,
                          itemBuilder: (context, index) {
                            final review = detail.customerReviews[index];
                            return ListTile(
                              leading: const CircleAvatar(
                                backgroundImage: NetworkImage(
                                  AppStrings.noImage,
                                ),
                              ),
                              title: Text(
                                review.name,
                                style: text.subtitle1,
                              ),
                              subtitle: Text(
                                review.review,
                                style: text.subtitle2,
                              ),
                              trailing: Text(review.date),
                            );
                          },
                        ),
                      ),
                      TextButton.icon(
                        onPressed: () {
                          showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    AppDimens.space20,
                                  ),
                                ),
                                title: Text(
                                  'Add review',
                                  style: text.headline6,
                                ),
                                content: SizedBox(
                                  width: AppDimens.detailAlertW,
                                  child: TextFormField(
                                    maxLines: null,
                                    decoration: InputDecoration(
                                      hintText: 'Add here',
                                      hintStyle: text.caption?.copyWith(
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                ),
                                actionsPadding: EdgeInsets.symmetric(
                                  horizontal: AppDimens.space20,
                                  vertical: AppDimens.space20,
                                ),
                                actions: [
                                  TextButtonAlertDialog(
                                    textAction: 'Cencel',
                                    onpresed: () => Navigator.pop(context),
                                  ),
                                  const GapsWithDimens(w: 10),
                                  TextButtonAlertDialog(
                                    textAction: 'Add',
                                    onpresed: () => Navigator.pop(context),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        style: TextButton.styleFrom(elevation: 0),
                        icon: const Icon(
                          Icons.edit_note_rounded,
                          color: AppPalette.whiteColor,
                        ),
                        label: Text(
                          'Add your review',
                          style: text.button,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
