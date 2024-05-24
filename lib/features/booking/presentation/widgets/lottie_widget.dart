import 'package:flutter/material.dart';
import 'package:house_helper_rental_application/core/constants/constants.dart';

import 'package:lottie/lottie.dart';

class LottieWidget extends StatelessWidget {
  const LottieWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.network(
        "https://assets8.lottiefiles.com/packages/lf20_jz2wa00k.json",
        height: SizeConfig.screenHeight! / 2.28,
        width: SizeConfig.screenWidth! / 1.37,
        repeat: false,
      ),
    );
  }
}
