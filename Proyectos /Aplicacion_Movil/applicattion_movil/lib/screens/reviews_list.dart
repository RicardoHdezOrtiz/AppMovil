import 'package:flutter/material.dart';
import 'car_details_page.dart';

class ReviewsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (_, index) => SizedBox(width: 18),
        itemBuilder: (_, index) {
          if (index == reviewImages.length) {
            return Image.network(addImageUrl);
          }
          return Image.network(reviewImages[index]);
        },
        itemCount: reviewImages.length + 1,
      ),
    );
  }
}