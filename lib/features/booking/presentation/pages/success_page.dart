import 'package:flutter/material.dart';
import 'package:house_helper_rental_application/core/constants/constants.dart';
import 'package:house_helper_rental_application/features/booking/presentation/widgets/lottie_widget.dart';
import 'package:house_helper_rental_application/features/booking/presentation/widgets/ok_button.dart';
import 'package:house_helper_rental_application/features/booking/presentation/widgets/router_text.dart';

class CheckCart extends StatelessWidget {
  const CheckCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(children: [
        LottieWidget(),
        RouterText(),
        SizedBox(
          height: SizeConfig.screenHeight! / 68.3,
        ),
        OkButton(),
      ]),
    );
  }
}
