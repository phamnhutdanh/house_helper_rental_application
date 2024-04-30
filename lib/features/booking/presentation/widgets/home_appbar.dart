import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class HomeAppBar extends StatelessWidget {
  final String username;
  const HomeAppBar({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {},
          style: IconButton.styleFrom(
            backgroundColor: Color(0xffF5F5F5),
            padding: const EdgeInsets.all(15),
          ),
          iconSize: 30,
          icon: const Icon(IconlyLight.user),
        ),
        Text(
          "Welcome " + username,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        IconButton(
          onPressed: () {},
          style: IconButton.styleFrom(
            backgroundColor: Color(0xffF5F5F5),
            padding: const EdgeInsets.all(15),
          ),
          iconSize: 30,
          icon: const Icon(IconlyLight.chat),
        ),
      ],
    );
  }
}
