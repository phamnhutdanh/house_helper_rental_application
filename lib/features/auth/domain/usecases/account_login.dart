import 'package:house_helper_rental_application/core/common/entities/account_info.dart';
import 'package:house_helper_rental_application/core/error/failures.dart';
import 'package:house_helper_rental_application/core/usecase/usecase.dart';

import 'package:house_helper_rental_application/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class AccountLogin implements UseCase<AccountInfo, AccountLoginParams> {
  final AuthRepository authRepository;
  const AccountLogin(this.authRepository);

  @override
  Future<Either<Failure, AccountInfo>> call(AccountLoginParams params) async {
    return await authRepository.loginWithEmailPassword(
      email: params.email,
      password: params.password,
    );
  }
}

class AccountLoginParams {
  final String email;
  final String password;

  AccountLoginParams({
    required this.email,
    required this.password,
  });
}
