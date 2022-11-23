import 'package:components/components.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

class TitleListView extends StatelessWidget {
  const TitleListView({
    Key? key,
    required this.detail,
  }) : super(key: key);

  final RestaurantDetail detail;

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    return Row(
      textBaseline: TextBaseline.ideographic,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWithOverflow(
                text: detail.name,
                style: text.headline5,
              ),
              TextWithOverflow(
                text: detail.city,
                style: text.subtitle2,
              ),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.star_rounded,
                  color: Colors.orange,
                ),
                const GapsWithDimens(w: 5),
                TextWithOverflow(
                  text: detail.rating.toString(),
                  style: text.subtitle1,
                )
              ],
            ),
            Row(
              children: [
                Text('Style: ', style: text.subtitle2),
                Wrap(
                  children: List.generate(
                    detail.categories.length,
                    (index) => Text(
                      '${detail.categories[index].name} ',
                      style: text.subtitle2,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}
