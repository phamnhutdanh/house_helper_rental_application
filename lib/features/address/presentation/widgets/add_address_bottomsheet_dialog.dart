import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:house_helper_rental_application/core/common/entities/enum_type.dart';
import 'package:house_helper_rental_application/core/common/widgets/loader.dart';
import 'package:house_helper_rental_application/core/utils/show_snackbar.dart';
import 'package:house_helper_rental_application/features/address/presentation/bloc/address_bloc.dart';
import 'package:house_helper_rental_application/features/address/presentation/widgets/add_address_bottomsheet_widget.dart';
import 'package:house_helper_rental_application/features/auth/presentation/bloc/auth_bloc.dart';

void showFormAddAddressBottomSheetDialog(BuildContext context) {
  showModalBottomSheet(
      isDismissible: true,
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return BlocConsumer<AddressBloc, AddressState>(
              listener: (context, state) {
                if (state is AddressFailure) {
                  showSnackBar(context, state.error);
                }

                if (state is CreateEmployeeAddressSuccess) {
                  var currentUser =
                      (BlocProvider.of<AuthBloc>(context).state as AuthSuccess)
                          .accountInfo;
                  context.read<AddressBloc>().add(GetAllAddressOfEmployeeEvent(
                      employeeId: currentUser.employee!.id ?? ''));
                  Navigator.of(context).pop();
                }
                if (state is CreateCustomerAddressSuccess) {
                  var currentUser =
                      (BlocProvider.of<AuthBloc>(context).state as AuthSuccess)
                          .accountInfo;
                  context.read<AddressBloc>().add(GetAllAddressOfCustomerEvent(
                      customerId: currentUser.customer!.id ?? ''));
                  Navigator.of(context).pop();
                }
              },
              builder: (context, state) {
                if (state is AddressLoading) {
                  return const Loader();
                }
                return AddAddressBottomSheetWidget(
                  onPressConfirm: ({address, fullName, phone}) {
                    final currentUser = (BlocProvider.of<AuthBloc>(context)
                            .state as AuthSuccess)
                        .accountInfo;

                    if (currentUser.accountRole == AccountInfoRole.CUSTOMER) {
                      // add customer address
                      context
                          .read<AddressBloc>()
                          .add(CreateCustomerAddressEvent(
                            address: address!,
                            fullName: fullName!,
                            phone: phone!,
                            customerId: currentUser.customer!.id ?? '',
                            isDefault: false,
                          ));
                    } else if (currentUser.accountRole ==
                        AccountInfoRole.EMPLOYEE) {
                      // add employee address
                      context
                          .read<AddressBloc>()
                          .add(CreateEmployeeAddressEvent(
                            address: address!,
                            fullName: fullName!,
                            phone: phone!,
                            employeeId: currentUser.employee!.id ?? '',
                            isDefault: false,
                          ));
                    }
                  },
                );
              },
            );
          },
        );
      });
}
