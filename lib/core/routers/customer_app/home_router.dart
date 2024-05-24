import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:house_helper_rental_application/features/booking/presentation/pages/checkout_booking_page.dart';
import 'package:house_helper_rental_application/features/booking/presentation/pages/employee_detail_booking_page.dart';
import 'package:house_helper_rental_application/features/booking/presentation/pages/home_booking_page.dart';

class HomeRouter extends BeamLocation<BeamState> {
  HomeRouter(super.routeInformation);
  @override
  List<String> get pathPatterns => ['/booking_home'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
        const BeamPage(
          key: ValueKey('booking_home'),
          title: 'Booking Home',
          type: BeamPageType.noTransition,
          child: HomeBookingPage(),
        ),
        if (state.uri.pathSegments.length == 2)
          if (state.uri.pathSegments[1] == 'employee_details')
            const BeamPage(
                key: ValueKey('booking_home/employee_details'),
                title: 'Employee details',
                child: EmployeeDetailBookingPage()),
        if (state.uri.pathSegments.length == 2)
          if (state.uri.pathSegments[1] == 'check_out')
            const BeamPage(
              key: ValueKey('booking_home/check_out'),
              title: 'Checkout',
              child: CheckoutBookingPage(),
            ),
      ];
}
