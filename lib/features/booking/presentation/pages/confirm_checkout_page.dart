import 'package:beamer/beamer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:house_helper_rental_application/core/common/widgets/default_app_bar.dart';
import 'package:house_helper_rental_application/core/theme/app_palette.dart';
import 'package:house_helper_rental_application/core/utils/objects/checkout_data_object.dart';
import 'package:house_helper_rental_application/features/booking/presentation/widgets/page_name.dart';
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
    DateFormat dayFormat = DateFormat('dd-MM-yyyy');
    var selectedDay = dayFormat.format(widget.checkoutDataObject.selectedDay);

    return Scaffold(
        appBar: DefaultAppBar(
          title: 'Confirm booking',
          isVisibleBackButton: true,
          onPressBack: () {
            Beamer.of(context).beamBack();
          },
        ),
        resizeToAvoidBottomInset: false,
        backgroundColor: AppPalette.whiteColor,
        body: Column(children: [
          PageName(textName: 'Full name'),
          Text(widget.checkoutDataObject.fullNameText),
          PageName(textName: 'Phone'),
          Text(widget.checkoutDataObject.phoneText),
          PageName(textName: 'Address'),
          Text(widget.checkoutDataObject.addressText),
          PageName(textName: 'Booking time'),
          Text(selectedDay),
          PageName(textName: 'Repeat'),
          Text(widget.checkoutDataObject.repeat),
          PageName(textName: 'Service details'),
          Text(widget.checkoutDataObject.selectedServices.toString()),
          PageName(textName: 'Payment method'),
          Text(widget.checkoutDataObject.paymentMethod),
        ]));
  }
}
