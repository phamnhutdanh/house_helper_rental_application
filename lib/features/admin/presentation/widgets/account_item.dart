import 'package:flutter/material.dart';
import 'package:house_helper_rental_application/core/theme/app_palette.dart';

class AccountItem extends StatelessWidget {
  final String imageUri;
  final String name;
  final String email;

  const AccountItem({
    super.key,
    required this.imageUri,
    required this.name,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        height: 50.0,
        width: 50.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          image: DecorationImage(
            image: NetworkImage(imageUri),
            fit: BoxFit.cover,
          ),
        ),
      ),
      title: Text(name, style: const TextStyle(color: AppPalette.darkGrey)),
      subtitle:
          Text(email, style: const TextStyle(color: AppPalette.kLightColor)),
    );
  }
}
