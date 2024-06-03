import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:house_helper_rental_application/core/common/entities/employee.dart';
import 'package:house_helper_rental_application/features/employees/presentation/widgets/employee_card.dart';

class TopEmployeesGrid extends StatelessWidget {
  final List<Employee> topEmployees;

  const TopEmployeesGrid({super.key, required this.topEmployees});

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
            child: GestureDetector(
              onTap: () {
                Beamer.of(context)
                    .beamToNamed('/booking_home/employee_details');
              },
              child: EmployeeCard(
                employee: topEmployees[index],
              ),
            ));
      },
    );
  }
}
