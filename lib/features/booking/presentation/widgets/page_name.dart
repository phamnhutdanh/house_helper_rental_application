import 'package:flutter/material.dart';
import 'package:house_helper_rental_application/core/constants/constants.dart';

class PageName extends StatelessWidget {
  final String textName;
  const PageName({super.key, required this.textName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        SizeConfig.screenWidth! / 27.4,
        SizeConfig.screenHeight! / 341.5,
        SizeConfig.screenWidth! / 20.55,
        SizeConfig.screenHeight! / 68.3,
      ),
      child: Text(
        textName,
        style: TextStyle(
            fontSize: SizeConfig.screenHeight! / 40.18,
            fontWeight: FontWeight.w500,
            color: Colors.black54),
      ),
    );
  }
}
