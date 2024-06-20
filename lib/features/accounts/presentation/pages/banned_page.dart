import 'package:flutter/material.dart';
import 'package:house_helper_rental_application/core/common/widgets/gradient_button.dart';
import 'package:house_helper_rental_application/core/theme/app_palette.dart';
import 'package:house_helper_rental_application/features/auth/presentation/pages/login_page.dart';

class BannedPage extends StatefulWidget {
  const BannedPage({super.key});

  @override
  State<BannedPage> createState() => _BannedPageState();
}

class _BannedPageState extends State<BannedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPalette.whiteColor,
      resizeToAvoidBottomInset: true,
      body: Container(
        padding: const EdgeInsets.all(32.0),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20.0),
            Center(
              child: SizedBox(
                width: 90,
                height: 90,
                child: Image.network(
                    "https://ktlpvxvfzxexvghactxx.supabase.co/storage/v1/object/sign/helpu_buckets/banned.png?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJoZWxwdV9idWNrZXRzL2Jhbm5lZC5wbmciLCJpYXQiOjE3MTg3MjkwNDcsImV4cCI6MTc1MDI2NTA0N30.1px028CC7KoIBWccL3vSI-BFAF7FRTwoAu2n0onYzzk&t=2024-06-18T16%3A44%3A06.988Z"),
              ),
            ),
            const SizedBox(height: 20.0),
            const Text(
              "BANNED!",
              style: TextStyle(
                color: AppPalette.errorColor,
                fontSize: 40.0,
              ),
            ),
            const SizedBox(height: 20.0),
            const Text(
              "Your account has been banned!",
              style: TextStyle(
                color: AppPalette.greyColor,
                fontSize: 20.0,
              ),
            ),
            const SizedBox(height: 20.0),
            GradientButton(
              buttonText: "Go back",
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  LoginPage.route(),
                  (route) => false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
