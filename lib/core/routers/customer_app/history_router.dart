import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:house_helper_rental_application/features/booking/presentation/pages/booking_details_page.dart';
import 'package:house_helper_rental_application/features/booking/presentation/pages/history_booking_page.dart';

class HistoryRouter extends BeamLocation<BeamState> {
  HistoryRouter(super.routeInformation);
  @override
  List<String> get pathPatterns => [
        '/booking_history',
        '/booking_history/booking_details/:bookingId',
      ];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    final pages = [
      const BeamPage(
        key: ValueKey('booking_history'),
        title: 'History page',
        type: BeamPageType.noTransition,
        child: HistoryBookingPage(),
      ),
    ];

    if (state.uri.pathSegments.length == 3) {
      if (state.uri.pathSegments[1] == 'booking_details') {
        String? bookingId = state.pathParameters['bookingId'];
        if (bookingId != null) {
          pages.add(
            BeamPage(
              key: ValueKey('booking_history/booking_details'),
              title: 'Booking details',
              child: BookingDetailsPage(
                bookingId: bookingId,
              ),
            ),
          );
        }
      }
    }
    return pages;
  }
}
