import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:house_helper_rental_application/core/common/widgets/gradient_button.dart';
import 'package:house_helper_rental_application/core/common/widgets/input_field.dart';
import 'package:house_helper_rental_application/core/common/widgets/loader.dart';
import 'package:house_helper_rental_application/core/common/widgets/page_name.dart';
import 'package:house_helper_rental_application/core/theme/app_palette.dart';
import 'package:house_helper_rental_application/core/utils/show_snackbar.dart';
import 'package:house_helper_rental_application/features/booking/presentation/bloc/booking_bloc.dart';
import 'package:house_helper_rental_application/features/employees/presentation/bloc/rating_bloc.dart';

void showRatingBottomSheetDialog({
  required BuildContext context,
  required String bookingId,
  required String employeeId,
  required String customerId,
}) {
  final commentController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  double score = 4;

  showModalBottomSheet(
      isDismissible: true,
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return BlocConsumer<RatingBloc, RatingState>(
              listener: (context, state) {
                if (state is RatingFailure) {
                  showSnackBar(context, state.error);
                } else if (state is CreateRatingEmployeeSuccess) {
                  context
                      .read<BookingBloc>()
                      .add(GetBookingByIdEvent(id: bookingId));
                  Navigator.of(context).pop();
                }
              },
              builder: (BuildContext context, state) {
                if (state is RatingLoading) {
                  return const Loader();
                }
                return Form(
                  key: formKey,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(28),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const PageName(textName: 'Rating'),
                          const SizedBox(height: 20),
                          StarRating(
                              size: 40,
                              rating: score,
                              color: AppPalette.yellowStarColor,
                              allowHalfRating: false,
                              onRatingChanged: (rating) {
                                setState(() {
                                  score = rating;
                                });
                              }),
                          InputField(
                            hintText: 'Leave your comment...',
                            controller: commentController,
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 5,
                                child: GradientButton(
                                    colors: const [
                                      AppPalette.greyColor,
                                      AppPalette.greyColor,
                                    ],
                                    buttonText: 'Cancel',
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    }),
                              ),
                              const SizedBox(width: 20),
                              Expanded(
                                flex: 5,
                                child: GradientButton(
                                  buttonText: 'Rating',
                                  onPressed: () {
                                    context.read<RatingBloc>().add(
                                          CreateRatingEmployeeEvent(
                                            score: score,
                                            comment:
                                                commentController.text.trim(),
                                            bookingId: bookingId,
                                            employeeId: employeeId,
                                            customerId: customerId,
                                          ),
                                        );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
        );
      });
}
