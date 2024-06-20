import 'package:house_helper_rental_application/core/common/entities/account_info.dart';
import 'package:house_helper_rental_application/core/common/entities/enum_type.dart';
import 'package:house_helper_rental_application/core/error/failures.dart';
import 'package:house_helper_rental_application/core/usecase/usecase.dart';
import 'package:house_helper_rental_application/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class ChangeAccountStatus
    implements UseCase<AccountInfo, ChangeAccountStatusParams> {
  final AuthRepository authRepository;
  const ChangeAccountStatus(this.authRepository);

  @override
  Future<Either<Failure, AccountInfo>> call(
      ChangeAccountStatusParams params) async {
    return await authRepository.updateAccountStatus(
      accountId: params.accountId,
      status: params.status,
    );
  }
}

class ChangeAccountStatusParams {
  final String accountId;
  final AccountStatus status;

  ChangeAccountStatusParams({
    required this.accountId,
    required this.status,
  });
}
