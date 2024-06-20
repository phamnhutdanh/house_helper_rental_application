import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:house_helper_rental_application/core/common/widgets/confirm_bottomsheet_widget.dart';
import 'package:house_helper_rental_application/core/common/widgets/default_app_bar.dart';
import 'package:house_helper_rental_application/core/common/widgets/loader.dart';
import 'package:house_helper_rental_application/core/theme/app_palette.dart';
import 'package:house_helper_rental_application/core/utils/show_snackbar.dart';
import 'package:house_helper_rental_application/features/address/presentation/bloc/address_bloc.dart';
import 'package:house_helper_rental_application/features/address/presentation/widgets/add_address_bottomsheet_dialog.dart';
import 'package:house_helper_rental_application/features/address/presentation/widgets/address_item.dart';
import 'package:house_helper_rental_application/features/auth/presentation/bloc/auth_bloc.dart';

class ChooseEmployeeAddressPage extends StatefulWidget {
  const ChooseEmployeeAddressPage({
    super.key,
  });

  @override
  State<ChooseEmployeeAddressPage> createState() =>
      _ChooseEmployeeAddressPageState();
}

class _ChooseEmployeeAddressPageState extends State<ChooseEmployeeAddressPage> {
  late final currentUser =
      (BlocProvider.of<AuthBloc>(context).state as AuthSuccess).accountInfo;
  @override
  void initState() {
    context.read<AddressBloc>().add(GetAllAddressOfEmployeeEvent(
        employeeId: currentUser.employee!.id ?? ''));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPalette.whiteColor,
      appBar: DefaultAppBar(
          title: 'Change address',
          isVisibleBackButton: true,
          onPressBack: () {
            Beamer.of(context).beamBack();
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            return showFormAddAddressBottomSheetDialog(context);
          });
        },
        child: const Icon(
          Icons.add,
          color: AppPalette.thirdColor,
        ),
      ),
      body: Padding(
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

                if (state is FetchAllAddressOfEmployeeDisplaySuccess) {
                  final employeeAddresses = state.employeeAddresses;
                  if (employeeAddresses.isEmpty) {
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
                      itemCount: employeeAddresses.length,
                      itemBuilder: (context, index) => AddressItem(
                        address:
                            employeeAddresses[index].address!.address ?? '',
                        phone: employeeAddresses[index].address!.phone ?? '',
                        fullName:
                            employeeAddresses[index].address!.fullName ?? '',
                        onPressItem: () {
                          setState(() {
                            return showConfirmDeleteDialog(
                                context, employeeAddresses[index].id ?? '');
                          });
                        },
                      ),
                      separatorBuilder: (_, __) => const SizedBox(
                        height: 12,
                      ),
                    ),
                  );
                }
                return const SizedBox();
              },
            ),
          ],
        ),
      ),
    );
  }
}

void showConfirmDeleteDialog(BuildContext context, String employeeAddressId) {
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
                } else if (state is RemoveEmployeeAddressSuccess) {
                  var currentUser =
                      (BlocProvider.of<AuthBloc>(context).state as AuthSuccess)
                          .accountInfo;
                  context.read<AddressBloc>().add(GetAllAddressOfEmployeeEvent(
                      employeeId: currentUser.employee!.id ?? ''));
                  Navigator.of(context).pop();
                }
              },
              builder: (context, state) {
                if (state is AddressLoading) {
                  return const Loader();
                }
                return ConfirmBottomSheetWidget(
                    title: 'Are you sure you want to delete this?',
                    confirmText: 'Yes',
                    cancelText: 'Cancel',
                    onPressConfirm: () {
                      context.read<AddressBloc>().add(
                          RemoveEmployeeAddressEvent(id: employeeAddressId));
                    });
              },
            );
          },
        );
      });
}
