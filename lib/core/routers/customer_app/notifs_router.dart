import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:house_helper_rental_application/core/routers/customer_app/TestScreen.dart';
import 'package:house_helper_rental_application/features/booking/presentation/pages/notification_page.dart';
import 'package:house_helper_rental_application/features/booking/presentation/widgets/notificationList.dart';

class NotificationRouter extends BeamLocation<BeamState> {
  NotificationRouter(super.routeInformation);
  @override
  List<String> get pathPatterns => ['/*'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
        const BeamPage(
          key: ValueKey('notifs'),
          title: 'Tab C',
          type: BeamPageType.noTransition,
          child: RootScreen(
            label: 'label C',
            detailsPath: "/home",
          ),
        ),
        if (state.uri.pathSegments.length == 2)
          const BeamPage(
            key: ValueKey('notifs/details'),
            title: 'Details C',
            child: DetailsScreen(label: 'C'),
          ),
      ];
}
