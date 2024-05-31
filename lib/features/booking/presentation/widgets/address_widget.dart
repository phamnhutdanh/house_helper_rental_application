import 'package:flutter/material.dart';
import 'package:house_helper_rental_application/core/common/widgets/input_field.dart';
import 'package:house_helper_rental_application/core/theme/app_palette.dart';
import 'package:house_helper_rental_application/features/booking/presentation/widgets/page_name.dart';

class AddressWidget extends StatelessWidget {
  final TextEditingController fullNameController;
  final TextEditingController phoneController;
  final TextEditingController addressController;
  final bool isSavingAddress;
  final Function(bool) onChangedCheckbox;
  final GlobalKey<FormState> formKey;
  const AddressWidget({
    super.key,
    required this.fullNameController,
    required this.phoneController,
    required this.addressController,
    required this.formKey,
    required this.isSavingAddress,
    required this.onChangedCheckbox,
  });

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

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const PageName(textName: "Address"),
                TextButton(
                  onPressed: () {},
                  child: const Text("See all"),
                ),
              ],
            ),
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
                  value: isSavingAddress,
                  onChanged: (b) {
                    onChangedCheckbox(b ?? false);
                  },
                ),
                Text(
                  "Save shipping address",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
            // PageName(textName: "Full Name"),
            // CheckoutTextField(
            //   enterText: "Enter your full name",
            //   sizeWidth: 1.18,
            //   controller: fullNameController,
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     const PageName(textName: "Phone"),
            //     TextButton(
            //       onPressed: () {},
            //       child: const Text("See all"),
            //     ),
            //   ],
            // ),
            // CheckoutTextField(
            //   enterText: "Enter your phone number",
            //   sizeWidth: 1.18,
            //   controller: phoneController,
            // ),
            // PageName(textName: "Address"),
            // CheckoutTextField(
            //   enterText: "Type your home address",
            //   sizeWidth: 1.18,
            //   controller: addressController,
            // ),
            // CheckboxSave(saveText: "Save shipping address"),
          ],
        ),
      ),
    );
  }
}
