import 'package:flutter/material.dart';
import 'package:house_helper_rental_application/core/common/entities/notification.dart';
import 'package:house_helper_rental_application/features/booking/presentation/widgets/notification_item.dart';

class NotificationBookingTab extends StatelessWidget {
  final List<NotificationCustomer> customerNotifications;
  final void Function(String) onTapItem;
  const NotificationBookingTab({
    super.key,
    required this.customerNotifications,
    required this.onTapItem,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: ListView.separated(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        itemCount: customerNotifications.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            final notificationId = customerNotifications[index].id ?? '';
            // Beamer.of(context).beamToNamed(
            //     '/booking_history/booking_details/$notificationId');
            onTapItem(notificationId);
          },
          child: NotificationItem(
            title: customerNotifications[index].title ?? '',
            subtitle: customerNotifications[index].description ?? '',
          ),
        ),
        separatorBuilder: (_, __) => const Divider(),
      ),
    );
  }
}
