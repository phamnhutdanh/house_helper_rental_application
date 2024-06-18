import 'package:beamer/beamer.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:house_helper_rental_application/core/common/entities/enum_type.dart';
import 'package:house_helper_rental_application/core/common/entities/service.dart';
import 'package:house_helper_rental_application/core/common/widgets/default_app_bar.dart';
import 'package:house_helper_rental_application/core/common/widgets/loader.dart';
import 'package:house_helper_rental_application/core/theme/app_palette.dart';
import 'package:house_helper_rental_application/core/utils/show_snackbar.dart';
import 'package:house_helper_rental_application/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:house_helper_rental_application/features/booking/presentation/bloc/booking_bloc.dart';
import 'package:house_helper_rental_application/features/booking/presentation/widgets/booking_detail_widget.dart';

class BookingDetailsPage extends StatefulWidget {
  final String bookingId;
  const BookingDetailsPage({
    super.key,
    required this.bookingId,
  });

  @override
  State<BookingDetailsPage> createState() => _BookingDetailsPageState();
}

class _BookingDetailsPageState extends State<BookingDetailsPage> {
  @override
  void initState() {
    context.read<BookingBloc>().add(GetBookingByIdEvent(id: widget.bookingId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        final account =
            (BlocProvider.of<AuthBloc>(context).state as AuthSuccess)
                .accountInfo;

        context.read<BookingBloc>().add(GetAllBookingOfCustomerEvent(
            customerId: account.customer!.id ?? ''));
      },
      child: Scaffold(
        appBar: DefaultAppBar(
          title: 'Booking details',
          isVisibleBackButton: true,
          onPressBack: () {
            Beamer.of(context).beamBack();
          },
        ),
        resizeToAvoidBottomInset: true,
        backgroundColor: AppPalette.whiteColor,
        body: BlocConsumer<BookingBloc, BookingState>(
          listener: (context, state) {
            if (state is BookingFailure) {
              showSnackBar(context, state.error);
            }
          },
          builder: (context, state) {
            if (state is BookingLoading) {
              return const Loader();
            }
            if (state is GetBookingByIdDisplaySuccess) {
              final booking = state.booking;
              final List<ServiceDetails> serviceDetails = booking
                  .bookingServiceDetails!
                  .map((item) => item.serviceDetails!)
                  .toList();

              return BookingDetailWidget(
                bookingId: widget.bookingId,
                employeeId: booking.employeeId ?? '',
                fullName: booking.customerAddress!.address!.fullName ?? '',
                phone: booking.customerAddress!.address!.phone ?? '',
                address: booking.customerAddress!.address!.address ?? '',
                note: booking.note ?? '',
                paymentMethod:
                    booking.paymentMethod == PaymentMethod.COD ? "COD" : "MOMO",
                repeatStatus: booking.repeatStatus ==
                        RepeatBookingStatus.NO_REPEAT
                    ? "NO_REPEAT"
                    : booking.repeatStatus == RepeatBookingStatus.EVERY_DAY
                        ? "EVERY_DAY"
                        : booking.repeatStatus == RepeatBookingStatus.EVERY_WEEK
                            ? "EVERY_WEEK"
                            : "EVERY_MONTH",
                selectedDate: booking.bookingTime ?? DateTime.now(),
                serviceDetails: serviceDetails,
                totalPrice: booking.totalPrice ?? 0,
                bookingStatus: booking.status ?? BookingStatus.CANCELED,
                ratingEmployee: booking.ratingEmployee,
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
