import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:house_helper_rental_application/core/common/entities/enum_type.dart';
import 'package:house_helper_rental_application/core/common/widgets/confirm_bottomsheet_widget.dart';
import 'package:house_helper_rental_application/core/common/widgets/loader.dart';
import 'package:house_helper_rental_application/core/utils/show_snackbar.dart';
import 'package:house_helper_rental_application/features/accounts/presentation/bloc/accounts_bloc.dart';
import 'package:house_helper_rental_application/features/auth/presentation/bloc/admin_bloc.dart';

void showBanBottomSheetDialog(BuildContext context, String id) {
  showModalBottomSheet(
      isDismissible: true,
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return BlocConsumer<AdminBloc, AdminState>(
              listener: (context, state) {
                if (state is AdminFailure) {
                  showSnackBar(context, state.error);
                }
                if (state is ChangeAccountStatusSuccess) {
                  context.read<AccountsBloc>().add(GetAccountByIdEvent(id: id));
                  Navigator.of(context).pop();
                }
              },
              builder: (context, state) {
                if (state is AdminLoading) {
                  return const Loader();
                }
                return ConfirmBottomSheetWidget(
                    title: 'Are you sure you want to banned this user?',
                    confirmText: 'Confirm',
                    cancelText: 'Cancel',
                    onPressConfirm: () {
                      context.read<AdminBloc>().add(ChangeAccountStatusEvent(
                          accountId: id, status: AccountStatus.BANNED));
                    });
              },
            );
          },
        );
      });
}

void showUnBanBottomSheetDialog(BuildContext context, String id) {
  showModalBottomSheet(
      isDismissible: true,
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return BlocConsumer<AdminBloc, AdminState>(
              listener: (context, state) {
                if (state is AdminFailure) {
                  showSnackBar(context, state.error);
                }
                if (state is ChangeAccountStatusSuccess) {
                  context.read<AccountsBloc>().add(GetAccountByIdEvent(id: id));
                  Navigator.of(context).pop();
                }
              },
              builder: (context, state) {
                if (state is AdminLoading) {
                  return const Loader();
                }
                return ConfirmBottomSheetWidget(
                    title: 'Are you sure you want to unbanned this user?',
                    confirmText: 'Confirm',
                    cancelText: 'Cancel',
                    onPressConfirm: () {
                      context.read<AdminBloc>().add(ChangeAccountStatusEvent(
                          accountId: id, status: AccountStatus.NONE));
                    });
              },
            );
          },
        );
      });
}
