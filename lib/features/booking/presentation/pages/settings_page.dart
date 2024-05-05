import 'package:flutter/material.dart';
import 'package:house_helper_rental_application/core/constants/constants.dart';
import 'package:house_helper_rental_application/core/theme/app_pallete.dart';
import 'package:house_helper_rental_application/core/utils/show_snackbar.dart';
import 'package:house_helper_rental_application/features/booking/presentation/widgets/defaultAppBar.dart';
import 'package:house_helper_rental_application/features/booking/presentation/widgets/defaultBackButton.dart';

final settingLabel = [
  'Account',
  'Address',
  'Telephone',
  'Email',
  'Setting',
  'Order Notifications',
  'Discount Notifications',
  'Credit Card',
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
      appBar: DefaultAppBar(
        title: 'Setting Account',
        child: DefaultBackButton(),
      ),
      body: ListView.separated(
        padding: EdgeInsets.zero,
        itemCount: settingLabel.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              settingLabel[index],
              style: TextStyle(
                fontSize: 16.0,
                color: index % 4 == 0
                    ? AppPallete.kDarkColor
                    : AppPallete.kDarkColor.withOpacity(0.6),
              ),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              size: 20.0,
              color: index % 4 == 0
                  ? AppPallete.kDarkColor
                  : AppPallete.kDarkColor.withOpacity(0.6),
            ),
            enabled: settingLabel[index] == 'Account' ||
                    settingLabel[index] == 'Setting'
                ? false
                : true,
            onTap: () => setState(() {
              switch (settingLabel[index]) {
                case 'Address':
                  return showSnackBar(context, 'Address');
                case 'Telephone':
                  return showSnackBar(context, 'Telephone');
                case 'Email':
                  return showSnackBar(context, 'Email');
                case 'Order Notifications':
                  return showSnackBar(context, 'Order Notifications');
                case 'Discount Notifications':
                  return showSnackBar(context, 'Discount Notifications');
                case 'Credit Card':
                  return showSnackBar(context, 'Credit Card');
                case 'Logout':
                  return signOutDrawer(context);
              }
            }),
          );
        },
        separatorBuilder: (context, index) {
          return settingLabel[index] == 'Email' ||
                  settingLabel[index] == 'Credit Card'
              ? Constants.kSmallDivider
              : const Divider();
        },
      ),
    );
  }
}

void signOutDrawer(BuildContext context) {
  showModalBottomSheet(
      isDismissible: false,
      context: context,
      builder: (context) {
        return Container(
          color: AppPallete.kPrimaryColor,
          height: 150.0,
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: [
              const Text(
                'Are you sure you want Logout ?',
                style: TextStyle(
                  color: AppPallete.kWhiteColor,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: MaterialButton(
                      color: AppPallete.kWhiteColor,
                      child: const Text(
                        'Logout',
                        style: TextStyle(
                          color: AppPallete.kPrimaryColor,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  Expanded(
                    child: MaterialButton(
                      color: AppPallete.kPrimaryColor,
                      //  highlightedBorderColor: AppPallete.kWhiteColor,
                      //   borderSide: BorderSide(color: AppPallete.kWhiteColor),
                      child: const Text(
                        'Cancel',
                        style: TextStyle(
                          color: AppPallete.kWhiteColor,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      });
}
