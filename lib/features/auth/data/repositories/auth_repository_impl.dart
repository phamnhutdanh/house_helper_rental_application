import 'dart:io';

import 'package:house_helper_rental_application/core/common/entities/account_info.dart';
import 'package:house_helper_rental_application/core/common/entities/notification.dart';
import 'package:house_helper_rental_application/core/constants/constants.dart';
import 'package:house_helper_rental_application/core/error/exceptions.dart';
import 'package:house_helper_rental_application/core/error/failures.dart';
import 'package:house_helper_rental_application/core/network/connection_checker.dart';
import 'package:house_helper_rental_application/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:house_helper_rental_application/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final ConnectionChecker connectionChecker;
  const AuthRepositoryImpl(
    this.remoteDataSource,
    this.connectionChecker,
  );

  @override
  Future<Either<Failure, AccountInfo>> currentAccountInfo() async {
    try {
      if (!await (connectionChecker.isConnected)) {
        return left(Failure(Constants.noConnectionErrorMessage));
      }
      final user = await remoteDataSource.getCurrentAccountInfoData();
      if (user == null) {
        return left(Failure('User not logged in!'));
      }

      return right(user);
    } on ServerExceptionError catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, AccountInfo>> loginWithEmailPassword({
    required String email,
    required String password,
  }) async {
    return _getAccountInfo(
      () async => await remoteDataSource.loginWithEmailPassword(
        email: email,
        password: password,
      ),
    );
  }

  @override
  Future<Either<Failure, AccountInfo>> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
    required bool isEmployee,
  }) async {
    return _getAccountInfo(
      () async => await remoteDataSource.signUpWithEmailPassword(
        isEmployee: isEmployee,
        name: name,
        email: email,
        password: password,
      ),
    );
  }

  Future<Either<Failure, AccountInfo>> _getAccountInfo(
    Future<AccountInfo> Function() fn,
  ) async {
    try {
      if (!await (connectionChecker.isConnected)) {
        return left(Failure(Constants.noConnectionErrorMessage));
      }
      final user = await fn();
      return right(user);
    } on ServerExceptionError catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      if (!await (connectionChecker.isConnected)) {
        return left(Failure(Constants.noConnectionErrorMessage));
      }
      return right(await remoteDataSource.signOut());
    } on ServerExceptionError catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, AccountInfo>> updateInfoCustomer({
    required File? image,
    required String name,
    required String phone,
    required String customerId,
  }) async {
    try {
      late AccountInfo accountInfo;
      if (image != null) {
        final imageUrl = await remoteDataSource.uploadImageCustomer(
          image: image,
        );
        accountInfo = await remoteDataSource.updateInfoCustomer(
            customerId: customerId,
            imageUri: imageUrl,
            name: name,
            phone: phone);
      } else {
        accountInfo = await remoteDataSource.updateInfoCustomer(
            customerId: customerId, imageUri: '', name: name, phone: phone);
      }

      return right(accountInfo);
    } on ServerExceptionError catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, NotificationAccount>> changeNotificationStatus(
      {required String id, required String status}) async {
    try {
      final data = await remoteDataSource.changeNotificationStatus(
        id: id,
        status: status,
      );
      return right(data);
    } on ServerExceptionError catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<NotificationAccount>>> getAllNotification(
      {required String accountId}) async {
    try {
      final data = await remoteDataSource.getAllNotification(
        accountId: accountId,
      );
      return right(data);
    } on ServerExceptionError catch (e) {
      return left(Failure(e.message));
    }
  }
}
