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
            color: const Color(0xffF5F5F5),
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
                ],
              )
            ],
          ),
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.topRight,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              width: 60,
              height: 30,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: AppPalette.fourthColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  bottomLeft: Radius.circular(10),
                ),
              ),
              child: Expanded(
                child: Row(
                  children: [
                    Text(
                      "${employee.averageRating}",
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppPalette.whiteColor,
                      ),
                    ),
                    const Icon(
                      IconlyBold.star,
                      color: AppPalette.yellowStarColor,
                      size: 20,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
