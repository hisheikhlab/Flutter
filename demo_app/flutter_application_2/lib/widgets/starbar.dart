import 'package:flutter/material.dart';

class StarRating extends StatelessWidget {
  const StarRating(
      {super.key,
      required this.rating_no,
      required this.color,
      required this.size});

  final double rating_no;
  final Color color;
  final double? size;

  @override
  Widget build(BuildContext context) {
    int stars_no = (rating_no / 2).ceil();
    List<Widget> stars = [];

    for (int i = 0; i < 5; i++) {
      if (i < stars_no) {
        stars.add(Icon(
          Icons.star,
          color: color,
          size: size,
        ));
      } else {
        stars.add(Icon(Icons.star_border, size: size, color: color));
      }
    }

    return Row(
      children: stars,
    );
  }
}
