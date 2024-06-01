import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:house_helper_rental_application/core/routers/admin_app/accounts_router.dart';
import 'package:house_helper_rental_application/core/routers/admin_app/notifs_router.dart';
import 'package:house_helper_rental_application/core/routers/admin_app/settings_router.dart';
import 'package:iconly/iconly.dart';

class AdminRouter extends StatelessWidget {
  AdminRouter({super.key});

  final routerDelegate = BeamerDelegate(
    initialPath: '/accounts_router',
    locationBuilder: RoutesLocationBuilder(
      routes: {
        '*': (context, state, data) => const ScaffoldWithBottomNavBar(),
      },
    ),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.indigo),
      routerDelegate: routerDelegate,
      routeInformationParser: BeamerParser(),
      backButtonDispatcher:
          BeamerBackButtonDispatcher(delegate: routerDelegate),
    );
  }
}

class ScaffoldWithBottomNavBar extends StatefulWidget {
  const ScaffoldWithBottomNavBar({super.key});

  @override
  State<ScaffoldWithBottomNavBar> createState() =>
      _ScaffoldWithBottomNavBarState();
}

class _ScaffoldWithBottomNavBarState extends State<ScaffoldWithBottomNavBar> {
  late int _currentIndex;

  final _routerDelegates = [
    BeamerDelegate(
      initialPath: '/accounts_router',
      locationBuilder: (routeInformation, _) {
        if (routeInformation.uri.toString().contains('/accounts_router')) {
          return AccountsRouter(routeInformation);
        }
        return NotFound(path: routeInformation.uri.toString());
      },
    ),
    BeamerDelegate(
      initialPath: '/admin_notifs',
      locationBuilder: (routeInformation, _) {
        if (routeInformation.uri.toString().contains('/admin_notifs')) {
          return NotificationRouter(routeInformation);
        }
        return NotFound(path: routeInformation.uri.toString());
      },
    ),
    BeamerDelegate(
      initialPath: '/admin_settings',
      locationBuilder: (routeInformation, _) {
        if (routeInformation.uri.toString().contains('/admin_settings')) {
          return SettingsRouter(routeInformation);
        }
        return NotFound(path: routeInformation.uri.toString());
      },
    ),
  ];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final uriString = Beamer.of(context).configuration.uri.toString();
    _currentIndex = uriString.contains('/accounts_router') ? 0 : 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: [
          Beamer(routerDelegate: _routerDelegates[0]),
          Beamer(routerDelegate: _routerDelegates[1]),
          Beamer(routerDelegate: _routerDelegates[2]),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        destinations: const [
          NavigationDestination(
              label: 'All accounts', icon: Icon(IconlyBold.profile)),
          NavigationDestination(
              label: 'Notifs', icon: Icon(IconlyBold.notification)),
          NavigationDestination(
              label: 'Settings', icon: Icon(IconlyBold.setting)),
        ],
        onDestinationSelected: (index) {
          if (index != _currentIndex) {
            setState(() => _currentIndex = index);
            _routerDelegates[_currentIndex].update(rebuild: false);
          }
        },
      ),
    );
  }
}
