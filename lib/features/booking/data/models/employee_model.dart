import 'package:house_helper_rental_application/core/common/entities/employee.dart';

class EmployeeModel extends Employee {
  EmployeeModel({
    required super.id,
    required super.name,
    required super.phoneNumber,
    required super.imageUri,
    required super.description,
    required super.age,
    required super.workingHours,
    required super.accountInfoId,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'phoneNumber': phoneNumber,
      'imageUri': imageUri,
      'description': description,
      'age': age,
      'workingHours': workingHours,
      'accountInfoId': accountInfoId,
    };
  }

  factory EmployeeModel.fromJson(Map<String, dynamic> map) {
    return EmployeeModel(
      id: map['id'] as String,
      name: map['name'] as String,
      phoneNumber: map['phoneNumber'] as String,
      imageUri: map['imageUri'] as String,
      description: map['description'] as String,
      age: map['age'] as int,
      workingHours: map['workingHours'] as int,
      accountInfoId: map['accountInfoId'] as String,
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
      accountInfoId: id ?? this.accountInfoId,
    );
  }
}
