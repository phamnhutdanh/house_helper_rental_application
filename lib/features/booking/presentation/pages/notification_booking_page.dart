import 'package:flutter/material.dart';
import 'package:house_helper_rental_application/core/common/entities/enum_type.dart';
import 'package:house_helper_rental_application/core/common/entities/notification.dart';
import 'package:house_helper_rental_application/features/booking/presentation/pages/generic_tab_page.dart';
import 'package:house_helper_rental_application/features/booking/presentation/widgets/notification_booking_tab.dart';
import 'package:house_helper_rental_application/features/booking/presentation/widgets/tab_item.dart';

class NotificationBookingPage extends StatefulWidget {
  const NotificationBookingPage({super.key});

  @override
  State<NotificationBookingPage> createState() =>
      _NotificationBookingPageState();
}

class _NotificationBookingPageState extends State<NotificationBookingPage> {
  final List<NotificationCustomer> notifs = [
    NotificationCustomer(
      id: '1',
      title: 'Notif 1',
      description:
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
      status: NotificationStatus.UNREAD,
    ),
    NotificationCustomer(
      id: '2',
      title: 'Notif 2',
      description:
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
      status: NotificationStatus.READ,
    ),
    NotificationCustomer(
      id: '3',
      title: 'Notif 3',
      description:
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
      status: NotificationStatus.READ,
    ),
    NotificationCustomer(
      id: '4',
      title: 'Notif 4',
      description:
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
      status: NotificationStatus.UNREAD,
    ),
    NotificationCustomer(
      id: '5',
      title: 'Notif 5',
      description:
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
      status: NotificationStatus.UNREAD,
    ),
    NotificationCustomer(
      id: '6',
      title: 'Notif 6',
      description:
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
      status: NotificationStatus.UNREAD,
    ),
    NotificationCustomer(
      id: '7',
      title: 'Notif 7',
      description:
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
      status: NotificationStatus.READ,
    ),
  ];

  late List<NotificationCustomer> readNotifs = notifs
      .where((element) => element.status == NotificationStatus.READ)
      .toList();

  late List<NotificationCustomer> unreadNotifs = notifs
      .where((element) => element.status == NotificationStatus.UNREAD)
      .toList();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GenericTabPage(
      title: 'Notification',
      isScrollableTab: false,
      tabs: [
        TabItem(title: 'ALL', count: notifs.length),
        TabItem(title: 'READ', count: readNotifs.length),
        TabItem(title: 'UNREAD', count: unreadNotifs.length),
      ],
      children: [
        NotificationBookingTab(
          customerNotifications: notifs,
          onTapItem: (notificationId) {},
        ),
        NotificationBookingTab(
          customerNotifications: readNotifs,
          onTapItem: (notificationId) {},
        ),
        NotificationBookingTab(
          customerNotifications: unreadNotifs,
          onTapItem: (notificationId) {},
        ),
      ],
    );
  }
}
