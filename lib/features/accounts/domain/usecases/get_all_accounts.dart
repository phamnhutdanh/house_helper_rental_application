import 'package:house_helper_rental_application/core/common/entities/account_info.dart';
import 'package:house_helper_rental_application/core/error/failures.dart';
import 'package:house_helper_rental_application/core/usecase/usecase.dart';
import 'package:fpdart/fpdart.dart';
import 'package:house_helper_rental_application/features/accounts/domain/repository/accounts_repository.dart';

class GetAllAccounts implements UseCase<List<AccountInfo>, NoParams> {
  final AccountsRepository accountRepository;
  GetAllAccounts(this.accountRepository);

  @override
  Future<Either<Failure, List<AccountInfo>>> call(NoParams params) async {
    return await accountRepository.getAllAccounts();
  }
}
