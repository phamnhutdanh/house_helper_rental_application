import 'package:house_helper_rental_application/core/common/entities/account_info.dart';
import 'package:house_helper_rental_application/core/common/entities/address.dart';
import 'package:house_helper_rental_application/core/common/entities/rating.dart';

class Employee {
  final String? id;
  final String? name;
  final String? phoneNumber;
  final String? imageUri;
  final String? description;
  final int? age;
  final int? workingHours;
  final double? averageRating;
  final String? accountInfoId;
  final AccountInfo? accountInfo;
  final List<EmployeeAddress>? employeeAddresses;
  final List<RatingEmployee>? ratings;

  Employee({
    this.id,
    this.name,
    this.phoneNumber,
    this.imageUri,
    this.description,
    this.age,
    this.workingHours,
    this.averageRating,
    this.accountInfoId,
    this.accountInfo,
    this.employeeAddresses,
    this.ratings,
  });
}

class FavoriteEmployee {
  final String? id;
  final String? customerId;
  final String? employeeId;
  final Employee? employee;

  FavoriteEmployee({
    this.id,
    this.customerId,
    this.employeeId,
    this.employee,
  });
}
