import 'package:flutter/material.dart';
import 'package:house_helper_rental_application/core/common/entities/enum_type.dart';
import 'package:house_helper_rental_application/core/common/entities/notification.dart';
import 'package:house_helper_rental_application/core/common/widgets/empty_widget.dart';
import 'package:house_helper_rental_application/features/auth/presentation/widgets/notification_item.dart';

class NotificationBookingTab extends StatelessWidget {
  final List<NotificationAccount> customerNotifications;
  final void Function(String, NotificationStatus) onTapItem;
  const NotificationBookingTab({
    super.key,
    required this.customerNotifications,
    required this.onTapItem,
  });

  @override
  Widget build(BuildContext context) {
    if (customerNotifications.isEmpty) {
      return const EmptyWidget(title: 'Nothing here');
    }
    return Container(
      padding: const EdgeInsets.all(20),
      child: ListView.separated(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        itemCount: customerNotifications.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            final notificationId = customerNotifications[index].id ?? '';
            final status = customerNotifications[index].status ??
                NotificationStatus.UNREAD;
            onTapItem(notificationId, status);
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
