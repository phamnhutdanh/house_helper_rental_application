import 'package:flutter/material.dart';
import 'package:house_helper_rental_application/core/constants/constants.dart';
import 'package:house_helper_rental_application/core/theme/app_palette.dart';
import 'package:house_helper_rental_application/core/common/widgets/default_back_button.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool isVisibleBackButton;

  const DefaultAppBar({
    super.key,
    required this.title,
    required this.isVisibleBackButton,
  });

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
  Widget build(BuildContext context) {
    return AppBar(
      title:
          Text(title, style: const TextStyle(color: AppPalette.primaryColor)),
      centerTitle: true,
      backgroundColor: AppPalette.whiteColor,
      elevation: Constants.kRadius,
      automaticallyImplyLeading: false,
      iconTheme: const IconThemeData(color: AppPalette.primaryColor),
      leading:
          isVisibleBackButton ? const DefaultBackButton() : const SizedBox(),
    );
  }
}
