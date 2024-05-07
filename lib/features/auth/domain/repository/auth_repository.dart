import 'package:house_helper_rental_application/core/common/entities/account_info.dart';
import 'package:house_helper_rental_application/core/error/failures.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, AccountInfo>> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  });
  Future<Either<Failure, AccountInfo>> loginWithEmailPassword({
    required String email,
    required String password,
  });
  Future<Either<Failure, AccountInfo>> currentAccountInfo();
}
