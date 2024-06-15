import 'package:flutter/material.dart';
import 'package:house_helper_rental_application/core/theme/app_palette.dart';

class ChooseAddressBottomSheetItem extends StatelessWidget {
  final String address;
  final String phone;
  final String fullName;

  const ChooseAddressBottomSheetItem({
    super.key,
    required this.address,
    required this.phone,
    required this.fullName,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(width: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                fullName,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(
                phone,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: AppPalette.greyColor),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Text(
                address,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
