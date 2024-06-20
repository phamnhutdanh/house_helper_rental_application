import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:house_helper_rental_application/features/employees/presentation/pages/report_page.dart';

class ReportRouter extends BeamLocation<BeamState> {
  ReportRouter(super.routeInformation);
  @override
  List<String> get pathPatterns => ['/task_report'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    final pages = [
      const BeamPage(
        key: ValueKey('task_report'),
        title: 'Tab C',
        type: BeamPageType.noTransition,
        child: ReportPage(),
      ),
    ];

    return pages;
  }
}
