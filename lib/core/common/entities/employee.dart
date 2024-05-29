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
  });
}

class FavoriteEmployee {
  final String? id;
  final String? customerId;
  final String? employeeId;

  FavoriteEmployee({
     this.id,
     this.customerId,
     this.employeeId,
  });
}
