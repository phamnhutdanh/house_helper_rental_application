import 'package:house_helper_rental_application/core/error/failures.dart';
import 'package:house_helper_rental_application/core/usecase/usecase.dart';
import 'package:fpdart/fpdart.dart';
import 'package:house_helper_rental_application/features/employees/domain/repository/employee_repository.dart';

class CheckFavorite implements UseCase<bool, CheckFavoriteParams> {
  final EmployeeRepository employeeRepository;
  CheckFavorite(this.employeeRepository);

  @override
  Future<Either<Failure, bool>> call(CheckFavoriteParams params) async {
    return await employeeRepository.checkFavoriteInput(
      employeeId: params.employeeId,
      customerId: params.customerId,
    );
  }
}

class CheckFavoriteParams {
  final String employeeId;
  final String customerId;

  CheckFavoriteParams({
    required this.employeeId,
    required this.customerId,
  });
}
