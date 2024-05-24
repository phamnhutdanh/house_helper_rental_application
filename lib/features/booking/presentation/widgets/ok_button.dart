import 'package:flutter/material.dart';
import 'package:house_helper_rental_application/core/constants/constants.dart';
import 'package:house_helper_rental_application/core/theme/app_palette.dart';

class OkButton extends StatefulWidget {
  const OkButton({Key? key}) : super(key: key);

  @override
  _OkButtonState createState() => _OkButtonState();
}

class _OkButtonState extends State<OkButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
          width: SizeConfig.screenWidth! / 2,
          height: SizeConfig.screenHeight! / 12.42,
          decoration: BoxDecoration(
            color: Color(0xFFFF9505),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Center(
              child: Text(
            "OK",
            style: TextStyle(
                color: Colors.white,
                fontSize: SizeConfig.screenHeight! / 37.95),
          ))),
    );
  }
}
