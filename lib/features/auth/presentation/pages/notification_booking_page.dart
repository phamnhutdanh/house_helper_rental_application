import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:house_helper_rental_application/core/common/entities/enum_type.dart';
import 'package:house_helper_rental_application/core/common/entities/notification.dart';
import 'package:house_helper_rental_application/core/common/pages/generic_tab_page.dart';
import 'package:house_helper_rental_application/core/common/widgets/loader.dart';
import 'package:house_helper_rental_application/core/utils/show_snackbar.dart';
import 'package:house_helper_rental_application/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:house_helper_rental_application/features/auth/presentation/bloc/noti_bloc.dart';
import 'package:house_helper_rental_application/features/auth/presentation/widgets/notification_booking_tab.dart';
import 'package:house_helper_rental_application/core/common/widgets/tab_item.dart';

class NotificationBookingPage extends StatefulWidget {
  const NotificationBookingPage({super.key});

  @override
  State<NotificationBookingPage> createState() =>
      _NotificationBookingPageState();
}

class _NotificationBookingPageState extends State<NotificationBookingPage> {
  late final currentAccount =
      (BlocProvider.of<AuthBloc>(context).state as AuthSuccess).accountInfo;

  @override
  void initState() {
    context
        .read<NotiBloc>()
        .add(GetAllNotiEvent(accountId: currentAccount.id ?? ''));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NotiBloc, NotiState>(
      listener: (context, state) {
        if (state is NotiFailure) {
          showSnackBar(context, state.error);
        }
        if (state is ChangeNotiStatusSuccess) {
          context
              .read<NotiBloc>()
              .add(GetAllNotiEvent(accountId: currentAccount.id ?? ''));
        }
      },
      builder: (context, state) {
        if (state is NotiLoading) {
          return const Loader();
        }
        if (state is GetAllNotiSuccess) {
          final List<NotificationAccount> notifs = state.notificationAccounts;

          late List<NotificationAccount> readNotifs = notifs
              .where((element) => element.status == NotificationStatus.READ)
              .toList();

          late List<NotificationAccount> unreadNotifs = notifs
              .where((element) => element.status == NotificationStatus.UNREAD)
              .toList();

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
                onTapItem: (notificationId, status) {
                  context.read<NotiBloc>().add(ChangeNotiEvent(
                      id: notificationId,
                      status: status == NotificationStatus.UNREAD
                          ? "READ"
                          : "UNREAD"));
                },
              ),
              NotificationBookingTab(
                customerNotifications: readNotifs,
                onTapItem: (notificationId, status) {
                  context.read<NotiBloc>().add(
                      ChangeNotiEvent(id: notificationId, status: "UNREAD"));
                },
              ),
              NotificationBookingTab(
                customerNotifications: unreadNotifs,
                onTapItem: (notificationId, status) {
                  context
                      .read<NotiBloc>()
                      .add(ChangeNotiEvent(id: notificationId, status: "READ"));
                },
              ),
            ],
          );
        }
        return const SizedBox();
      },
    );
  }
}
