import 'package:house_helper_rental_application/core/theme/app_palette.dart';
import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;
  final List<Color>? colors;
  final Color? textColor;
  final double? width;

  const GradientButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
    this.colors,
    this.textColor,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colors ?? [AppPalette.gradient3, AppPalette.thirdColor],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppPalette.transparentColor,
          shadowColor: AppPalette.transparentColor,
        ),
        child: Text(
          buttonText,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: textColor ?? AppPalette.whiteColor,
          ),
        ),
      ),
    );
  }
}
