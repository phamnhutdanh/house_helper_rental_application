import 'package:flutter/material.dart';
import 'package:house_helper_rental_application/core/theme/app_palette.dart';

class ConfirmDialog extends StatelessWidget {
  final void Function() onPressConfirm;
  final String title;
  final String confirmText;
  final String cancelText;

  const ConfirmDialog({
    super.key,
    required this.onPressConfirm,
    required this.title,
    required this.confirmText,
    required this.cancelText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppPalette.secondaryColor,
      height: 150.0,
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: [
          const Text(
            'Are you sure you want Logout?',
            style: TextStyle(
              color: AppPalette.blackColor,
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          Row(
            children: [
              Expanded(
                child: MaterialButton(
                  color: AppPalette.primaryColor,
                  child: const Text(
                    'Logout',
                    style: TextStyle(
                      color: AppPalette.secondaryColor,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  onPressed: () {
                    onPressConfirm();
                  },
                ),
              ),
              const SizedBox(
                width: 20.0,
              ),
              Expanded(
                child: MaterialButton(
                  color: AppPalette.greyColor,
                  //  highlightedBorderColor: AppPallete.kWhiteColor,
                  //   borderSide: BorderSide(color: AppPallete.kWhiteColor),
                  child: const Text(
                    'Cancel',
                    style: TextStyle(
                      color: AppPalette.blackColor,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
