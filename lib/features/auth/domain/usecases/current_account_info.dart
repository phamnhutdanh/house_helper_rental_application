import 'package:house_helper_rental_application/core/common/entities/account_info.dart';
import 'package:house_helper_rental_application/core/error/failures.dart';
import 'package:house_helper_rental_application/core/usecase/usecase.dart';
import 'package:house_helper_rental_application/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class CurrentAccountInfo implements UseCase<AccountInfo, NoParams> {
  final AuthRepository authRepository;
  CurrentAccountInfo(this.authRepository);

  @override
  Future<Either<Failure, AccountInfo>> call(NoParams params) async {
    return await authRepository.currentAccountInfo();
  }
}
