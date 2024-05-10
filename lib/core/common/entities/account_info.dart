import 'package:house_helper_rental_application/core/common/entities/enum_type.dart';

class AccountInfo {
  final String id;
  final String email;
  final AccountInfoRole accountRole;
  final DateTime createdAt;
  final DateTime updatedAt;
  final AccountStatus status;

  AccountInfo({
    required this.id,
    required this.email,
    required this.accountRole,
    required this.createdAt,
    required this.updatedAt,
    required this.status,
  });
}
