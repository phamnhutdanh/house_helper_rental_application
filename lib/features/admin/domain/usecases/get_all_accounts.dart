import 'package:house_helper_rental_application/core/common/entities/account_info.dart';
import 'package:house_helper_rental_application/core/error/failures.dart';
import 'package:house_helper_rental_application/core/usecase/usecase.dart';
import 'package:fpdart/fpdart.dart';
import 'package:house_helper_rental_application/features/admin/domain/repository/account_repository.dart';

class GetAllAccounts implements UseCase<List<AccountInfo>, NoParams> {
  final AccountRepository accountRepository;
  GetAllAccounts(this.accountRepository);

  @override
  Future<Either<Failure, List<AccountInfo>>> call(NoParams params) async {
    return await accountRepository.getAllAccounts();
  }
}
