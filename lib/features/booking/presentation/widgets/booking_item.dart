import 'package:flutter/material.dart';
import 'package:house_helper_rental_application/core/common/entities/enum_type.dart';
import 'package:house_helper_rental_application/core/theme/app_palette.dart';
import 'package:house_helper_rental_application/core/utils/format_date.dart';
import 'package:iconly/iconly.dart';

class BookingItem extends StatelessWidget {
  final String serviceName;
  final BookingStatus bookingStatus;
  final int totalPrice;
  final DateTime bookingTime;

  const BookingItem({
    super.key,
    required this.serviceName,
    required this.bookingStatus,
    required this.totalPrice,
    required this.bookingTime,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppPalette.whiteColor, // Container color
        border: Border.all(
          color: AppPalette.borderColor, // Border color
          width: 2.0, // Border width
        ),
        borderRadius: BorderRadius.circular(8.0), // Border radius
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(width: 12),
          Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      bookingStatus == BookingStatus.PENDING
                          ? "Pending"
                          : bookingStatus == BookingStatus.ACCEPTED
                              ? "Accepted"
                              : bookingStatus == BookingStatus.CANCELED
                                  ? "Canceled"
                                  : "Completed",
                      style: TextStyle(
                          color: bookingStatus == BookingStatus.PENDING
                              ? AppPalette.thirdColor
                              : bookingStatus == BookingStatus.ACCEPTED
                                  ? AppPalette.primaryColor
                                  : bookingStatus == BookingStatus.CANCELED
                                      ? AppPalette.errorColor
                                      : AppPalette.successColor,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      serviceName,
                      style: Theme.of(context).textTheme.headlineSmall,
                    )
                  ],
                ),
              ),
              IconButton(
                  onPressed: () {}, icon: const Icon(IconlyBold.arrow_right_2)),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Icon(IconlyBold.ticket),
                    SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Total',
                              style: Theme.of(context).textTheme.labelMedium),
                          Text(
                            '$totalPrice VND',
                            style: Theme.of(context).textTheme.titleMedium,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Icon(IconlyBold.calendar),
                    SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Booking date',
                              style: Theme.of(context).textTheme.labelMedium),
                          Text(
                            formatDateByDDMMYYYY(bookingTime),
                            style: Theme.of(context).textTheme.titleMedium,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
