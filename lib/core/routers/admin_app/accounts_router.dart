import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:house_helper_rental_application/features/admin/presentation/pages/accounts_page.dart';

class AccountsRouter extends BeamLocation<BeamState> {
  AccountsRouter(super.routeInformation);
  @override
  List<String> get pathPatterns => [
        '/admin_home',
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

    return pages;
  }
}
