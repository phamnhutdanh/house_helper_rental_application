import 'package:flutter/material.dart';
import 'package:house_helper_rental_application/core/theme/app_palette.dart';
import 'package:lottie/lottie.dart';

class SuccessPage extends StatefulWidget {
  const SuccessPage({super.key});

  @override
  State<SuccessPage> createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(children: [
        Center(
          child: Lottie.network(
            "https://assets8.lottiefiles.com/packages/lf20_jz2wa00k.json",
            height: 40.0,
            width: 40.0,
            repeat: true,
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(
            top: 12.0,
            bottom: 12.0,
          ),
          child: Text("Successfully completed!",
              style: TextStyle(
                color: Colors.black54,
                fontSize: 12.0,
              )),
        ),
        const SizedBox(height: 20.0),
        InkWell(
            onTap: () {},
            child: Container(
              width: 20.0,
              height: 12.0,
              decoration: BoxDecoration(
                color: AppPalette.thirdColor,
                borderRadius: BorderRadius.circular(30),
              ),
              child: const Center(
                child: Text(
                  "OK",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.0,
                  ),
                ),
              ),
            )),
      ]),
    );
  }
}
