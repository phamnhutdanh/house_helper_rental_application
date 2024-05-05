import 'package:flutter/material.dart';
import 'package:house_helper_rental_application/core/constants/constants.dart';
import 'package:house_helper_rental_application/core/theme/app_pallete.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget child;
  final action;

  const DefaultAppBar({
    super.key,
    required this.title,
    required this.child,
    this.action,
  });

  @override
  Size get preferredSize => Size.fromHeight(56.0);
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title, style: TextStyle(color: AppPallete.kPrimaryColor)),
      centerTitle: true,
      backgroundColor: AppPallete.kWhiteColor,
      elevation: Constants.kRadius,
      automaticallyImplyLeading: false,
      iconTheme: IconThemeData(color: AppPallete.kPrimaryColor),
      leading: child,
      actions: action,
    );
  }
}
