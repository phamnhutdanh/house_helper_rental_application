import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:house_helper_rental_application/core/common/entities/address.dart';
import 'package:house_helper_rental_application/core/common/entities/enum_type.dart';
import 'package:house_helper_rental_application/core/common/widgets/default_app_bar.dart';
import 'package:house_helper_rental_application/core/common/widgets/gradient_button.dart';
import 'package:house_helper_rental_application/core/common/widgets/loader.dart';
import 'package:house_helper_rental_application/core/theme/app_palette.dart';
import 'package:house_helper_rental_application/core/utils/show_snackbar.dart';
import 'package:house_helper_rental_application/features/accounts/presentation/bloc/accounts_bloc.dart';
import 'package:house_helper_rental_application/features/accounts/presentation/widgets/show_ban_bottomsheet_dialog.dart';

class CustomerDetailPage extends StatefulWidget {
  final String accountId;
  const CustomerDetailPage({super.key, required this.accountId});

  @override
  State<CustomerDetailPage> createState() => _CustomerDetailPageState();
}

class _CustomerDetailPageState extends State<CustomerDetailPage> {
  @override
  void initState() {
    context.read<AccountsBloc>().add(GetAccountByIdEvent(id: widget.accountId));
    super.initState();
  }

  void onRefreshPreviousScreen() {
    context.read<AccountsBloc>().add(FetchAllAccountData());
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        onRefreshPreviousScreen();
      },
      child: Scaffold(
        appBar: DefaultAppBar(
          title: 'View info',
          isVisibleBackButton: true,
          onPressBack: () {
            onRefreshPreviousScreen();
            Beamer.of(context).beamBack();
          },
        ),
        backgroundColor: AppPalette.whiteColor,
        body: BlocConsumer<AccountsBloc, AccountsState>(
          listener: (context, state) {
            if (state is AccountsFailure) {
              showSnackBar(context, state.error);
            }
          },
          builder: (context, state) {
            if (state is AccountsLoading) {
              return const Loader();
            }

            if (state is GetAccountByIdSuccess) {
              final currentAccount = state.accountInfo;
              return ListView(
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
                              image: NetworkImage(
                                  currentAccount.customer!.imageUri ?? ''),
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
                  const SizedBox(height: 48),
                  buildAddressCustomer(
                      customerAddresses:
                          currentAccount.customer!.customerAddresses ?? []),
                  const SizedBox(height: 48),
                  if (currentAccount.status == AccountStatus.NONE)
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 48),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: GradientButton(
                              colors: const [
                                AppPalette.errorColor,
                                AppPalette.errorColor,
                              ],
                              textColor: AppPalette.whiteColor,
                              buttonText: 'Ban this user',
                              onPressed: () {
                                setState(() {
                                  return showBanBottomSheetDialog(
                                      context, widget.accountId);
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  if (currentAccount.status == AccountStatus.BANNED)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 48),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: GradientButton(
                              colors: const [
                                AppPalette.darkGrey,
                                AppPalette.darkGrey,
                              ],
                              textColor: AppPalette.whiteColor,
                              buttonText: 'Unban this user',
                              onPressed: () {
                                setState(() {
                                  return showUnBanBottomSheetDialog(
                                      context, widget.accountId);
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              );
            }
            return const SizedBox();
          },
        ),
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
