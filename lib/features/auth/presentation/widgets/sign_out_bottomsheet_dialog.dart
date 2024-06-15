import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:house_helper_rental_application/core/common/widgets/confirm_bottomsheet_widget.dart';
import 'package:house_helper_rental_application/features/auth/presentation/bloc/auth_bloc.dart';

void signOutBottomSheetDialog(BuildContext context) {
  showModalBottomSheet(
      isDismissible: true,
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return ConfirmBottomSheetWidget(
                title: 'Are you sure you want to logout?',
                confirmText: 'Logout',
                cancelText: 'Cancel',
                onPressConfirm: () {
                  context.read<AuthBloc>().add(AuthSignOut());
                });
          },
        );
      });
}
