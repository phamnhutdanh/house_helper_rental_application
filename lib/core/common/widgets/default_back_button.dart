import 'package:flutter/material.dart';
import 'package:house_helper_rental_application/core/theme/app_palette.dart';
import 'package:iconly/iconly.dart';

class DefaultBackButton extends StatelessWidget {
  final VoidCallback onPressBack;
  const DefaultBackButton({super.key, required this.onPressBack});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(IconlyLight.arrow_left, color: AppPalette.blackColor),
      onPressed: () {
        onPressBack();
      },
    );
  }
}
