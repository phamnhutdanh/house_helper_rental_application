import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:house_helper_rental_application/features/booking/presentation/pages/employee_detail_page.dart';
import 'package:house_helper_rental_application/features/booking/presentation/pages/home_page.dart';

class HomeRouter extends BeamLocation<BeamState> {
  HomeRouter(super.routeInformation);
  @override
  List<String> get pathPatterns => ['/*'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
        const BeamPage(
          key: ValueKey('booking_home'),
          title: 'Tab A',
          type: BeamPageType.noTransition,
          child: HomePage(),
        ),
        if (state.uri.pathSegments.length == 2)
          const BeamPage(
            key: ValueKey('booking_home/details'),
            title: 'Details A',
            child: EmployeeDetailPage(),
          ),
      ];
}
