import 'package:beamer/beamer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:house_helper_rental_application/core/common/entities/enum_type.dart';
import 'package:house_helper_rental_application/core/common/entities/service.dart';
import 'package:house_helper_rental_application/core/common/widgets/gradient_button.dart';
import 'package:house_helper_rental_application/core/common/widgets/loader.dart';
import 'package:house_helper_rental_application/core/common/widgets/page_name.dart';
import 'package:house_helper_rental_application/core/theme/app_palette.dart';
import 'package:house_helper_rental_application/core/utils/format_date.dart';
import 'package:house_helper_rental_application/core/utils/show_snackbar.dart';
import 'package:house_helper_rental_application/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:house_helper_rental_application/features/booking/presentation/bloc/booking_bloc.dart';
import 'package:house_helper_rental_application/features/booking/presentation/widgets/change_status_bottomsheet_dialog.dart';
import 'package:house_helper_rental_application/features/services/presentation/widgets/service_details_view.dart';

class BookingDetailWidget extends StatefulWidget {
  final String bookingId;
  final String fullName;
  final String phone;
  final String address;
  final DateTime selectedDate;
  final String repeatStatus;
  final String paymentMethod;
  final String note;
  final int totalPrice;
  final BookingStatus bookingStatus;
  final List<ServiceDetails> serviceDetails;

  const BookingDetailWidget({
    super.key,
    required this.bookingId,
    required this.fullName,
    required this.phone,
    required this.address,
    required this.selectedDate,
    required this.repeatStatus,
    required this.paymentMethod,
    required this.note,
    required this.totalPrice,
    required this.serviceDetails,
    required this.bookingStatus,
  });

  @override
  State<BookingDetailWidget> createState() => _BookingDetailWidgetState();
}

class _BookingDetailWidgetState extends State<BookingDetailWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const PageName(textName: 'Full name'),
            const SizedBox(height: 10),
            Text(
              widget.fullName,
              style: const TextStyle(
                fontSize: 16,
                color: AppPalette.blackColor,
              ),
            ),
            const SizedBox(height: 20),
            const PageName(textName: 'Phone'),
            const SizedBox(height: 10),
            Text(
              widget.phone,
              style: const TextStyle(
                fontSize: 16,
                color: AppPalette.blackColor,
              ),
            ),
            const SizedBox(height: 20),
            const PageName(textName: 'Address'),
            const SizedBox(height: 10),
            Text(
              widget.address,
              style: const TextStyle(
                fontSize: 16,
                color: AppPalette.blackColor,
              ),
            ),
            const SizedBox(height: 20),
            const PageName(textName: 'Booking date'),
            const SizedBox(height: 10),
            Text(
              formatDateByDDMMYYYY(widget.selectedDate),
              style: const TextStyle(
                fontSize: 16,
                color: AppPalette.blackColor,
              ),
            ),
            const SizedBox(height: 20),
            const PageName(textName: 'Booking time'),
            const SizedBox(height: 10),
            Text(
              "${widget.selectedDate.hour}:${widget.selectedDate.minute}",
              style: const TextStyle(
                fontSize: 16,
                color: AppPalette.blackColor,
              ),
            ),
            const SizedBox(height: 20),
            const PageName(textName: 'Repeat'),
            const SizedBox(height: 10),
            Text(
              widget.repeatStatus == "NO_REPEAT"
                  ? "No repeat"
                  : widget.repeatStatus == "EVERY_DAY"
                      ? "Every day"
                      : widget.repeatStatus == "EVERY_WEEK"
                          ? "Every week"
                          : "Every month",
              style: const TextStyle(
                fontSize: 16,
                color: AppPalette.blackColor,
              ),
            ),
            const SizedBox(height: 20),
            const PageName(textName: 'Service details'),
            const SizedBox(height: 10),
            Container(
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppPalette.transparentColor,
              ),
              child: Expanded(
                child: ServiceDetailsView(
                  serviceDetails: widget.serviceDetails,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const PageName(textName: 'Payment method'),
            const SizedBox(height: 10),
            Text(widget.paymentMethod),
            const SizedBox(height: 20),
            const PageName(textName: 'Status'),
            const SizedBox(height: 10),
            Text(
              widget.bookingStatus == BookingStatus.PENDING
                  ? "Pending"
                  : widget.bookingStatus == BookingStatus.ACCEPTED
                      ? "Accepted"
                      : widget.bookingStatus == BookingStatus.CANCELED
                          ? "Canceled"
                          : "Completed",
              style: TextStyle(
                color: widget.bookingStatus == BookingStatus.PENDING
                    ? AppPalette.thirdColor
                    : widget.bookingStatus == BookingStatus.ACCEPTED
                        ? AppPalette.primaryColor
                        : widget.bookingStatus == BookingStatus.CANCELED
                            ? AppPalette.errorColor
                            : AppPalette.successColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            const PageName(textName: 'Note'),
            const SizedBox(height: 10),
            Text(widget.note != '' ? widget.note : "None"),
            const SizedBox(height: 20),
            const PageName(textName: 'Total price'),
            const SizedBox(height: 10),
            Text(widget.totalPrice.toString()),
            const SizedBox(height: 20),
            BlocConsumer<BookingBloc, BookingState>(
              listener: (context, state) {
                if (state is BookingFailure) {
                  showSnackBar(context, state.error);
                } else if (state is ChangeBookingStatusSuccess) {
                  final account =
                      (BlocProvider.of<AuthBloc>(context).state as AuthSuccess)
                          .accountInfo;

                  context.read<BookingBloc>().add(GetAllBookingOfCustomerEvent(
                      customerId: account.customer!.id ?? ''));
                  Beamer.of(context).beamBack();
                }
              },
              builder: (context, state) {
                if (state is BookingLoading) {
                  return const Loader();
                }
                final accountRole =
                    (BlocProvider.of<AuthBloc>(context).state as AuthSuccess)
                        .accountInfo
                        .accountRole;

                if (accountRole == AccountInfoRole.CUSTOMER) {
                  if (widget.bookingStatus == BookingStatus.PENDING) {
                    return Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: GradientButton(
                            colors: const [
                              AppPalette.errorColor,
                              AppPalette.errorColor,
                            ],
                            textColor: AppPalette.whiteColor,
                            buttonText: 'Cancel booking',
                            onPressed: () {
                              setState(() {
                                return cancelBookingBottomSheetDialog(
                                    context, widget.bookingId);
                              });
                            },
                          ),
                        ),
                      ],
                    );
                  }
                }

                if (accountRole == AccountInfoRole.EMPLOYEE) {
                  if (widget.bookingStatus == BookingStatus.PENDING) {
                    return Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: GradientButton(
                            colors: const [
                              AppPalette.successColor,
                              AppPalette.successColor,
                            ],
                            textColor: AppPalette.whiteColor,
                            buttonText: 'Accept',
                            onPressed: () {
                              setState(() {
                                return acceptBookingBottomSheetDialog(
                                    context, widget.bookingId);
                              });
                            },
                          ),
                        ),
                      ],
                    );
                  }

                  if (widget.bookingStatus == BookingStatus.ACCEPTED) {
                    return Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: GradientButton(
                            colors: const [
                              AppPalette.primaryColor,
                              AppPalette.primaryColor,
                            ],
                            textColor: AppPalette.whiteColor,
                            buttonText: 'Complete booking',
                            onPressed: () {
                              setState(() {
                                return completeBookingBottomSheetDialog(
                                    context, widget.bookingId);
                              });
                            },
                          ),
                        ),
                      ],
                    );
                  }
                }

                return const SizedBox();
              },
            ),
          ],
        ),
      ),
    );
  }
}
