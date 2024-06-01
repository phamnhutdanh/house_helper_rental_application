import 'package:fpdart/fpdart.dart';
import 'package:house_helper_rental_application/core/common/entities/account_info.dart';
import 'package:house_helper_rental_application/core/error/exceptions.dart';
import 'package:house_helper_rental_application/core/error/failures.dart';
import 'package:house_helper_rental_application/features/admin/data/datasources/account_remote_datasource.dart';
import 'package:house_helper_rental_application/features/admin/domain/repository/account_repository.dart';

class AccountRepositoryImpl implements AccountRepository {
  final AccountRemoteDataSource accountRemoteDataSource;

  AccountRepositoryImpl(
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
