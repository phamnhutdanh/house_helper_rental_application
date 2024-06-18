import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:house_helper_rental_application/core/common/entities/booking.dart';
import 'package:house_helper_rental_application/core/common/entities/enum_type.dart';
import 'package:house_helper_rental_application/core/common/pages/generic_tab_page.dart';
import 'package:house_helper_rental_application/core/common/widgets/loader.dart';
import 'package:house_helper_rental_application/core/utils/show_snackbar.dart';
import 'package:house_helper_rental_application/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:house_helper_rental_application/features/booking/presentation/bloc/booking_bloc.dart';
import 'package:house_helper_rental_application/features/booking/presentation/widgets/history_booking_tab.dart';
import 'package:house_helper_rental_application/core/common/widgets/tab_item.dart';

class HistoryBookingPage extends StatefulWidget {
  const HistoryBookingPage({super.key});

  @override
  State<HistoryBookingPage> createState() => _HistoryBookingPageState();
}

class _HistoryBookingPageState extends State<HistoryBookingPage> {
  @override
  void initState() {
    final account =
        (BlocProvider.of<AuthBloc>(context).state as AuthSuccess).accountInfo;

    context.read<BookingBloc>().add(
        GetAllBookingOfCustomerEvent(customerId: account.customer!.id ?? ''));
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
        if (state is AllBookingOfCustomerDisplaySuccess) {
          final bookings = state.bookings;

          late List<Booking> pendingBookings = bookings
              .where((element) => element.status == BookingStatus.PENDING)
              .toList();

          late List<Booking> cancelBookings = bookings
              .where((element) => element.status == BookingStatus.CANCELED)
              .toList();

          late List<Booking> completeBookings = bookings
              .where((element) => element.status == BookingStatus.COMPLETED)
              .toList();

          late List<Booking> acceptBookings = bookings
              .where((element) => element.status == BookingStatus.ACCEPTED)
              .toList();
          return GenericTabPage(
            title: 'History',
            isScrollableTab: true,
            tabs: [
              TabItem(title: 'ALL', count: bookings.length),
              TabItem(title: 'PENDING', count: pendingBookings.length),
              TabItem(title: 'ACCEPTED', count: acceptBookings.length),
              TabItem(title: 'CANCELED', count: cancelBookings.length),
              TabItem(title: 'COMPLETED', count: completeBookings.length),
            ],
            children: [
              HistoryBookingTab(
                bookings: bookings,
                onTapItem: (bookingId) {
                  Beamer.of(context).beamToNamed(
                      '/booking_history/booking_details/$bookingId');
                },
              ),
              HistoryBookingTab(
                bookings: pendingBookings,
                onTapItem: (bookingId) {
                  Beamer.of(context).beamToNamed(
                      '/booking_history/booking_details/$bookingId');
                },
              ),
              HistoryBookingTab(
                bookings: acceptBookings,
                onTapItem: (bookingId) {
                  Beamer.of(context).beamToNamed(
                      '/booking_history/booking_details/$bookingId');
                },
              ),
              HistoryBookingTab(
                bookings: cancelBookings,
                onTapItem: (bookingId) {
                  Beamer.of(context).beamToNamed(
                      '/booking_history/booking_details/$bookingId');
                },
              ),
              HistoryBookingTab(
                bookings: completeBookings,
                onTapItem: (bookingId) {
                  Beamer.of(context).beamToNamed(
                      '/booking_history/booking_details/$bookingId');
                },
              ),
            ],
          );
        }

        return GenericTabPage(
          title: 'History',
          isScrollableTab: true,
          tabs: const [
            TabItem(title: 'ALL', count: 0),
            TabItem(title: 'PENDING', count: 0),
            TabItem(title: 'ACCEPTED', count: 0),
            TabItem(title: 'CANCELED', count: 0),
            TabItem(title: 'COMPLETED', count: 0),
          ],
          children: [
            HistoryBookingTab(
              bookings: const [],
              onTapItem: (bookingId) {
                Beamer.of(context)
                    .beamToNamed('/booking_history/booking_details/$bookingId');
              },
            ),
            HistoryBookingTab(
              bookings: const [],
              onTapItem: (bookingId) {
                Beamer.of(context)
                    .beamToNamed('/booking_history/booking_details/$bookingId');
              },
            ),
            HistoryBookingTab(
              bookings: const [],
              onTapItem: (bookingId) {
                Beamer.of(context)
                    .beamToNamed('/booking_history/booking_details/$bookingId');
              },
            ),
            HistoryBookingTab(
              bookings: const [],
              onTapItem: (bookingId) {
                Beamer.of(context)
                    .beamToNamed('/booking_history/booking_details/$bookingId');
              },
            ),
            HistoryBookingTab(
              bookings: const [],
              onTapItem: (bookingId) {
                Beamer.of(context)
                    .beamToNamed('/booking_history/booking_details/$bookingId');
              },
            ),
          ],
        );
      },
    );
  }
}
