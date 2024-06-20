import 'package:house_helper_rental_application/core/common/entities/notification.dart';
import 'package:house_helper_rental_application/core/error/failures.dart';
import 'package:house_helper_rental_application/core/usecase/usecase.dart';
import 'package:house_helper_rental_application/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class ChangeNotiStatus
    implements UseCase<NotificationAccount, ChangeNotiParams> {
  final AuthRepository authRepository;
  const ChangeNotiStatus(this.authRepository);

  @override
  Future<Either<Failure, NotificationAccount>> call(
      ChangeNotiParams params) async {
    return await authRepository.changeNotificationStatus(
      id: params.id,
      status: params.status,
    );
  }
}

class ChangeNotiParams {
  final String id;
  final String status;

  ChangeNotiParams({
    required this.id,
    required this.status,
  });
}
