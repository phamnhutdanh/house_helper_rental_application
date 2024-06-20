import 'package:house_helper_rental_application/core/common/entities/employee.dart';
import 'package:house_helper_rental_application/core/error/failures.dart';
import 'package:house_helper_rental_application/core/usecase/usecase.dart';
import 'package:fpdart/fpdart.dart';
import 'package:house_helper_rental_application/features/employees/domain/repository/employee_repository.dart';

class GetFavoriteEmployeesOfCustomer
    implements
        UseCase<List<FavoriteEmployee>, GetFavoriteEmployeesOfCustomerParams> {
  final EmployeeRepository employeeRepository;
  GetFavoriteEmployeesOfCustomer(this.employeeRepository);

  @override
  Future<Either<Failure, List<FavoriteEmployee>>> call(
      GetFavoriteEmployeesOfCustomerParams params) async {
    return await employeeRepository.getFavoriteEmployeesOfCustomer(
        customerId: params.customerId);
  }
}

class GetFavoriteEmployeesOfCustomerParams {
  final String customerId;

  GetFavoriteEmployeesOfCustomerParams({
    required this.customerId,
  });
}
