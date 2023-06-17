import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RatingWidget extends StatelessWidget {
  final double rating;
  final Color ratingTextColor;

  const RatingWidget({
    required this.rating,
    required this.ratingTextColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _filledStar(),
        SizedBox(
          width: 5,
        ),
        _filledStar(),
        SizedBox(
          width: 5,
        ),
        _filledStar(),
        SizedBox(
          width: 5,
        ),
        _filledStar(),
        SizedBox(
          width: 5,
        ),
        _unfilledStar(),
        SizedBox(
          width: 5,
        ),
        Text(
          "$rating",
          style: GoogleFonts.urbanist(
            textStyle: TextStyle(
              color: ratingTextColor,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        )
      ],
    );
  }

  Widget _filledStar() {
    return Icon(
      Icons.star,
      color: Colors.amber,
      size: 10,
    );
  }

  Widget _unfilledStar() {
    return Icon(
      Icons.star,
      color: Colors.grey,
      size: 10,
    );
  }
}
