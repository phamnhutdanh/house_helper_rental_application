import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:house_helper_rental_application/features/booking/presentation/pages/booking_details_emp_page.dart';
import 'package:house_helper_rental_application/features/booking/presentation/pages/task_booking_page.dart';

class HomeRouter extends BeamLocation<BeamState> {
  HomeRouter(super.routeInformation);
  @override
  List<String> get pathPatterns => [
        '/task_home',
        '/task_home/booking_details/:bookingId',
      ];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    final pages = [
      const BeamPage(
        key: ValueKey('task_home'),
        title: 'Home page',
        type: BeamPageType.noTransition,
        child: TaskBookingPage(),
      ),
    ];
    if (state.uri.pathSegments.length == 3) {
      if (state.uri.pathSegments[1] == 'booking_details') {
        String? bookingId = state.pathParameters['bookingId'];
        if (bookingId != null) {
          pages.add(
            BeamPage(
              key: ValueKey('task_home/booking_details/$bookingId'),
              title: 'Booking details',
              child: BookingDetailsEmpPage(bookingId: bookingId),
            ),
          );
        }
      }
    }

    return pages;
  }
}
