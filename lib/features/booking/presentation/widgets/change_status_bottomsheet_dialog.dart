import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:house_helper_rental_application/core/common/entities/enum_type.dart';
import 'package:house_helper_rental_application/core/common/widgets/confirm_bottomsheet_widget.dart';
import 'package:house_helper_rental_application/features/booking/presentation/bloc/booking_bloc.dart';

void cancelBookingBottomSheetDialog(BuildContext context, String id) {
  showModalBottomSheet(
      isDismissible: true,
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return ConfirmBottomSheetWidget(
                title: 'Are you sure you want to cancel this booking?',
                confirmText: 'Confirm',
                cancelText: 'Cancel',
                onPressConfirm: () {
                  context.read<BookingBloc>().add(BookingChangeStatusEvent(
                      id: id, bookingStatus: BookingStatus.CANCELED));
                });
          },
        );
      });
}

void completeBookingBottomSheetDialog(BuildContext context, String id) {
  showModalBottomSheet(
      isDismissible: true,
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return ConfirmBottomSheetWidget(
                title: 'Are you sure you want to complete this booking?',
                confirmText: 'Confirm',
                cancelText: 'Cancel',
                onPressConfirm: () {
                  context.read<BookingBloc>().add(BookingChangeStatusEvent(
                      id: id, bookingStatus: BookingStatus.COMPLETED));
                });
          },
        );
      });
}

void acceptBookingBottomSheetDialog(BuildContext context, String id) {
  showModalBottomSheet(
      isDismissible: true,
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return ConfirmBottomSheetWidget(
                title: 'Are you sure you want to accept this booking?',
                confirmText: 'Confirm',
                cancelText: 'Cancel',
                onPressConfirm: () {
                  context.read<BookingBloc>().add(BookingChangeStatusEvent(
                      id: id, bookingStatus: BookingStatus.ACCEPTED));
                });
          },
        );
      });
}
