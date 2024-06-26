import 'package:house_helper_rental_application/core/common/entities/account_info.dart';
import 'package:house_helper_rental_application/core/error/failures.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class AccountsRepository {
  Future<Either<Failure, List<AccountInfo>>> getAllAccounts();
  Future<Either<Failure, AccountInfo>> getAccountById({required String id});
}
