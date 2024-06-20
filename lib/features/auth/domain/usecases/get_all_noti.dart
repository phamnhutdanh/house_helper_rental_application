import 'package:house_helper_rental_application/core/common/entities/notification.dart';
import 'package:house_helper_rental_application/core/error/failures.dart';
import 'package:house_helper_rental_application/core/usecase/usecase.dart';
import 'package:house_helper_rental_application/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetAllNoti
    implements UseCase<List<NotificationAccount>, GetAllNotiParams> {
  final AuthRepository authRepository;
  const GetAllNoti(this.authRepository);

  @override
  Future<Either<Failure, List<NotificationAccount>>> call(
      GetAllNotiParams params) async {
    return await authRepository.getAllNotification(
      accountId: params.accountId,
    );
  }
}

class GetAllNotiParams {
  final String accountId;

  GetAllNotiParams({
    required this.accountId,
  });
}
