import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:house_helper_rental_application/features/auth/presentation/pages/settings_admin_page.dart';

class SettingsRouter extends BeamLocation<BeamState> {
  SettingsRouter(super.routeInformation);
  
  @override
  List<String> get pathPatterns => ['/admin_settings'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    final pages = [
      const BeamPage(
          key: ValueKey('admin_settings'),
          title: 'Admin setting',
          type: BeamPageType.noTransition,
          child: SettingsAdminPage()),
    ];

    return pages;
  }
}
