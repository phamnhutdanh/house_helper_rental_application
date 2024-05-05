import 'package:flutter/material.dart';
import 'package:house_helper_rental_application/core/theme/app_pallete.dart';
import 'package:house_helper_rental_application/features/booking/presentation/pages/notification_page.dart';
import 'package:house_helper_rental_application/features/booking/presentation/widgets/defaultAppBar.dart';
import 'package:house_helper_rental_application/features/booking/presentation/widgets/defaultBackButton.dart';
import 'package:house_helper_rental_application/features/booking/presentation/widgets/notificationTiles.dart';

class NotificationList extends StatefulWidget {
  const NotificationList({super.key});

  @override
  State<NotificationList> createState() => _NotificationListState();
}

class _NotificationListState extends State<NotificationList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPallete.kWhiteColor,
      appBar: DefaultAppBar(
        title: 'Notifications',
        child: DefaultBackButton(),
      ),
      body: ListView.separated(
          physics: ClampingScrollPhysics(),
          padding: EdgeInsets.zero,
          itemCount: 12,
          itemBuilder: (context, index) {
            return NotificationTiles(
              title: 'E-Commerce',
              subtitle: 'Thanks for download E-Commerce app.',
              enable: true,
              onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => NotificationPage())),
            );
          },
          separatorBuilder: (context, index) {
            return Divider();
          }),
    );
  }
}
