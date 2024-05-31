import 'package:beamer/beamer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:house_helper_rental_application/core/common/widgets/default_app_bar.dart';
import 'package:house_helper_rental_application/core/common/widgets/gradient_button.dart';
import 'package:house_helper_rental_application/core/objects/checkout_data_object.dart';
import 'package:house_helper_rental_application/core/theme/app_palette.dart';
import 'package:house_helper_rental_application/features/booking/presentation/widgets/page_name.dart';
import 'package:house_helper_rental_application/features/booking/presentation/widgets/service_details_list.dart';
import 'package:house_helper_rental_application/features/booking/presentation/widgets/service_details_view.dart';
import 'package:intl/intl.dart';

class ConfirmCheckoutPage extends StatefulWidget {
  final CheckoutDataObject checkoutDataObject;
  const ConfirmCheckoutPage({
    super.key,
    required this.checkoutDataObject,
  });

  @override
  State<ConfirmCheckoutPage> createState() => _ConfirmCheckoutPageState();
}

class _ConfirmCheckoutPageState extends State<ConfirmCheckoutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        title: 'Confirm booking',
        isVisibleBackButton: true,
        onPressBack: () {
          Beamer.of(context).beamBack();
        },
      ),
      resizeToAvoidBottomInset: true,
      backgroundColor: AppPalette.whiteColor,
      body: SingleChildScrollView(
        child: Expanded(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const PageName(textName: 'Full name'),
                const SizedBox(height: 10),
                Text(
                  widget.checkoutDataObject.fullName,
                  style: const TextStyle(
                    fontSize: 16,
                    color: AppPalette.blackColor,
                  ),
                ),
                const SizedBox(height: 20),
                const PageName(textName: 'Phone'),
                const SizedBox(height: 10),
                Text(
                  widget.checkoutDataObject.phone,
                  style: const TextStyle(
                    fontSize: 16,
                    color: AppPalette.blackColor,
                  ),
                ),
                const SizedBox(height: 20),
                const PageName(textName: 'Address'),
                const SizedBox(height: 10),
                Text(
                  widget.checkoutDataObject.address,
                  style: const TextStyle(
                    fontSize: 16,
                    color: AppPalette.blackColor,
                  ),
                ),
                const SizedBox(height: 20),
                const PageName(textName: 'Booking time'),
                const SizedBox(height: 10),
                Text(
                  widget.checkoutDataObject.bookingTime,
                  style: const TextStyle(
                    fontSize: 16,
                    color: AppPalette.blackColor,
                  ),
                ),
                const SizedBox(height: 20),
                const PageName(textName: 'Repeat'),
                const SizedBox(height: 10),
                Text(
                  widget.checkoutDataObject.repeatStatus,
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
                      serviceDetails: widget.checkoutDataObject.serviceDetails,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const PageName(textName: 'Payment method'),
                const SizedBox(height: 10),
                Text(widget.checkoutDataObject.paymentMethod),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GradientButton(
                        buttonText: "Cancel",
                        colors: const [
                          AppPalette.greyColor,
                          AppPalette.greyColor,
                        ],
                        textColor: AppPalette.whiteColor,
                        onPressed: () {
                          Beamer.of(context).beamBack();
                        }),
                    const SizedBox(
                      width: 8,
                    ),
                    GradientButton(
                        buttonText: "Confirm",
                        onPressed: () {
                          Beamer.of(context)
                              .beamToNamed('/booking_home/success_page');
                        }),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
