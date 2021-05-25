import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:show_tv/common/colors.dart';

Widget buildRating(double votes) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      RatingBarIndicator(
        itemSize: 21,
        rating: (votes / 2) - 0.5,
        itemBuilder: (context, index) {
          return (index + 1) <= ((votes / 2)) ? Icon(
            Icons.star,
            color: AppColors.colorYellow,
          ) : Icon(
            Icons.star_border,
            color: AppColors.colorYellow,
          );
        },
      ),
      Padding(
        padding: const EdgeInsets.only(left: 6.0),
        child: Text(
          votes.toString(),
          style: Get.theme.textTheme.caption,
        ),
      ),
    ],
  );
}