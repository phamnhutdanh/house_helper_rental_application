import 'package:flutter/material.dart';
import 'package:house_helper_rental_application/core/constants/constants.dart';

class CheckoutTextField extends StatefulWidget {
  final String enterText;
  final double sizeWidth;
  const CheckoutTextField({
    super.key,
    required this.enterText,
    required this.sizeWidth,
  });

  @override
  State<CheckoutTextField> createState() => _CheckoutTextFieldState();
}

class _CheckoutTextFieldState extends State<CheckoutTextField> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding: EdgeInsets.fromLTRB(SizeConfig.screenWidth! / 41.1, 0,
          SizeConfig.screenWidth! / 82.2, SizeConfig.screenHeight! / 85.37),
      child: Container(
        width: SizeConfig.screenWidth! / widget.sizeWidth,
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: const BorderRadius.all(Radius.circular(20.0)),
        ),
        child: TextField(
          style: const TextStyle(color: Color(0xFFf2ac29)),
          cursorColor: const Color(0xFFf2ac29),
          decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              borderSide: BorderSide(width: 1, color: Colors.transparent),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            hintText: widget.enterText,
            hintStyle: const TextStyle(color: Colors.black26),
          ),
        ),
      ),
    );
  }
}
