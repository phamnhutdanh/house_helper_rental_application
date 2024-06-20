import 'package:house_helper_rental_application/core/common/entities/employee.dart';
import 'package:house_helper_rental_application/core/error/failures.dart';
import 'package:house_helper_rental_application/core/usecase/usecase.dart';
import 'package:fpdart/fpdart.dart';
import 'package:house_helper_rental_application/features/employees/domain/repository/employee_repository.dart';

class AddToFavorite implements UseCase<FavoriteEmployee, AddToFavoriteParams> {
  final EmployeeRepository employeeRepository;
  AddToFavorite(this.employeeRepository);

  @override
  Future<Either<Failure, FavoriteEmployee>> call(
      AddToFavoriteParams params) async {
    return await employeeRepository.addToFavorite(
      employeeId: params.employeeId,
      customerId: params.customerId,
    );
  }
}

class AddToFavoriteParams {
  final String employeeId;
  final String customerId;

  AddToFavoriteParams({
    required this.employeeId,
    required this.customerId,
  });
}
