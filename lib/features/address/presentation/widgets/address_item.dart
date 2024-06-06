import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:house_helper_rental_application/core/theme/app_palette.dart';
import 'package:house_helper_rental_application/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:iconly/iconly.dart';

class AddressItem extends StatelessWidget {
  const AddressItem({super.key});

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
              const Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'name',
                      style: TextStyle(
                          color: AppPalette.blackColor,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'phone',
                      style: TextStyle(
                          color: AppPalette.blackColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              IconButton(
                  onPressed: () {}, icon: const Icon(IconlyBold.more_circle)),
            ],
          ),
          Row(
            children: [
              Text(
                'address addressaddressaddressaddress',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

void moreOptionBottomSheet(BuildContext context) {
  showModalBottomSheet(
      isDismissible: false,
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return const Column(
              children: [
                Row(
                  children: [
                    SizedBox(width: 20),
                    Icon(
                      IconlyBold.edit,
                      color: AppPalette.blackColor,
                      size: 16,
                    ),
                    SizedBox(width: 4),
                    Text(
                      'Edit',
                      style: TextStyle(
                          color: AppPalette.blackColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(width: 20),
                    Icon(
                      IconlyBold.delete,
                      color: AppPalette.errorColor,
                      size: 16,
                    ),
                    SizedBox(width: 4),
                    Text(
                      'Delete',
                      style: TextStyle(
                          color: AppPalette.errorColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            );
          },
        );
      });
}
