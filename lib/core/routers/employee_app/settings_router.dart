import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:house_helper_rental_application/core/routers/customer_app/TestScreen.dart';
import 'package:house_helper_rental_application/features/booking/presentation/pages/settings_page.dart';


class SettingsRouter extends BeamLocation<BeamState> {
  SettingsRouter(super.routeInformation);
  @override
  List<String> get pathPatterns => ['/*'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
        const BeamPage(
          key: ValueKey('task_settings'),
          title: 'Tab C',
          type: BeamPageType.noTransition,
          child: SettingsPage()
        ),
        if (state.uri.pathSegments.length == 2)
          const BeamPage(
            key: ValueKey('task_settings/details'),
            title: 'Details C',
            child: DetailsScreen(label: 'C11'),
          ),
      ];
}
