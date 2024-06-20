import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:house_helper_rental_application/features/address/presentation/pages/choose_address_page.dart';
import 'package:house_helper_rental_application/features/auth/presentation/pages/edit_info_customer_page.dart';
import 'package:house_helper_rental_application/features/auth/presentation/pages/settings_booking_page.dart';
import 'package:house_helper_rental_application/features/auth/presentation/pages/view_info_customer_page.dart';
import 'package:house_helper_rental_application/features/employees/presentation/pages/employee_details_page.dart';
import 'package:house_helper_rental_application/features/employees/presentation/pages/favorite_employee_page.dart';

class SettingsRouter extends BeamLocation<BeamState> {
  SettingsRouter(super.routeInformation);
  @override
  List<String> get pathPatterns => [
        '/booking_settings',
        '/booking_settings/view_info',
        '/booking_settings/edit_info',
        '/booking_settings/address',
        '/booking_settings/favorite_employee',
        '/booking_settings/favorite_employee/:employeeId',
      ];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    final pages = [
      const BeamPage(
        key: ValueKey('booking_settings'),
        title: 'Settings',
        type: BeamPageType.noTransition,
        child: SettingsBookingPage(),
      ),
    ];

    if (state.uri.pathSegments.length == 2) {
      if (state.uri.pathSegments[1] == 'view_info') {
        pages.add(
          const BeamPage(
            key: ValueKey('booking_settings/view_info'),
            title: 'View info',
            child: ViewInfoCustomerPage(),
          ),
        );
      }
    }

    if (state.uri.pathSegments.length == 2) {
      if (state.uri.pathSegments[1] == 'edit_info') {
        pages.add(
          const BeamPage(
            key: ValueKey('booking_settings/edit_info'),
            title: 'Edit info',
            child: EditInfoCustomerPage(),
          ),
        );
      }
    }

    if (state.uri.pathSegments.length == 2) {
      if (state.uri.pathSegments[1] == 'address') {
        pages.add(
          const BeamPage(
            key: ValueKey('booking_settings/address'),
            title: 'Address',
            child: ChooseAddressPage(),
          ),
        );
      }
    }

    if (state.uri.pathSegments.length == 2) {
      if (state.uri.pathSegments[1] == 'favorite_employee') {
        pages.add(
          const BeamPage(
            key: ValueKey('booking_settings/favorite_employee'),
            title: 'Favorite employee',
            child: FavoriteEmployeePage(),
          ),
        );
      }
    }

    if (state.uri.pathSegments.length == 3) {
      if (state.uri.pathSegments[1] == 'favorite_employee') {
        String? employeeId = state.pathParameters['employeeId'];
        if (employeeId != null) {
          pages.add(
            BeamPage(
              key: ValueKey('booking_settings/favorite_employee/$employeeId'),
              title: 'Booking details',
              child: EmployeeDetailsPage(
                employeeId: employeeId,
              ),
            ),
          );
        }
      }
    }
    return pages;
  }
}
