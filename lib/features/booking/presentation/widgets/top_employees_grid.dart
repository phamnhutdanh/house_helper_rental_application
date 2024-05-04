import 'package:flutter/material.dart';
import 'package:house_helper_rental_application/core/common/entities/employee.dart';
import 'package:house_helper_rental_application/features/booking/presentation/widgets/employee_card.dart';

class TopEmployeesGrid extends StatelessWidget {
  final List<Employee> topEmployees;
  final String detailsPath;

  const TopEmployeesGrid(
      {super.key, required this.topEmployees, required this.detailsPath});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        // crossAxisSpacing: 8,
        // mainAxisSpacing: 8,
      ),
      itemCount: topEmployees.length,
      itemBuilder: (context, index) {
        return Container(
            margin: const EdgeInsets.all(8),
            child: EmployeeCard(
              employee: topEmployees[index],
              detailsPath: detailsPath,
            ));
      },
    );
  }
}
