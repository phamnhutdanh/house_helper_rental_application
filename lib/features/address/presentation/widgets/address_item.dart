import 'package:flutter/material.dart';
import 'package:house_helper_rental_application/core/theme/app_palette.dart';
import 'package:iconly/iconly.dart';

class AddressItem extends StatelessWidget {
  final void Function() onPressItem;
  final String address;
  final String phone;
  final String fullName;
  const AddressItem({
    super.key,
    required this.address,
    required this.phone,
    required this.fullName,
    required this.onPressItem,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppPalette.whiteColor, // Container color
        border: Border.all(
          color: AppPalette.borderColor, // Border color
          width: 1.0, // Border width
        ),
        borderRadius: BorderRadius.circular(8.0), // Border radius
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(width: 12),
          Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      fullName,
                      style: const TextStyle(
                          color: AppPalette.blackColor,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      phone,
                      style: const TextStyle(
                          color: AppPalette.blackColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              IconButton(
                  onPressed: () {
                    onPressItem();
                  },
                  icon: const Icon(
                    IconlyBold.delete,
                    color: AppPalette.errorColor,
                    size: 40,
                  )),
            ],
          ),
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
