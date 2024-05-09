import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:house_helper_rental_application/core/routers/customer_app/TestScreen.dart';
import 'package:house_helper_rental_application/features/booking/presentation/pages/history_page.dart';

class HistoryRouter extends BeamLocation<BeamState> {
  HistoryRouter(super.routeInformation);
  @override
  List<String> get pathPatterns => ['/*'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
        const BeamPage(
          key: ValueKey('history'),
          title: 'Tab B',
          type: BeamPageType.noTransition,
          child: RootScreen(
            label: 'label B',
            detailsPath: "/home",
          ),
        ),
        if (state.uri.pathSegments.length == 2)
          const BeamPage(
            key: ValueKey('history/details'),
            title: 'Details B',
            child: DetailsScreen(label: 'B'),
          ),
      ];
}
