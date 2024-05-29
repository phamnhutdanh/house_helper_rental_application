import 'package:flutter/material.dart';

class PaymentWidget extends StatelessWidget {
  final String result;
  final void Function(String?) onChangeResult;

  const PaymentWidget({
    super.key,
    required this.result,
    required this.onChangeResult,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: Radio<String>(
              value: 'COD',
              groupValue: result,
              onChanged: (value) {
                onChangeResult(value);
              },
            ),
            title: const Text('COD'),
          ),
          ListTile(
            leading: Radio<String>(
              value: 'MOMO',
              groupValue: result,
              onChanged: (value) {
                onChangeResult(value);
              },
            ),
            title: const Text('MOMO'),
          ),
          // PageName(textName: "Card Holder Name"),
          // CheckoutTextField(
          //   enterText: "Your card holder name",
          //   sizeWidth: 1.18,
          // ),
          // PageName(textName: "Card Number"),
          // CheckoutTextField(
          //   enterText: "Your card number",
          //   sizeWidth: 1.18,
          // ),
          // Row(
          //   children: [
          //     Column(
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //         PageName(textName: "Month/Year"),
          //         CheckoutTextField(enterText: "mm/yy", sizeWidth: 3.0)
          //       ],
          //     ),
          //     Column(
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //         PageName(textName: "CVV"),
          //         CheckoutTextField(enterText: "***", sizeWidth: 3.0)
          //       ],
          //     )
          //   ],
          // ),
          // CheckboxSave(saveText: "Save this card"),
        ],
      ),
    );
  }
}
