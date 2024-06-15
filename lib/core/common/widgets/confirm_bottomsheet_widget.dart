import 'package:flutter/material.dart';
import 'package:house_helper_rental_application/core/common/widgets/page_name.dart';
import 'package:house_helper_rental_application/core/theme/app_palette.dart';
import 'package:house_helper_rental_application/core/common/widgets/gradient_button.dart';

class ConfirmBottomSheetWidget extends StatelessWidget {
  final void Function() onPressConfirm;
  final String title;
  final String confirmText;
  final String cancelText;

  const ConfirmBottomSheetWidget({
    super.key,
    required this.onPressConfirm,
    required this.title,
    required this.confirmText,
    required this.cancelText,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PageName(textName: title),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 5,
                  child: GradientButton(
                      colors: const [
                        AppPalette.greyColor,
                        AppPalette.greyColor,
                      ],
                      buttonText: cancelText,
                      onPressed: () {
                        Navigator.of(context).pop();
                      }),
                ),
                const SizedBox(width: 20),
                Expanded(
                  flex: 5,
                  child: GradientButton(
                    buttonText: confirmText,
                    onPressed: () {
                      onPressConfirm();
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
