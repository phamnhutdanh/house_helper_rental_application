import 'package:beamer/beamer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:house_helper_rental_application/core/common/widgets/default_app_bar.dart';
import 'package:house_helper_rental_application/core/common/widgets/gradient_button.dart';
import 'package:house_helper_rental_application/core/theme/app_palette.dart';
import 'package:house_helper_rental_application/core/common/widgets/page_name.dart';

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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                  // widget.booking.customerAddress,
                  "Full name customer",
                  style: const TextStyle(
                    fontSize: 16,
                    color: AppPalette.blackColor,
                  ),
                ),
                const SizedBox(height: 20),
                const PageName(textName: 'Phone'),
                const SizedBox(height: 10),
                Text(
                  //  widget.checkoutDataObject.phone,
                  "Phone customer",
                  style: const TextStyle(
                    fontSize: 16,
                    color: AppPalette.blackColor,
                  ),
                ),
                const SizedBox(height: 20),
                const PageName(textName: 'Address'),
                const SizedBox(height: 10),
                Text(
                  // widget.checkoutDataObject.address,
                  "Address customer",
                  style: const TextStyle(
                    fontSize: 16,
                    color: AppPalette.blackColor,
                  ),
                ),
                const SizedBox(height: 20),
                const PageName(textName: 'Booking time'),
                const SizedBox(height: 10),
                Text(
                  "Booking time customer",
                  // widget.checkoutDataObject.bookingTime,
                  style: const TextStyle(
                    fontSize: 16,
                    color: AppPalette.blackColor,
                  ),
                ),
                const SizedBox(height: 20),
                const PageName(textName: 'Repeat'),
                const SizedBox(height: 10),
                Text(
                  "Repeat status customer",
                  //   widget.checkoutDataObject.repeatStatus,
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
                    child: Text('Service details'),
                    // child: ServiceDetailsView(
                    //   serviceDetails: widget.checkoutDataObject.serviceDetails,
                    // ),
                  ),
                ),
                const SizedBox(height: 20),
                const PageName(textName: 'Payment method'),
                const SizedBox(height: 10),
                Text('Full name customer'),
                // Text(widget.checkoutDataObject.paymentMethod),
                const SizedBox(height: 20),
                GradientButton(
                    buttonText: "Cancel booking",
                    colors: const [
                      AppPalette.errorColor,
                      AppPalette.errorColor,
                    ],
                    textColor: AppPalette.whiteColor,
                    onPressed: () {
                      Beamer.of(context).beamBack();
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
