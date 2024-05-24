import 'package:flutter/material.dart';

class CheckboxSave extends StatefulWidget {
  final String saveText;
  const CheckboxSave({super.key, required this.saveText});

  @override
  State<CheckboxSave> createState() => _CheckboxSaveState();
}

class _CheckboxSaveState extends State<CheckboxSave> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Color(0xFF025939);
      }
      return Color(0xFFFF9505);
    }

    return Row(
      children: [
        Checkbox(
          checkColor: Colors.white,
          fillColor: MaterialStateProperty.resolveWith(getColor),
          value: isChecked,
          onChanged: (bool? value) {
            setState(() {
              isChecked = value!;
            });
          },
        ),
        Text(
          widget.saveText,
          style: TextStyle(color: Colors.black54, fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}
