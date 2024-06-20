import 'package:house_helper_rental_application/core/common/entities/employee.dart';
import 'package:house_helper_rental_application/features/employees/data/models/employee_model.dart';

class FavoriteEmployeeModel extends FavoriteEmployee {
  FavoriteEmployeeModel({
    super.id,
    super.customerId,
    super.employeeId,
    super.employee,
  });

  factory FavoriteEmployeeModel.fromJson(Map<String, dynamic> map) {
    return FavoriteEmployeeModel(
      id: map['id'] as String?,
      customerId: map['customerId'] as String?,
      employeeId: map['employeeId'] as String?,
      employee: map['employee'] != null
          ? EmployeeModel.fromJson(map['employee'] ?? {})
          : null,
    );
  }
}
