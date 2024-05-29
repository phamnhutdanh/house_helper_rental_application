import 'package:flutter/material.dart';
import 'package:house_helper_rental_application/core/theme/app_palette.dart';
import 'package:house_helper_rental_application/core/common/widgets/default_back_button.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool isVisibleBackButton;
  final VoidCallback onPressBack;

  const DefaultAppBar({
    super.key,
    required this.title,
    required this.isVisibleBackButton,
    required this.onPressBack,
  });

  @override
  Size get preferredSize => const Size.fromHeight(56.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title,
          style: const TextStyle(
              color: AppPalette.blackColor,
              fontSize: 20,
              fontWeight: FontWeight.bold)),
      centerTitle: true,
      backgroundColor: AppPalette.transparentColor,
      elevation: 0,
      automaticallyImplyLeading: false,
      iconTheme: const IconThemeData(color: AppPalette.blackColor),
      leading: isVisibleBackButton
          ? DefaultBackButton(onPressBack: onPressBack)
          : const SizedBox(),
    );
  }
}
