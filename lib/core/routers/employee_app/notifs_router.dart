import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:house_helper_rental_application/core/routers/customer_app/TestScreen.dart';

class NotificationRouter extends BeamLocation<BeamState> {
  NotificationRouter(super.routeInformation);
  @override
  List<String> get pathPatterns => ['/*'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
        const BeamPage(
          key: ValueKey('task_notifs'),
          title: 'Tab C',
          type: BeamPageType.noTransition,
          child: RootScreen(
            label: 'label noti C11',
            detailsPath: "/task_notifs/details",
          ),
        ),
        if (state.uri.pathSegments.length == 2)
          const BeamPage(
            key: ValueKey('task_notifs/details'),
            title: 'Details noti C',
            child: DetailsScreen(label: 'C11'),
          ),
      ];
}