import 'package:beamer/beamer.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:house_helper_rental_application/core/common/widgets/default_app_bar.dart';
import 'package:house_helper_rental_application/core/common/widgets/gradient_button.dart';
import 'package:house_helper_rental_application/core/common/widgets/loader.dart';
import 'package:house_helper_rental_application/core/objects/checkout_data_object.dart';
import 'package:house_helper_rental_application/core/theme/app_palette.dart';
import 'package:house_helper_rental_application/core/common/widgets/page_name.dart';
import 'package:house_helper_rental_application/core/utils/format_date.dart';
import 'package:house_helper_rental_application/core/utils/show_snackbar.dart';
import 'package:house_helper_rental_application/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:house_helper_rental_application/features/booking/presentation/bloc/booking_bloc.dart';
import 'package:house_helper_rental_application/features/services/presentation/widgets/service_details_view.dart';

class ConfirmCheckoutPage extends StatefulWidget {
  final BookingDetailsObject bookingDetailsObject;
  const ConfirmCheckoutPage({
    super.key,
    required this.bookingDetailsObject,
  });

  @override
  State<ConfirmCheckoutPage> createState() => _ConfirmCheckoutPageState();
}

class _ConfirmCheckoutPageState extends State<ConfirmCheckoutPage> {
  late final selectedDate =
      DateTime.parse(widget.bookingDetailsObject.bookingTime);

  @override
  Widget build(BuildContext context) {
    final accountId = (BlocProvider.of<AuthBloc>(context).state as AuthSuccess)
        .accountInfo
        .id;
    return Scaffold(
      appBar: DefaultAppBar(
        title: 'Booking details',
        isVisibleBackButton: true,
        onPressBack: () {
          Beamer.of(context).beamBack();
        },
      ),
      resizeToAvoidBottomInset: true,
      backgroundColor: AppPalette.whiteColor,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const PageName(textName: 'Full name'),
              const SizedBox(height: 10),
              Text(
                widget.bookingDetailsObject.fullName,
                style: const TextStyle(
                  fontSize: 16,
                  color: AppPalette.blackColor,
                ),
              ),
              const SizedBox(height: 20),
              const PageName(textName: 'Phone'),
              const SizedBox(height: 10),
              Text(
                widget.bookingDetailsObject.phone,
                style: const TextStyle(
                  fontSize: 16,
                  color: AppPalette.blackColor,
                ),
              ),
              const SizedBox(height: 20),
              const PageName(textName: 'Address'),
              const SizedBox(height: 10),
              Text(
                widget.bookingDetailsObject.address,
                style: const TextStyle(
                  fontSize: 16,
                  color: AppPalette.blackColor,
                ),
              ),
              const SizedBox(height: 20),
              const PageName(textName: 'Booking date'),
              const SizedBox(height: 10),
              Text(
                formatDateByDDMMYYYY(selectedDate),
                style: const TextStyle(
                  fontSize: 16,
                  color: AppPalette.blackColor,
                ),
              ),
              const SizedBox(height: 20),
              const PageName(textName: 'Booking time'),
              const SizedBox(height: 10),
              Text(
                "${selectedDate.hour}:${selectedDate.minute}",
                style: const TextStyle(
                  fontSize: 16,
                  color: AppPalette.blackColor,
                ),
              ),
              const SizedBox(height: 20),
              const PageName(textName: 'Repeat'),
              const SizedBox(height: 10),
              Text(
                widget.bookingDetailsObject.repeatStatus == "NO_REPEAT"
                    ? "No repeat"
                    : widget.bookingDetailsObject.repeatStatus == "EVERY_DAY"
                        ? "Every day"
                        : widget.bookingDetailsObject.repeatStatus ==
                                "EVERY_WEEK"
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
                    serviceDetails: widget.bookingDetailsObject.serviceDetails,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const PageName(textName: 'Payment method'),
              const SizedBox(height: 10),
              Text(widget.bookingDetailsObject.paymentMethod),
              const SizedBox(height: 20),
              const PageName(textName: 'Note'),
              const SizedBox(height: 10),
              Text(widget.bookingDetailsObject.note != ''
                  ? widget.bookingDetailsObject.note
                  : "None"),
              const SizedBox(height: 20),
              const PageName(textName: 'Total price'),
              const SizedBox(height: 10),
              Text(widget.bookingDetailsObject.totalPrice.toString()),
              const SizedBox(height: 20),
              BlocConsumer<BookingBloc, BookingState>(
                  listener: (context, state) {
                if (state is BookingFailure) {
                  showSnackBar(context, state.error);
                } else if (state is CreateBookingSuccess) {
                  Beamer.of(context).beamToNamed('/booking_home/success_page');
                }
              }, builder: (context, state) {
                if (state is BookingLoading) {
                  return const Loader();
                }
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 5,
                      child: GradientButton(
                        buttonText: "Cancel",
                        colors: const [
                          AppPalette.greyColor,
                          AppPalette.greyColor,
                        ],
                        textColor: AppPalette.whiteColor,
                        onPressed: () {
                          Beamer.of(context).beamBack();
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      flex: 5,
                      child: GradientButton(
                        buttonText: "Confirm",
                        onPressed: () {
                          context.read<BookingBloc>().add(
                                BookingCreateDataEvent(
                                  bookingTime:
                                      widget.bookingDetailsObject.bookingTime,
                                  repeatStatus:
                                      widget.bookingDetailsObject.repeatStatus,
                                  totalPrice:
                                      widget.bookingDetailsObject.totalPrice,
                                  note: widget.bookingDetailsObject.note,
                                  paymentMethod:
                                      widget.bookingDetailsObject.paymentMethod,
                                  serviceId:
                                      widget.bookingDetailsObject.serviceId,
                                  accountId: accountId ?? '',
                                  customerAddressId: widget
                                      .bookingDetailsObject.customerAddressId,
                                  serviceDetails: widget
                                      .bookingDetailsObject.serviceDetails,
                                ),
                              );
                        },
                      ),
                    ),
                  ],
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
