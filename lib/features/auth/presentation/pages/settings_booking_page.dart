import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:house_helper_rental_application/core/common/widgets/loader.dart';
import 'package:house_helper_rental_application/core/theme/app_palette.dart';
import 'package:house_helper_rental_application/core/utils/show_snackbar.dart';
import 'package:house_helper_rental_application/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:house_helper_rental_application/features/auth/presentation/pages/login_page.dart';
import 'package:house_helper_rental_application/features/auth/presentation/widgets/sign_out_bottomsheet_dialog.dart';
import 'package:iconly/iconly.dart';

final settingLabels = [
  'Edit information',
  'Change address',
  'Favorite employee',
  'Credit card',
  'Logout',
];

class SettingsBookingPage extends StatefulWidget {
  const SettingsBookingPage({super.key});

  @override
  State<SettingsBookingPage> createState() => _SettingsBookingPageState();
}

class _SettingsBookingPageState extends State<SettingsBookingPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: AppPalette.whiteColor,
      appBar: AppBar(
        title: const Text("Setting",
            style: TextStyle(color: AppPalette.blackColor)),
        centerTitle: true,
        backgroundColor: AppPalette.whiteColor,
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
                    fontSize: 16.0, color: AppPalette.blackColor),
              ),
              trailing: const Icon(
                IconlyLight.arrow_right_2,
                size: 16.0,
                color: AppPalette.blackColor,
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
                    return signOutBottomSheetDialog(context);
                }
              }),
            );
          },
          separatorBuilder: (context, index) {
            return const Divider();
          },
        );
      }),
    );
  }
}
