import 'package:flutter/material.dart';
import 'package:house_helper_rental_application/features/booking/presentation/widgets/checkbox_save.dart';
import 'package:house_helper_rental_application/features/booking/presentation/widgets/checkout_textfield.dart';
import 'package:house_helper_rental_application/features/booking/presentation/widgets/page_name.dart';

class PaymentWidget extends StatefulWidget {
  const PaymentWidget({super.key});

  @override
  State<PaymentWidget> createState() => _PaymentWidgetState();
}

class _PaymentWidgetState extends State<PaymentWidget> {
  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PageName(textName: "Card Holder Name"),
          CheckoutTextField(
            enterText: "Your card holder name",
            sizeWidth: 1.18,
          ),
          PageName(textName: "Card Number"),
          CheckoutTextField(
            enterText: "Your card number",
            sizeWidth: 1.18,
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PageName(textName: "Month/Year"),
                  CheckoutTextField(enterText: "mm/yy", sizeWidth: 3.0)
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PageName(textName: "CVV"),
                  CheckoutTextField(enterText: "***", sizeWidth: 3.0)
                ],
              )
            ],
          ),
          CheckboxSave(saveText: "Save this card")
        ],
      ),
    );
  }
}
