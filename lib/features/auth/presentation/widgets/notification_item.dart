import 'package:flutter/material.dart';
import 'package:house_helper_rental_application/core/theme/app_palette.dart';

class NotificationItem extends StatelessWidget {
  final String title;
  final String subtitle;

  const NotificationItem({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppPalette.greyColor.withOpacity(0.25),
      ),
      child: ListTile(
        // leading: Container(
        //   height: 50.0,
        //   width: 50.0,
        //   decoration: const BoxDecoration(
        //     image: DecorationImage(
        //       image: NetworkImage(
        //           "https://ktlpvxvfzxexvghactxx.supabase.co/storage/v1/object/sign/helpu_buckets/wireless.png?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJoZWxwdV9idWNrZXRzL3dpcmVsZXNzLnBuZyIsImlhdCI6MTcxMzU0NDM4NywiZXhwIjoxNzQ1MDgwMzg3fQ.eou_TXvFgMjOtazTe_m6rf4gkIilO-vZ9yQN2zhJ_5k&t=2024-04-19T16%3A33%3A07.167Z"),
        //       fit: BoxFit.cover,
        //     ),
        //   ),
        // ),
        title: Text(title,
            style: const TextStyle(
                color: AppPalette.backgroundColor, fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle,
            style: const TextStyle(
                color: AppPalette.darkGrey, fontWeight: FontWeight.w200)),
      ),
    );
  }
}
