import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:house_helper_rental_application/features/booking/presentation/pages/home_page.dart';
import 'package:house_helper_rental_application/features/bottom_nav/cubit/nav_booking_cubit.dart';
import 'package:iconly/iconly.dart';

class BookingWrapper extends StatefulWidget {
  const BookingWrapper({super.key});

  @override
  State<BookingWrapper> createState() => _BookingWrapperState();
}

class _BookingWrapperState extends State<BookingWrapper> {
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  /// Top Level Pages
  final List<Widget> topLevelPages = const [
    HomePage(),
    SingleChildScrollView(
      child: Text("Fav"),
    ),
    SingleChildScrollView(
      child: Text("Noti"),
    ),
    SingleChildScrollView(
      child: Text("Profile"),
    ),
  ];

  /// on Page Changed
  void onPageChanged(int page) {
    BlocProvider.of<NavBookingCubit>(context).changeSelectedIndex(page);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
     // appBar: _mainWrapperAppBar(),
      body: _mainWrapperBody(),
      bottomNavigationBar: _mainWrapperBottomNavBar(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: _mainWrapperFab(),
      resizeToAvoidBottomInset: true,
    );
  }

  // Bottom Navigation Bar - MainWrapper Widget
  BottomAppBar _mainWrapperBottomNavBar(BuildContext context) {
    return BottomAppBar(
      color: Colors.black,
      child: SingleChildScrollView(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _bottomAppBarItem(
                    context,
                    defaultIcon: IconlyLight.home,
                    page: 0,
                    label: "Home",
                    filledIcon: IconlyBold.home,
                  ),
                  _bottomAppBarItem(
                    context,
                    defaultIcon: IconlyLight.paper,
                    page: 1,
                    label: "History",
                    filledIcon: IconlyBold.paper,
                  ),
                  _bottomAppBarItem(
                    context,
                    defaultIcon: IconlyLight.notification,
                    page: 2,
                    label: "Notifs",
                    filledIcon: IconlyBold.notification,
                  ),
                  _bottomAppBarItem(
                    context,
                    defaultIcon: IconlyLight.setting,
                    page: 3,
                    label: "Settings",
                    filledIcon: IconlyBold.setting,
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 80,
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  // Floating Action Button - MainWrapper Widget
  FloatingActionButton _mainWrapperFab() {
    return FloatingActionButton(
      onPressed: () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            behavior: SnackBarBehavior.floating,
            backgroundColor: Color.fromARGB(255, 7, 7, 7),
            content: Text("New post will generate in upcoming 2 mins 📮"),
          ),
        );
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      backgroundColor: Colors.amber,
      child: const Icon(Icons.add),
    );
  }

  // App Bar - MainWrapper Widget
  AppBar _mainWrapperAppBar() {
    return AppBar(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      title: const Text("BottomNavigationBar with Cubit"),
    );
  }

  // Body - MainWrapper Widget
  SafeArea _mainWrapperBody() {
    return SafeArea(
      child: PageView(
        onPageChanged: (int page) => onPageChanged(page),
        controller: pageController,
        children: topLevelPages,
      ),
    );
  }

  // Bottom Navigation Bar Single item - MainWrapper Widget
  Widget _bottomAppBarItem(
    BuildContext context, {
    required defaultIcon,
    required page,
    required label,
    required filledIcon,
  }) {
    return GestureDetector(
      onTap: () {
        BlocProvider.of<NavBookingCubit>(context).changeSelectedIndex(page);

        pageController.animateToPage(page,
            duration: const Duration(milliseconds: 10),
            curve: Curves.fastLinearToSlowEaseIn);
      },
      child: Container(
        color: Colors.transparent,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 10,
            ),
            Icon(
              context.watch<NavBookingCubit>().state == page
                  ? filledIcon
                  : defaultIcon,
              color: context.watch<NavBookingCubit>().state == page
                  ? Colors.amber
                  : Colors.grey,
              size: 26,
            ),
            const SizedBox(
              height: 3,
            ),
            Text(
              label,
              style: GoogleFonts.aBeeZee(
                color: context.watch<NavBookingCubit>().state == page
                    ? Colors.amber
                    : Colors.grey,
                fontSize: 13,
                fontWeight: context.watch<NavBookingCubit>().state == page
                    ? FontWeight.w600
                    : FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
