import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:house_helper_rental_application/core/routers/customer_app/TestScreen.dart';
import 'package:house_helper_rental_application/features/booking/presentation/pages/home_booking_page.dart';

class HomeRouter extends BeamLocation<BeamState> {
  HomeRouter(super.routeInformation);
  @override
  List<String> get pathPatterns => [
        '/task_home',
        '/task_home/details',
      ];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    final pages = [
      const BeamPage(
        key: ValueKey('task_home'),
        title: 'Task home',
        type: BeamPageType.noTransition,
        child: RootScreen(
          label: 'label home C11',
          detailsPath: "/task_home/details",
        ),
      ),
    ];
    if (state.uri.pathSegments.length == 2) {
      pages.add(
        const BeamPage(
          key: ValueKey('task_home/details'),
          title: 'Details home C',
          child: DetailsScreen(label: 'home C11'),
        ),
      );
    }

    return pages;
  }
}
