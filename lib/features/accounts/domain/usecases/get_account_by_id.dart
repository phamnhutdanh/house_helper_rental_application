import 'package:house_helper_rental_application/core/common/entities/account_info.dart';
import 'package:house_helper_rental_application/core/error/failures.dart';
import 'package:house_helper_rental_application/core/usecase/usecase.dart';
import 'package:fpdart/fpdart.dart';
import 'package:house_helper_rental_application/features/accounts/domain/repository/accounts_repository.dart';

class GetAccountById implements UseCase<AccountInfo, GetAccountByIdParams> {
  final AccountsRepository accountsRepository;
  GetAccountById(this.accountsRepository);

  @override
  Future<Either<Failure, AccountInfo>> call(GetAccountByIdParams params) async {
    return await accountsRepository.getAccountById(id: params.id);
  }
}

class GetAccountByIdParams {
  final String id;

  GetAccountByIdParams({
    required this.id,
  });
}
