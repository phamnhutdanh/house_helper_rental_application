import 'dart:io';

import 'package:house_helper_rental_application/core/common/entities/account_info.dart';
import 'package:house_helper_rental_application/core/error/failures.dart';
import 'package:house_helper_rental_application/core/usecase/usecase.dart';
import 'package:fpdart/fpdart.dart';
import 'package:house_helper_rental_application/features/auth/domain/repository/auth_repository.dart';

class UpdateInfoCustomer
    implements UseCase<AccountInfo, UpdateInfoCustomerParams> {
  final AuthRepository authRepository;
  UpdateInfoCustomer(this.authRepository);

  @override
  Future<Either<Failure, AccountInfo>> call(
      UpdateInfoCustomerParams params) async {
    return await authRepository.updateInfoCustomer(
      customerId: params.customerId,
      image: params.image,
      name: params.name,
      phone: params.phone,
    );
  }
}

class UpdateInfoCustomerParams {
  final String customerId;
  final File? image;
  final String name;
  final String phone;

  UpdateInfoCustomerParams({
    required this.customerId,
    required this.image,
    required this.name,
    required this.phone,
  });
}
