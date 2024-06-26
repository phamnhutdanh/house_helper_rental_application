import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:house_helper_rental_application/features/auth/presentation/pages/notification_booking_page.dart';

class NotificationRouter extends BeamLocation<BeamState> {
  NotificationRouter(super.routeInformation);
  @override
  List<String> get pathPatterns => [
        '/booking_notifs',
      ];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    final pages = [
      const BeamPage(
        key: ValueKey('booking_notifs'),
        title: 'Notification page',
        type: BeamPageType.noTransition,
        child: NotificationBookingPage(),
      ),
    ];

    return pages;
  }
}
