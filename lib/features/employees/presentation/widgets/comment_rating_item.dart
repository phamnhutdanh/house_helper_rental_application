import 'package:flutter/material.dart';
import 'package:house_helper_rental_application/core/theme/app_palette.dart';
import 'package:house_helper_rental_application/core/utils/format_date.dart';
import 'package:iconly/iconly.dart';

class CommentRatingItem extends StatelessWidget {
  final String imageUri;
  final String name;
  final double score;
  final String comment;
  final DateTime commentDate;

  const CommentRatingItem({
    super.key,
    required this.imageUri,
    required this.name,
    required this.score,
    required this.comment,
    required this.commentDate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(
                  width: 60,
                  height: 60,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.network(imageUri),
                  )),
              const SizedBox(
                width: 8,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(name,
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500)),
                      Text(formatDateByhhmmDDMMYYYY(commentDate),
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500)),
                    ],
                  ),
                  Row(
                    children: [
                      Text(score.toString(),
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500)),
                      const Icon(
                        IconlyBold.star,
                        color: AppPalette.yellowStarColor,
                      )
                    ],
                  )
                ],
              )
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          Text(comment,
              // softWrap: true,
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.grey[600],
              )),
        ],
      ),
    );
  }
}
