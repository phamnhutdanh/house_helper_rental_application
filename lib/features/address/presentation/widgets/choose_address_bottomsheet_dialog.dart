import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:house_helper_rental_application/core/common/entities/address.dart';
import 'package:house_helper_rental_application/core/common/widgets/gradient_button.dart';
import 'package:house_helper_rental_application/core/common/widgets/loader.dart';
import 'package:house_helper_rental_application/core/theme/app_palette.dart';
import 'package:house_helper_rental_application/core/utils/show_snackbar.dart';
import 'package:house_helper_rental_application/features/address/presentation/bloc/address_bloc.dart';
import 'package:house_helper_rental_application/features/address/presentation/widgets/add_address_bottomsheet_dialog.dart';
import 'package:house_helper_rental_application/features/address/presentation/widgets/choose_address_bottomsheet_item.dart';
import 'package:house_helper_rental_application/features/auth/presentation/bloc/auth_bloc.dart';

void showAddressListBottomSheetDialog({
  required BuildContext context,
  required void Function({CustomerAddress? customerAddress}) onPressItem,
}) {
  var currentUser =
      (BlocProvider.of<AuthBloc>(context).state as AuthSuccess).accountInfo;

  context.read<AddressBloc>().add(
      GetAllAddressOfCustomerEvent(customerId: currentUser.customer!.id ?? ''));

  showModalBottomSheet(
      isDismissible: true,
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  BlocConsumer<AddressBloc, AddressState>(
                    listener: (BuildContext context, AddressState state) {
                      if (state is AddressFailure) {
                        showSnackBar(context, state.error);
                      }
                    },
                    builder: (BuildContext context, AddressState state) {
                      if (state is AddressLoading) {
                        return const Loader();
                      }

                      if (state is FetchAllAddressOfCustomerDisplaySuccess) {
                        final customerAddresses = state.customerAddresses;
                        if (customerAddresses.isEmpty) {
                          return const Expanded(
                            child: Column(
                              children: [
                                Text('No address found.'),
                              ],
                            ),
                          );
                        }
                        return Expanded(
                          child: ListView.separated(
                            physics: const ClampingScrollPhysics(),
                            itemCount: customerAddresses.length,
                            itemBuilder: (context, index) => InkWell(
                              onTap: () {
                                onPressItem(
                                  customerAddress: customerAddresses[index],
                                );
                              },
                              child: ChooseAddressBottomSheetItem(
                                address:
                                    customerAddresses[index].address!.address ??
                                        '',
                                phone:
                                    customerAddresses[index].address!.phone ??
                                        '',
                                fullName: customerAddresses[index]
                                        .address!
                                        .fullName ??
                                    '',
                              ),
                            ),
                            separatorBuilder: (_, __) => const Divider(
                              color: AppPalette.greyColor,
                              height: 1,
                            ),
                          ),
                        );
                      }
                      return const SizedBox();
                    },
                  ),
                  GradientButton(
                      buttonText: 'Add address',
                      onPressed: () {
                        return showFormAddAddressBottomSheetDialog(context);
                      }),
                ],
              ),
            );
          },
        );
      });
}
