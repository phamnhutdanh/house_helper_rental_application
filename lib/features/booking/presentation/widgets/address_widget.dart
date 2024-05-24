import 'package:flutter/material.dart';
import 'package:house_helper_rental_application/features/booking/presentation/widgets/checkbox_save.dart';
import 'package:house_helper_rental_application/features/booking/presentation/widgets/checkout_textfield.dart';
import 'package:house_helper_rental_application/features/booking/presentation/widgets/page_name.dart';

class AddressWidget extends StatefulWidget {
  const AddressWidget({super.key});

  @override
  State<AddressWidget> createState() => _AddressWidgetState();
}

class _AddressWidgetState extends State<AddressWidget> {
  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PageName(textName: "Full Name"),
          CheckoutTextField(
            enterText: "Enter your full name",
            sizeWidth: 1.18,
          ), //350
          PageName(textName: "Email"),
          CheckoutTextField(
            enterText: "Enter your e-mail",
            sizeWidth: 1.18,
          ),
          PageName(textName: "Phone"),
          CheckoutTextField(
            enterText: "Enter your phone number",
            sizeWidth: 1.18,
          ),
          PageName(textName: "Address"),
          CheckoutTextField(
            enterText: "Type your home address",
            sizeWidth: 1.18,
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PageName(textName: "City"),
                  CheckoutTextField(enterText: "Enter here", sizeWidth: 3.0)
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PageName(textName: "Country"),
                  CheckoutTextField(enterText: "Your country", sizeWidth: 3.0)
                ],
              )
            ],
          ),
          CheckboxSave(saveText: "Save shipping address")
        ],
      ),
    );
  }
}
