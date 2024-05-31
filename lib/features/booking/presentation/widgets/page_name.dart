import 'package:flutter/material.dart';
import 'package:house_helper_rental_application/core/theme/app_palette.dart';

class PageName extends StatelessWidget {
  final String textName;
  const PageName({super.key, required this.textName});

  @override
  Widget build(BuildContext context) {
    return Text(
      textName,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: AppPalette.blackColor,
      ),
    );
  }
}
