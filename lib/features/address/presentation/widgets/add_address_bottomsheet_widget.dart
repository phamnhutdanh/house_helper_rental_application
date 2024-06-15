import 'package:flutter/material.dart';
import 'package:house_helper_rental_application/core/common/widgets/gradient_button.dart';
import 'package:house_helper_rental_application/core/common/widgets/input_field.dart';
import 'package:house_helper_rental_application/core/common/widgets/page_name.dart';
import 'package:house_helper_rental_application/core/theme/app_palette.dart';

class AddAddressBottomSheetWidget extends StatefulWidget {
  final void Function({
    String? fullName,
    String? phone,
    String? address,
  }) onPressConfirm;
  const AddAddressBottomSheetWidget({
    super.key,
    required this.onPressConfirm,
  });

  @override
  State<AddAddressBottomSheetWidget> createState() =>
      _AddAddressBottomSheetWidgetState();
}

class _AddAddressBottomSheetWidgetState
    extends State<AddAddressBottomSheetWidget> {
  final formKey = GlobalKey<FormState>();
  final fullNameController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Add new address',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w500,
                  color: AppPalette.blackColor,
                ),
              ),
              const SizedBox(height: 20),
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 5,
                    child: GradientButton(
                        colors: const [
                          AppPalette.greyColor,
                          AppPalette.greyColor,
                        ],
                        buttonText: 'Cancel',
                        onPressed: () {
                          Navigator.of(context).pop();
                        }),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    flex: 5,
                    child: GradientButton(
                        buttonText: 'Add',
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            final address = addressController.text.trim();
                            final phone = phoneController.text.trim();
                            final fullName = fullNameController.text.trim();

                            widget.onPressConfirm(
                              address: address,
                              fullName: fullName,
                              phone: phone,
                            );
                          }
                        }),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
