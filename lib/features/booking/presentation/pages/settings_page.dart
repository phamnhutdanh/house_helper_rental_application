import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:house_helper_rental_application/core/common/widgets/confirm_bottom_sheet_dialog.dart';
import 'package:house_helper_rental_application/core/common/widgets/loader.dart';
import 'package:house_helper_rental_application/core/theme/app_pallete.dart';
import 'package:house_helper_rental_application/core/utils/show_snackbar.dart';
import 'package:house_helper_rental_application/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:house_helper_rental_application/features/auth/presentation/pages/login_page.dart';
import 'package:iconly/iconly.dart';

final settingLabels = [
  'Edit information',
  'Change address',
  'Favorite employee',
  'Credit card',
  'Logout',
];

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        backgroundColor: AppPallete.whiteColor,
        appBar: AppBar(
          title: const Text("Setting",
              style: TextStyle(color: AppPallete.blackColor)),
          centerTitle: true,
          backgroundColor: AppPallete.whiteColor,
          automaticallyImplyLeading: false,
        ),
        body: BlocConsumer<AuthBloc, AuthState>(listener: (context, state) {
          if (state is AuthFailure) {
            showSnackBar(context, state.message);
          } else if (state is AuthInitial) {
            Navigator.of(context, rootNavigator: true)
                .pushAndRemoveUntil(LoginPage.route(), (route) => false);
          }
        }, builder: (context, state) {
          if (state is AuthLoading) {
            return const Loader();
          }

          return ListView.separated(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemCount: settingLabels.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  settingLabels[index],
                  style: const TextStyle(
                      fontSize: 16.0, color: AppPallete.blackColor),
                ),
                trailing: const Icon(
                  IconlyLight.arrow_right_2,
                  size: 16.0,
                  color: AppPallete.blackColor,
                ),
                onTap: () => setState(() {
                  switch (index) {
                    case 0:
                      return showSnackBar(context, 'Edit information');
                    case 1:
                      return showSnackBar(context, 'Change address');
                    case 2:
                      return showSnackBar(context, 'Favorite employee');
                    case 3:
                      return showSnackBar(context, 'Credit card');
                    case 4:
                      return signOutDrawer(context);
                  }
                }),
              );
            },
            separatorBuilder: (context, index) {
              return const Divider();
            },
          );
        }));
  }
}

void signOutDrawer(BuildContext context) {
  showModalBottomSheet(
      isDismissible: false,
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return ConfirmDialog(
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
