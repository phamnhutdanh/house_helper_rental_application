import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:house_helper_rental_application/core/common/widgets/gradient_button.dart';
import 'package:house_helper_rental_application/core/common/widgets/input_field.dart';
import 'package:house_helper_rental_application/core/common/widgets/page_name.dart';
import 'package:house_helper_rental_application/core/theme/app_palette.dart';

class AddAddressPage extends StatefulWidget {
  const AddAddressPage({super.key});

  @override
  State<AddAddressPage> createState() => _AddAddressPageState();
}

class _AddAddressPageState extends State<AddAddressPage> {
  final formKey = GlobalKey<FormState>();
  final fullNameController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();
  bool isDefaultAddress = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const PageName(textName: "Full Name"),
            const SizedBox(height: 10),
            InputField(
              hintText: "Enter your full name",
              controller: fullNameController,
            ),
            const SizedBox(height: 20),
            const PageName(textName: "Phone"),
            const SizedBox(height: 10),
            InputField(
              hintText: "Enter your phone number",
              controller: phoneController,
            ),
            const SizedBox(height: 20),
            const PageName(textName: "Address"),
            const SizedBox(height: 10),
            InputField(
              hintText: "Type your home address",
              controller: addressController,
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Checkbox(
                  checkColor: AppPalette.whiteColor,
                  activeColor: AppPalette.thirdColor,
                  value: isDefaultAddress,
                  onChanged: (b) {
                    setState(() {
                      isDefaultAddress = b ?? false;
                    });
                  },
                ),
                Text(
                  "Set as default address address",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 5,
                  child: GradientButton(
                      buttonText: 'Cancel',
                      onPressed: () {
                        Beamer.of(context).beamBack();
                      }),
                ),
                SizedBox(width: 8),
                Expanded(
                    flex: 5,
                    child: GradientButton(
                        buttonText: 'Add',
                        onPressed: () {
                          // call bloc add
                        })),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
