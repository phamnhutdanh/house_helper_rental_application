import 'package:house_helper_rental_application/core/common/entities/employee.dart';

class EmployeeModel extends Employee {
  EmployeeModel({
    super.id,
    super.name,
    super.phoneNumber,
    super.imageUri,
    super.description,
    super.age,
    super.workingHours,
    super.averageRating,
    super.accountInfoId,
  });

  factory EmployeeModel.fromJson(Map<String, dynamic> map) {
    return EmployeeModel(
      id: map['id'] as String?,
      name: map['name'] as String?,
      phoneNumber: map['phoneNumber'] as String?,
      imageUri: map['imageUri'] as String?,
      description: map['description'] as String?,
      age: map['age'] as int?,
      workingHours: map['workingHours'] as int?,
      averageRating: map['averageRating'].toDouble() as double?,
      accountInfoId: map['accountInfoId'] as String?,
    );
  }

  EmployeeModel copyWith({
    String? id,
    String? name,
    String? phoneNumber,
    String? imageUri,
    String? description,
    int? age,
    int? workingHours,
    double? averageRating,
    String? accountInfoId,
  }) {
    return EmployeeModel(
      id: id ?? this.id,
      name: name ?? this.name,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      imageUri: imageUri ?? this.imageUri,
      description: description ?? this.description,
      age: age ?? this.age,
      workingHours: workingHours ?? this.workingHours,
      averageRating: averageRating ?? this.averageRating,
      accountInfoId: accountInfoId ?? this.accountInfoId,
    );
  }
}
