import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:house_helper_rental_application/core/routers/customer_app/TestScreen.dart';

class ReportRouter extends BeamLocation<BeamState> {
  ReportRouter(super.routeInformation);
  @override
  List<String> get pathPatterns => ['/*'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
        const BeamPage(
          key: ValueKey('task_report'),
          title: 'Tab C',
          type: BeamPageType.noTransition,
          child: RootScreen(
            label: 'label report C11',
            detailsPath: "/task_report/details",
          ),
        ),
        if (state.uri.pathSegments.length == 2)
          const BeamPage(
            key: ValueKey('task_report/details'),
            title: 'Details report C',
            child: DetailsScreen(label: 'report C11'),
          ),
      ];
}
