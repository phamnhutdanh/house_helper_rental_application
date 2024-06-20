import 'dart:io';

import 'package:house_helper_rental_application/core/common/entities/account_info.dart';
import 'package:house_helper_rental_application/core/common/entities/enum_type.dart';
import 'package:house_helper_rental_application/core/common/entities/notification.dart';
import 'package:house_helper_rental_application/core/error/failures.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, AccountInfo>> signUpWithEmailPassword({
    required bool isEmployee,
    required String name,
    required String email,
    required String password,
  });
  Future<Either<Failure, AccountInfo>> loginWithEmailPassword({
    required String email,
    required String password,
  });
  Future<Either<Failure, AccountInfo>> currentAccountInfo();

  Future<Either<Failure, void>> signOut();

  Future<Either<Failure, AccountInfo>> updateInfoCustomer({
    required File? image,
    required String name,
    required String phone,
    required String customerId,
  });

  Future<Either<Failure, List<NotificationAccount>>> getAllNotification({
    required String accountId,
  });

  Future<Either<Failure, NotificationAccount>> changeNotificationStatus({
    required String id,
    required String status,
  });

  Future<Either<Failure, AccountInfo>> updateAccountStatus({
    required String accountId,
    required AccountStatus status,
  });

  Future<Either<Failure, AccountInfo>> updateInfoEmployee({
    required File? image,
    required String name,
    required String phone,
    required String employeeId,
    required String description,
  });
}
