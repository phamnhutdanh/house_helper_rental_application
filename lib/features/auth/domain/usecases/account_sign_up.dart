import 'package:house_helper_rental_application/core/common/entities/account_info.dart';
import 'package:house_helper_rental_application/core/error/failures.dart';
import 'package:house_helper_rental_application/core/usecase/usecase.dart';
import 'package:house_helper_rental_application/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class AccountSignUp implements UseCase<AccountInfo, AccountSignUpParams> {
  final AuthRepository authRepository;
  const AccountSignUp(this.authRepository);

  @override
  Future<Either<Failure, AccountInfo>> call(AccountSignUpParams params) async {
    return await authRepository.signUpWithEmailPassword(
      isEmployee: params.isEmployee,
      name: params.name,
      email: params.email,
      password: params.password,
    );
  }
}

class AccountSignUpParams {
  final String email;
  final String password;
  final String name;
  final bool isEmployee;
  AccountSignUpParams({
    required this.email,
    required this.password,
    required this.name,
    required this.isEmployee,

  });
}
