import 'dart:io';

import 'package:house_helper_rental_application/core/common/entities/account_info.dart';
import 'package:house_helper_rental_application/core/error/failures.dart';
import 'package:house_helper_rental_application/core/usecase/usecase.dart';
import 'package:fpdart/fpdart.dart';
import 'package:house_helper_rental_application/features/auth/domain/repository/auth_repository.dart';

class UpdateInfoEmployee
    implements UseCase<AccountInfo, UpdateInfoEmployeeParams> {
  final AuthRepository authRepository;
  UpdateInfoEmployee(this.authRepository);

  @override
  Future<Either<Failure, AccountInfo>> call(
      UpdateInfoEmployeeParams params) async {
    return await authRepository.updateInfoEmployee(
      employeeId: params.employeeId,
      image: params.image,
      name: params.name,
      phone: params.phone,
      description: params.description,
    );
  }
}

class UpdateInfoEmployeeParams {
  final String employeeId;
  final File? image;
  final String name;
  final String phone;
  final String description;

  UpdateInfoEmployeeParams({
    required this.employeeId,
    required this.image,
    required this.name,
    required this.phone,
    required this.description,
  });
}
