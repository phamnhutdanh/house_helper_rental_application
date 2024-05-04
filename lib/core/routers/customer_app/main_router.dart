import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:house_helper_rental_application/core/routers/customer_app/history_router.dart';
import 'package:house_helper_rental_application/core/routers/customer_app/home_router.dart';
import 'package:house_helper_rental_application/core/routers/customer_app/notifs_router.dart';
import 'package:house_helper_rental_application/core/routers/customer_app/settings_router.dart';
import 'package:iconly/iconly.dart';

class MainRouter extends StatelessWidget {
  MainRouter({super.key});

  final routerDelegate = BeamerDelegate(
    initialPath: '/home',
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
      backButtonDispatcher: BeamerBackButtonDispatcher(
        delegate: routerDelegate,
      ),
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
      initialPath: '/home',
      locationBuilder: (routeInformation, _) {
        if (routeInformation.uri.toString().contains('/home')) {
          return HomeRouter(routeInformation);
        }
        return NotFound(path: routeInformation.uri.toString());
      },
    ),
    BeamerDelegate(
      initialPath: '/history',
      locationBuilder: (routeInformation, _) {
        if (routeInformation.uri.toString().contains('/history')) {
          return HistoryRouter(routeInformation);
        }
        return NotFound(path: routeInformation.uri.toString());
      },
    ),
    BeamerDelegate(
      initialPath: '/notifs',
      locationBuilder: (routeInformation, _) {
        if (routeInformation.uri.toString().contains('/notifs')) {
          return NotificationRouter(routeInformation);
        }
        return NotFound(path: routeInformation.uri.toString());
      },
    ),
    BeamerDelegate(
      initialPath: '/settings',
      locationBuilder: (routeInformation, _) {
        if (routeInformation.uri.toString().contains('/settings')) {
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
    _currentIndex = uriString.contains('/home') ? 0 : 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: [
          Beamer(
            routerDelegate: _routerDelegates[0],
          ),
          Beamer(
            routerDelegate: _routerDelegates[1],
          ),
          Beamer(
            routerDelegate: _routerDelegates[2],
          ),
          Beamer(
            routerDelegate: _routerDelegates[3],
          ),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        destinations: const [
          NavigationDestination(label: 'Home', icon: Icon(IconlyBold.home)),
          NavigationDestination(label: 'History', icon: Icon(IconlyBold.paper)),
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
