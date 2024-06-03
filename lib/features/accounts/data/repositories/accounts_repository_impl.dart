import 'package:fpdart/fpdart.dart';
import 'package:house_helper_rental_application/core/common/entities/account_info.dart';
import 'package:house_helper_rental_application/core/error/exceptions.dart';
import 'package:house_helper_rental_application/core/error/failures.dart';
import 'package:house_helper_rental_application/features/accounts/data/datasources/accounts_remote_datasource.dart';
import 'package:house_helper_rental_application/features/accounts/domain/repository/accounts_repository.dart';

class AccountsRepositoryImpl implements AccountsRepository {
  final AccountsRemoteDataSource accountRemoteDataSource;

  AccountsRepositoryImpl(
    this.accountRemoteDataSource,
  );

  @override
  Future<Either<Failure, List<AccountInfo>>> getAllAccounts() async {
    try {
      final accounts = await accountRemoteDataSource.getAllAccounts();
      return right(accounts);
    } on ServerExceptionError catch (e) {
      return left(Failure(e.message));
    }
  }
}
