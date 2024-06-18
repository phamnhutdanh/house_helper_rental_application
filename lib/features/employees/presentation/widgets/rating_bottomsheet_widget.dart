// import 'package:flutter/material.dart';
// import 'package:flutter_rating/flutter_rating.dart';
// import 'package:house_helper_rental_application/core/common/widgets/gradient_button.dart';
// import 'package:house_helper_rental_application/core/common/widgets/input_field.dart';
// import 'package:house_helper_rental_application/core/common/widgets/page_name.dart';
// import 'package:house_helper_rental_application/core/theme/app_palette.dart';

// class RatingBottomSheetWidget extends StatelessWidget {
//   final void Function() onPressConfirm;
//   final void Function(double) onChangeRating;
//   final TextEditingController commentController;
//   final GlobalKey<FormState> formKey;
//   final double score;

//   const RatingBottomSheetWidget({
//     super.key,
//     required this.onPressConfirm,
//     required this.onChangeRating,
//     required this.commentController,
//     required this.formKey,
//     required this.score,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: formKey,
//       child: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(28),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const PageName(textName: 'Rating'),
//               const SizedBox(height: 20),
//               StarRating(
//                   size: 40,
//                   rating: score,
//                   color: AppPalette.yellowStarColor,
//                   allowHalfRating: false,
//                   onRatingChanged: (rating) {
//                     onChangeRating(rating);
//                   }),
//               InputField(
//                 hintText: 'Leave your comment...',
//                 controller: commentController,
//               ),
//               const SizedBox(height: 20),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Expanded(
//                     flex: 5,
//                     child: GradientButton(
//                         colors: const [
//                           AppPalette.greyColor,
//                           AppPalette.greyColor,
//                         ],
//                         buttonText: 'Cancel',
//                         onPressed: () {
//                           Navigator.of(context).pop();
//                         }),
//                   ),
//                   const SizedBox(width: 20),
//                   Expanded(
//                     flex: 5,
//                     child: GradientButton(
//                       buttonText: 'Rating',
//                       onPressed: () {
//                         onPressConfirm();
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
