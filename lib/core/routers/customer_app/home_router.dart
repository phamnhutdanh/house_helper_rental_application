import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:house_helper_rental_application/core/objects/checkout_data_object.dart';
import 'package:house_helper_rental_application/features/booking/presentation/pages/checkout_page.dart';
import 'package:house_helper_rental_application/features/booking/presentation/pages/confirm_checkout_page.dart';
import 'package:house_helper_rental_application/features/booking/presentation/pages/home_booking_page.dart';
import 'package:house_helper_rental_application/core/common/pages/success_page.dart';
import 'package:house_helper_rental_application/features/employees/presentation/pages/employee_details_page.dart';

class HomeRouter extends BeamLocation<BeamState> {
  HomeRouter(super.routeInformation);
  @override
  List<String> get pathPatterns => [
        '/booking_home',
        'booking_home/employee_details/:employeeId',
        '/booking_home/check_out/:serviceId',
        '/booking_home/confirm_page',
        '/booking_home/success_page',
        '/booking_home/choose_address_page',
      ];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    final pages = [
      const BeamPage(
        key: ValueKey('booking_home'),
        title: 'Booking Home',
        type: BeamPageType.noTransition,
        child: HomeBookingPage(),
      ),
    ];

    if (state.uri.pathSegments.length == 3) {
      if (state.uri.pathSegments[1] == 'employee_details') {
        String? employeeId = state.pathParameters['employeeId'];
        if (employeeId != null) {
          pages.add(BeamPage(
            key: ValueKey('booking_home/employee_details/$employeeId'),
            title: 'Checkout',
            child: EmployeeDetailsPage(employeeId: employeeId),
          ));
        }
      }
    }

    if (state.uri.pathSegments.length == 3) {
      if (state.uri.pathSegments[1] == 'check_out') {
        String? serviceId = state.pathParameters['serviceId'];
        if (serviceId != null) {
          pages.add(BeamPage(
            key: ValueKey('booking_home/check_out/$serviceId'),
            title: 'Checkout',
            child: CheckoutPage(serviceId: serviceId),
          ));
        }
      }
    }

    if (state.uri.pathSegments.length == 2) {
      if (state.uri.pathSegments[1] == 'confirm_page') {
        final bookingDetailsObject = (data as BookingDetailsObject);
        pages.add(
          BeamPage(
            key: const ValueKey('booking_home/confirm_page'),
            title: 'Confirm page',
            child: ConfirmCheckoutPage(
              bookingDetailsObject: bookingDetailsObject,
            ),
          ),
        );
      }
    }

    if (state.uri.pathSegments.length == 2) {
      if (state.uri.pathSegments[1] == 'success_page') {
        pages.add(
          const BeamPage(
            key: ValueKey('booking_home/success_page'),
            title: 'Success page',
            popToNamed: '/booking_home',
            child: SuccessPage(),
          ),
        );
      }
    }

    return pages;
  }
}
