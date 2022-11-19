import 'package:components/components.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

class DetailContainerBorder extends StatelessWidget {
  const DetailContainerBorder({
    Key? key,
    required this.image,
    required this.name,
  }) : super(key: key);

  final String image;
  final String name;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 0.75;
    return Container(
      margin: const EdgeInsets.only(right: 10),
      width: width,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.darkBlue.withOpacity(0.2),
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          SizedBox(
            height: 60,
            width: 60,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                image,
                package: 'detail',
                fit: BoxFit.cover,
              ),
            ),
          ),
          const Gaps(w: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: Theme.of(context).textTheme.subtitle1,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  'Rp.20.000',
                  style: Theme.of(context).textTheme.subtitle2,
                )
              ],
            ),
          ),
          const ContainerIcon(
            backgroundColor: AppColors.yellow,
            icon: Icons.add,
            height: 50,
            width: 50,
          )
        ],
      ),
    );
  }
}
