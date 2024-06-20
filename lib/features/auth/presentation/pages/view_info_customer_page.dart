import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:house_helper_rental_application/core/common/entities/address.dart';
import 'package:house_helper_rental_application/core/common/widgets/default_app_bar.dart';
import 'package:house_helper_rental_application/core/theme/app_palette.dart';
import 'package:house_helper_rental_application/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:house_helper_rental_application/features/employees/presentation/widgets/button_widget.dart';

class ViewInfoCustomerPage extends StatefulWidget {
  const ViewInfoCustomerPage({super.key});

  @override
  State<ViewInfoCustomerPage> createState() => _ViewInfoCustomerPageState();
}

class _ViewInfoCustomerPageState extends State<ViewInfoCustomerPage> {
  @override
  void initState() {
    super.initState();
  }

  void onRefreshPreviousScreen() {}

  @override
  Widget build(BuildContext context) {
    final currentAccount =
        (BlocProvider.of<AuthBloc>(context).state as AuthSuccess).accountInfo;

    return Scaffold(
      appBar: DefaultAppBar(
        title: 'View info',
        isVisibleBackButton: true,
        onPressBack: () {
          onRefreshPreviousScreen();
          Beamer.of(context).beamBack();
        },
      ),
      backgroundColor: AppPalette.whiteColor,
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const SizedBox(height: 24),
          Center(
            child: Stack(
              children: [
                ClipOval(
                  child: Material(
                    color: Colors.transparent,
                    child: Ink.image(
                      image:
                          NetworkImage(currentAccount.customer!.imageUri ?? ''),
                      fit: BoxFit.cover,
                      width: 128,
                      height: 128,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          buildName(
            email: currentAccount.email ?? '',
            name: currentAccount.customer!.name ?? '',
            phoneNumber: currentAccount.customer!.phoneNumber ?? '',
          ),
          const SizedBox(height: 24),
          Center(
              child: ButtonWidget(
            text: 'Edit profile',
            onClicked: () {
              Beamer.of(context).beamToNamed('/booking_settings/edit_info');
            },
          )),
          const SizedBox(height: 48),
          buildAddressCustomer(
              customerAddresses:
                  currentAccount.customer!.customerAddresses ?? []),
        ],
      ),
    );
  }
}

Widget buildName({
  required String name,
  required String email,
  required String phoneNumber,
}) =>
    Column(
      children: [
        Text(
          name,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        const SizedBox(height: 4),
        Text(
          email,
          style: const TextStyle(color: Colors.grey),
        ),
        const SizedBox(height: 4),
        Text(
          phoneNumber,
          style: const TextStyle(color: Colors.grey),
        ),
      ],
    );

Widget buildAddressCustomer(
        {required List<CustomerAddress> customerAddresses}) =>
    Container(
      padding: const EdgeInsets.symmetric(horizontal: 48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Address',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          ListView.separated(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemCount: customerAddresses.length,
            itemBuilder: (context, index) => Text(
              customerAddresses[index].address!.address ?? '',
              style: const TextStyle(fontSize: 16, height: 1.4),
            ),
            separatorBuilder: (_, __) => const SizedBox(height: 4),
          ),
        ],
      ),
    );
