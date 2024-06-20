import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:house_helper_rental_application/features/address/presentation/pages/choose_employee_address_page.dart';
import 'package:house_helper_rental_application/features/auth/presentation/pages/edit_info_employee_page.dart';
import 'package:house_helper_rental_application/features/auth/presentation/pages/settings_task_page.dart';
import 'package:house_helper_rental_application/features/auth/presentation/pages/view_info_employee_page.dart';

class SettingsRouter extends BeamLocation<BeamState> {
  SettingsRouter(super.routeInformation);
  @override
  List<String> get pathPatterns => [
        '/task_settings',
        '/task_settings/view_info',
        '/task_settings/edit_info',
        '/task_settings/address',
      ];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    final pages = [
      const BeamPage(
        key: ValueKey('task_settings'),
        title: 'Settings',
        type: BeamPageType.noTransition,
        child: SettingsTaskPage(),
      ),
    ];

    if (state.uri.pathSegments.length == 2) {
      if (state.uri.pathSegments[1] == 'view_info') {
        pages.add(
          const BeamPage(
            key: ValueKey('task_settings/view_info'),
            title: 'View info',
            child: ViewInfoEmployeePage(),
          ),
        );
      }
    }

    if (state.uri.pathSegments.length == 2) {
      if (state.uri.pathSegments[1] == 'edit_info') {
        pages.add(
          const BeamPage(
            key: ValueKey('task_settings/edit_info'),
            title: 'Edit info',
            child: EditInfoEmployeePage(),
          ),
        );
      }
    }

    if (state.uri.pathSegments.length == 2) {
      if (state.uri.pathSegments[1] == 'address') {
        pages.add(
          const BeamPage(
            key: ValueKey('task_settings/address'),
            title: 'Address',
            child: ChooseEmployeeAddressPage(),
          ),
        );
      }
    }

    return pages;
  }
}
