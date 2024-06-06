import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:house_helper_rental_application/core/common/widgets/default_app_bar.dart';
import 'package:house_helper_rental_application/features/accounts/presentation/pages/accounts_page.dart';
import 'package:house_helper_rental_application/features/address/presentation/bloc/address_bloc.dart';
import 'package:house_helper_rental_application/features/address/presentation/widgets/address_item.dart';
import 'package:house_helper_rental_application/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:house_helper_rental_application/features/app_user/presentation/cubits/app_user/app_account_cubit.dart';

class ChooseAddressPage extends StatefulWidget {
  const ChooseAddressPage({
    super.key,
  });

  @override
  State<ChooseAddressPage> createState() => _ChooseAddressPageState();
}

class _ChooseAddressPageState extends State<ChooseAddressPage> {
  final addressList = [];

  @override
  void initState() {
    final authState = context.read<AuthBloc>().state;
    // if (authState is AuthSuccess) {
    // context.read<AddressBloc>().add(GetAllAddressOfCustomerEvent(customerId: authState.accountInfo.));

    // }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
          title: 'Choose address',
          isVisibleBackButton: true,
          onPressBack: () {
            Beamer.of(context).beamBack();
          }),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: ListView.separated(
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          itemCount: 10,
          itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              //   final notificationId = addressList[index].id ?? '';
              // Beamer.of(context).beamToNamed(
              //     '/booking_history/booking_details/$notificationId');
            },
            child: AddressItem(),
          ),
          separatorBuilder: (_, __) => const Divider(),
        ),
      ),
    );
  }
}
