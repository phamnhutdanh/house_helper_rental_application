import 'package:house_helper_rental_application/core/common/entities/employee.dart';
import 'package:house_helper_rental_application/core/error/failures.dart';
import 'package:house_helper_rental_application/core/usecase/usecase.dart';
import 'package:fpdart/fpdart.dart';
import 'package:house_helper_rental_application/features/employees/domain/repository/employee_repository.dart';

class RemoveFromFavorite
    implements UseCase<FavoriteEmployee, RemoveFromFavoriteParams> {
  final EmployeeRepository employeeRepository;
  RemoveFromFavorite(this.employeeRepository);

  @override
  Future<Either<Failure, FavoriteEmployee>> call(
      RemoveFromFavoriteParams params) async {
    return await employeeRepository.removeFromFavorite(
      employeeId: params.employeeId,
      customerId: params.customerId,
    );
  }
}

class RemoveFromFavoriteParams {
  final String employeeId;
  final String customerId;

  RemoveFromFavoriteParams({
    required this.employeeId,
    required this.customerId,
  });
}
