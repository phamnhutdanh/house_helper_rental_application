import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:house_helper_rental_application/features/accounts/presentation/pages/settings_booking_page.dart';

class SettingsRouter extends BeamLocation<BeamState> {
  SettingsRouter(super.routeInformation);
  @override
  List<String> get pathPatterns => ['/task_settings'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    final pages = [
      const BeamPage(
          key: ValueKey('task_settings'),
          title: 'Task setting',
          type: BeamPageType.noTransition,
          child: SettingsBookingPage()),
    ];

    return pages;
  }
}
