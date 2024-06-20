import 'package:flutter/material.dart';

class EmptyWidget extends StatelessWidget {
  final String title;
  const EmptyWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32.0),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.black54,
                fontSize: 24.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
