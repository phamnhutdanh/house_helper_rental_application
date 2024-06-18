import 'package:flutter/material.dart';
import 'package:house_helper_rental_application/core/common/entities/employee.dart';
import 'package:house_helper_rental_application/features/employees/presentation/widgets/employee_card.dart';

class TopEmployeesGrid extends StatelessWidget {
  final List<Employee> topEmployees;
  final void Function(String) onTapItem;
  const TopEmployeesGrid({
    super.key,
    required this.topEmployees,
    required this.onTapItem,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: topEmployees.length,
      itemBuilder: (context, index) {
        return Container(
            margin: const EdgeInsets.all(8),
            child: GestureDetector(
              onTap: () {
                final String employeeId = topEmployees[index].id ?? '';
                onTapItem(employeeId);
              },
              child: EmployeeCard(
                employee: topEmployees[index],
              ),
            ));
      },
    );
  }
}
