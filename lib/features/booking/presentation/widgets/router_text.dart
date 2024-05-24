import 'package:flutter/material.dart';
import 'package:house_helper_rental_application/core/constants/constants.dart';

class RouterText extends StatelessWidget {
  const RouterText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: SizeConfig.screenHeight! / 85.38,
        bottom: SizeConfig.screenHeight! / 85.38,
      ),
      child: Text("Successfully completed!",
          style: TextStyle(
            color: Colors.black54,
            fontSize: SizeConfig.screenHeight! / 27.32,
          )),
    );
  }
}
