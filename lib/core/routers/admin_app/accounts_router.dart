import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:house_helper_rental_application/features/accounts/presentation/pages/accounts_page.dart';
import 'package:house_helper_rental_application/features/accounts/presentation/pages/customer_detail_page.dart';
import 'package:house_helper_rental_application/features/accounts/presentation/pages/employee_detail_page.dart';

class AccountsRouter extends BeamLocation<BeamState> {
  AccountsRouter(super.routeInformation);
  @override
  List<String> get pathPatterns => [
        '/admin_home',
        '/admin_home/employee_details/:employeeId',
        '/admin_home/customer_details/:customerId',
      ];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    final pages = [
      const BeamPage(
        key: ValueKey('admin_home'),
        title: 'Admin home',
        type: BeamPageType.noTransition,
        child: AccountsPage(),
      ),
    ];

    if (state.uri.pathSegments.length == 3) {
      if (state.uri.pathSegments[1] == 'employee_details') {
        String? employeeId = state.pathParameters['employeeId'];
        if (employeeId != null) {
          pages.add(BeamPage(
            key: ValueKey('admin_home/employee_details/$employeeId'),
            title: 'Employee',
            child: EmployeeDetailPage(accountId: employeeId),
          ));
        }
      }
    }

    if (state.uri.pathSegments.length == 3) {
      if (state.uri.pathSegments[1] == 'customer_details') {
        String? customerId = state.pathParameters['customerId'];
        if (customerId != null) {
          pages.add(BeamPage(
            key: ValueKey('admin_home/customer_details/$customerId'),
            title: 'Customer',
            child: CustomerDetailPage(accountId: customerId),
          ));
        }
      }
    }

    return pages;
  }
}
