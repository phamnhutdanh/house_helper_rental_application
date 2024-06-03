import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:house_helper_rental_application/core/common/entities/employee.dart';
import 'package:house_helper_rental_application/core/theme/app_palette.dart';
import 'package:iconly/iconly.dart';

class EmployeeCard extends StatelessWidget {
  final Employee employee;

  const EmployeeCard({super.key, required this.employee});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xffF5F5F5),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              Image.network(
                employee.imageUri ?? '',
                width: 120,
                height: 120,
              ),
              Text(
                employee.name ?? '',
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    overflow: TextOverflow.ellipsis),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "${employee.description}",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        overflow: TextOverflow.ellipsis),
                  ),
                  // Row(
                  //   children: List.generate(
                  //     employee.colors.length,
                  //     (cindex) => Container(
                  //       height: 15,
                  //       width: 15,
                  //       margin: const EdgeInsets.only(right: 2),
                  //       decoration: BoxDecoration(
                  //         color: employee.colors[cindex],
                  //         shape: BoxShape.circle,
                  //       ),
                  //     ),
                  //   ),
                  // )
                ],
              )
            ],
          ),
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.topRight,
            child: Container(
              width: 30,
              height: 30,
              decoration: const BoxDecoration(
                color: AppPalette.fourthColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  bottomLeft: Radius.circular(10),
                ),
              ),
              child: const Icon(
                IconlyLight.heart,
                color: AppPalette.whiteColor,
                size: 20,
              ),
            ),
          ),
        ),
      ],
    );
  }
}