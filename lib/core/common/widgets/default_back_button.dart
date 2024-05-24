import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:house_helper_rental_application/core/theme/app_palette.dart';

class DefaultBackButton extends StatelessWidget {
  const DefaultBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back_ios, color: AppPalette.primaryColor),
      onPressed: () => Beamer.of(context).beamBack(),
      // onPressed: () => Navigator.of(context).pop(),
    );
  }
}
