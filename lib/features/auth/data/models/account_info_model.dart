import 'package:house_helper_rental_application/core/common/entities/account_info.dart';
import 'package:house_helper_rental_application/core/common/entities/enum_type.dart';

class AccountInfoModel extends AccountInfo {
  AccountInfoModel({
    required super.id,
    required super.email,
    super.role,
    super.createdAt,
    super.updatedAt,
    super.status,
  });

  factory AccountInfoModel.fromJson(Map<String, dynamic> map) {
    return AccountInfoModel(
      id: map['id'] ?? '',
      email: map['email'] ?? '',
      role: map['role'] ?? '',
      createdAt: map['createdAt'] ?? '',
      updatedAt: map['updatedAt'] ?? '',
      status: map['status'] ?? '',
    );
  }

  AccountInfoModel copyWith({
    String? id,
    String? email,
    AccountInfoRole? role,
    DateTime? createdAt,
    DateTime? updatedAt,
    AccountStatus? status,
  }) {
    return AccountInfoModel(
      id: id ?? this.id,
      email: email ?? this.email,
      role: role ?? this.role,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      status: status ?? this.status,
    );
  }
}
