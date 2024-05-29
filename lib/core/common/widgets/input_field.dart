import 'package:flutter/material.dart';
import 'package:house_helper_rental_application/core/theme/app_palette.dart';

class InputField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool isObscureText;
  const InputField({
    super.key,
    required this.hintText,
    required this.controller,
    this.isObscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: const BorderRadius.all(Radius.circular(20.0)),
      ),
      child: TextFormField(
        controller: controller,
        validator: (value) {
          if (value!.isEmpty) {
            return "$hintText is missing!";
          }
          return null;
        },
        obscureText: isObscureText,
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16.0)),
            borderSide:
                BorderSide(width: 5, color: AppPalette.transparentColor),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          hintText: hintText,
          hintStyle:
              const TextStyle(color: AppPalette.greyColor, fontSize: 16.0),
        ),
      ),
    );

    // TextFormField(
    //   controller: controller,
    //   decoration: InputDecoration(
    //     hintText: hintText,
    //   ),
    //   validator: (value) {
    //     if (value!.isEmpty) {
    //       return "$hintText is missing!";
    //     }
    //     return null;
    //   },
    //   obscureText: isObscureText,
    // );
  }
}
