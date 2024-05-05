import 'package:flutter/material.dart';
import 'package:house_helper_rental_application/core/theme/app_pallete.dart';

class DefaultBackButton extends StatelessWidget {
  const DefaultBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back_ios, color: AppPallete.kPrimaryColor),
      onPressed: () => Navigator.of(context).pop(),
    );
  }
}
