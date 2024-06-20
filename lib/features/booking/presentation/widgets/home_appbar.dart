import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  final String username;
  const HomeAppBar({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(width: 30),
        Text(
          "Welcome " + username,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(width: 30),
      ],
    );
  }
}
