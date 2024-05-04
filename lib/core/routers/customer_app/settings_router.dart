import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:house_helper_rental_application/core/routers/customer_app/TestScreen.dart';

class SettingsRouter extends BeamLocation<BeamState> {
  SettingsRouter(super.routeInformation);
  @override
  List<String> get pathPatterns => ['/*'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
        const BeamPage(
          key: ValueKey('settings'),
          title: 'Tab D',
          type: BeamPageType.noTransition,
          child: RootScreen(label: 'D', detailsPath: '/settings/details'),
        ),
        if (state.uri.pathSegments.length == 2)
          const BeamPage(
            key: ValueKey('settings/details'),
            title: 'Details D',
            child: DetailsScreen(label: 'D'),
          ),
      ];
}