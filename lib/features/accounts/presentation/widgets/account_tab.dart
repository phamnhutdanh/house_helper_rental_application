import 'package:flutter/material.dart';
import 'package:house_helper_rental_application/core/common/entities/account_info.dart';
import 'package:house_helper_rental_application/core/common/entities/enum_type.dart';
import 'package:house_helper_rental_application/features/accounts/presentation/widgets/account_item.dart';

class AccountTab extends StatelessWidget {
  final List<AccountInfo> accounts;

  final void Function(String) onTapItem;
  const AccountTab({
    super.key,
    required this.accounts,
    required this.onTapItem,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: ListView.separated(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        itemCount: accounts.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            final accountId = accounts[index].id ?? '';
            // Beamer.of(context).beamToNamed(
            //     '/booking_history/booking_details/$notificationId');
            onTapItem(accountId);
          },
          child: accounts[index].accountRole == AccountInfoRole.CUSTOMER
              ? AccountItem(
                  name: accounts[index].customer!.name ?? '',
                  email: accounts[index].email ?? '',
                  imageUri: accounts[index].customer!.imageUri ?? '',
                )
              : AccountItem(
                  name: accounts[index].employee!.name ?? '',
                  email: accounts[index].email ?? '',
                  imageUri: accounts[index].employee!.imageUri ?? '',
                ),
        ),
        separatorBuilder: (_, __) => const Divider(),
      ),
    );
  }
}
