import 'package:flutter/material.dart';
import 'package:house_helper_rental_application/core/theme/app_pallete.dart';

class NotificationTiles extends StatelessWidget {
  final String title, subtitle;
  final Function onTap;
  final bool enable;

  const NotificationTiles({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onTap,
    required this.enable,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
          height: 50.0,
          width: 50.0,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      "https://ktlpvxvfzxexvghactxx.supabase.co/storage/v1/object/sign/helpu_buckets/wireless.png?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJoZWxwdV9idWNrZXRzL3dpcmVsZXNzLnBuZyIsImlhdCI6MTcxMzU0NDM4NywiZXhwIjoxNzQ1MDgwMzg3fQ.eou_TXvFgMjOtazTe_m6rf4gkIilO-vZ9yQN2zhJ_5k&t=2024-04-19T16%3A33%3A07.167Z"),
                  fit: BoxFit.cover))),
      title: Text(title, style: const TextStyle(color: AppPallete.kDarkColor)),
      subtitle:
          Text(subtitle, style: const TextStyle(color: AppPallete.kLightColor)),
      onTap: () => onTap(),
      enabled: enable,
    );
  }
}
