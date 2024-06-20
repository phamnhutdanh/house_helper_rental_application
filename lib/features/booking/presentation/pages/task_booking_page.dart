import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:house_helper_rental_application/core/common/entities/account_info.dart';
import 'package:house_helper_rental_application/core/common/entities/booking.dart';
import 'package:house_helper_rental_application/core/common/entities/enum_type.dart';
import 'package:house_helper_rental_application/core/common/pages/generic_tab_page.dart';
import 'package:house_helper_rental_application/core/common/widgets/loader.dart';
import 'package:house_helper_rental_application/core/utils/show_snackbar.dart';
import 'package:house_helper_rental_application/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:house_helper_rental_application/features/booking/presentation/bloc/booking_bloc.dart';
import 'package:house_helper_rental_application/features/booking/presentation/widgets/history_booking_tab.dart';
import 'package:house_helper_rental_application/core/common/widgets/tab_item.dart';

class TaskBookingPage extends StatefulWidget {
  const TaskBookingPage({super.key});

  @override
  State<TaskBookingPage> createState() => _TaskBookingPageState();
}

class _TaskBookingPageState extends State<TaskBookingPage> {
  late AccountInfo currentAccount;
  @override
  void initState() {
    currentAccount =
        (BlocProvider.of<AuthBloc>(context).state as AuthSuccess).accountInfo;
    context
        .read<BookingBloc>()
        .add(GetAllBookingEvent(employeeId: currentAccount.employee!.id ?? ''));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BookingBloc, BookingState>(
      listener: (context, state) {
        if (state is BookingFailure) {
          showSnackBar(context, state.error);
        }
      },
      builder: (context, state) {
        if (state is BookingLoading) {
          return const Loader();
        }
        if (state is AllBookingDisplaySuccess) {
          final bookings = state.bookings;

          late final List<Booking> newBookings = bookings.where((element) {
            return element.employeeId == null &&
                element.status == BookingStatus.PENDING;
          }).toList();

          late final List<Booking> myBookings = bookings.where((element) {
            return element.employeeId != null;
          }).toList();

          return GenericTabPage(
            title: 'Tasks',
            isScrollableTab: false,
            tabs: [
              TabItem(title: 'ALL', count: bookings.length),
              TabItem(title: 'NEW', count: newBookings.length),
              TabItem(title: 'MY TASK', count: myBookings.length),
            ],
            children: [
              HistoryBookingTab(
                bookings: bookings,
                onTapItem: (bookingId) {
                  Beamer.of(context)
                      .beamToNamed('/task_home/booking_details/$bookingId');
                },
              ),
              HistoryBookingTab(
                bookings: newBookings,
                onTapItem: (bookingId) {
                  Beamer.of(context)
                      .beamToNamed('/task_home/booking_details/$bookingId');
                },
              ),
              HistoryBookingTab(
                bookings: myBookings,
                onTapItem: (bookingId) {
                  Beamer.of(context)
                      .beamToNamed('/task_home/booking_details/$bookingId');
                },
              ),
            ],
          );
        }

        return GenericTabPage(
          title: 'Tasks',
          isScrollableTab: true,
          tabs: const [
            TabItem(title: 'ALL', count: 0),
            TabItem(title: 'NEW', count: 0),
            TabItem(title: 'MY TASK', count: 0),
          ],
          children: [
            HistoryBookingTab(
              bookings: const [],
              onTapItem: (bookingId) {},
            ),
            HistoryBookingTab(
              bookings: const [],
              onTapItem: (bookingId) {},
            ),
            HistoryBookingTab(
              bookings: const [],
              onTapItem: (bookingId) {},
            ),
          ],
        );
      },
    );
  }
}
