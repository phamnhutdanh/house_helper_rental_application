import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:house_helper_rental_application/core/common/entities/booking.dart';
import 'package:house_helper_rental_application/core/common/entities/enum_type.dart';
import 'package:house_helper_rental_application/features/booking/presentation/widgets/booking_item.dart';

class HistoryBookingTab extends StatelessWidget {
  final List<Booking> bookings;
  final void Function(String) onTapItem;
  const HistoryBookingTab({
    super.key,
    required this.bookings,
    required this.onTapItem,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: ListView.separated(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        itemCount: bookings.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            final bookingId = bookings[index].id ?? '';
            Beamer.of(context)
                .beamToNamed('/booking_history/booking_details/$bookingId');
            onTapItem(bookingId);
          },
          child: BookingItem(
            bookingStatus: bookings[index].status ?? BookingStatus.PENDING,
            bookingTime: bookings[index].bookingTime ?? DateTime.now(),
            serviceName: bookings[index].service!.name ?? '',
            totalPrice: bookings[index].totalPrice ?? 0,
          ),
        ),
        separatorBuilder: (_, __) => const SizedBox(height: 20),
      ),
    );
  }
}
