import 'package:flutter/material.dart';
import 'package:house_helper_rental_application/core/common/entities/booking.dart';
import 'package:house_helper_rental_application/core/common/entities/enum_type.dart';
import 'package:house_helper_rental_application/core/common/entities/service.dart';
import 'package:house_helper_rental_application/features/booking/presentation/pages/generic_tab_page.dart';
import 'package:house_helper_rental_application/features/booking/presentation/widgets/history_booking_tab.dart';
import 'package:house_helper_rental_application/features/booking/presentation/widgets/tab_item.dart';

class HistoryBookingPage extends StatefulWidget {
  const HistoryBookingPage({super.key});

  @override
  State<HistoryBookingPage> createState() => _HistoryBookingPageState();
}

class _HistoryBookingPageState extends State<HistoryBookingPage> {
  final List<Booking> bookings = [
    Booking(
      id: '1',
      status: BookingStatus.PENDING,
      bookingTime: DateTime.now(),
      service: Service(
        id: 'service1',
        name: 'name service 1',
      ),
      totalPrice: 120,
    ),
    Booking(
      id: '2',
      status: BookingStatus.CANCELED,
      bookingTime: DateTime.now(),
      service: Service(
        id: 'service2',
        name: 'name service 2',
      ),
      totalPrice: 240,
    ),
    Booking(
      id: '1',
      status: BookingStatus.ACCEPTED,
      bookingTime: DateTime.now(),
      service: Service(
        id: 'service1',
        name: 'name service 1',
      ),
      totalPrice: 120,
    ),
    Booking(
      id: '3',
      status: BookingStatus.COMPLETED,
      bookingTime: DateTime.now(),
      service: Service(
        id: 'service3',
        name: 'name service 3',
      ),
      totalPrice: 360,
    ),
    Booking(
      id: '4',
      status: BookingStatus.COMPLETED,
      bookingTime: DateTime.now(),
      service: Service(
        id: 'service4',
        name: 'name service 4',
      ),
      totalPrice: 460,
    ),
    Booking(
      id: '5',
      status: BookingStatus.PENDING,
      bookingTime: DateTime.now(),
      service: Service(
        id: 'service5',
        name: 'name service 5',
      ),
      totalPrice: 560,
    ),
    Booking(
      id: '6',
      status: BookingStatus.CANCELED,
      bookingTime: DateTime.now(),
      service: Service(
        id: 'service6',
        name: 'name service 6',
      ),
      totalPrice: 660,
    ),
  ];

  late List<Booking> pendingBookings = bookings
      .where((element) => element.status == BookingStatus.PENDING)
      .toList();

  late List<Booking> cancelBookings = bookings
      .where((element) => element.status == BookingStatus.CANCELED)
      .toList();

  late List<Booking> completeBookings = bookings
      .where((element) => element.status == BookingStatus.COMPLETED)
      .toList();

  late List<Booking> acceptBookings = bookings
      .where((element) => element.status == BookingStatus.ACCEPTED)
      .toList();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GenericTabPage(
      title: 'History',
      isScrollableTab: true,
      tabs: [
        TabItem(title: 'ALL', count: bookings.length),
        TabItem(title: 'PENDING', count: pendingBookings.length),
        TabItem(title: 'ACCEPTED', count: acceptBookings.length),
        TabItem(title: 'CANCELED', count: cancelBookings.length),
        TabItem(title: 'COMPLETED', count: completeBookings.length),
      ],
      children: [
        HistoryBookingTab(
          bookings: bookings,
          onTapItem: (bookingId) {},
        ),
        HistoryBookingTab(
          bookings: pendingBookings,
          onTapItem: (bookingId) {},
        ),
        HistoryBookingTab(
          bookings: acceptBookings,
          onTapItem: (bookingId) {},
        ),
        HistoryBookingTab(
          bookings: cancelBookings,
          onTapItem: (bookingId) {},
        ),
        HistoryBookingTab(
          bookings: completeBookings,
          onTapItem: (bookingId) {},
        ),
      ],
    );
  }
}
