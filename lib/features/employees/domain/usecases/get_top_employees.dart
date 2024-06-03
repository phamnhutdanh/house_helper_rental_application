import 'package:house_helper_rental_application/core/common/entities/employee.dart';
import 'package:house_helper_rental_application/core/error/failures.dart';
import 'package:house_helper_rental_application/core/usecase/usecase.dart';
import 'package:fpdart/fpdart.dart';
import 'package:house_helper_rental_application/features/employees/domain/repository/employee_repository.dart';

class GetTopEmployees implements UseCase<List<Employee>, NoParams> {
  final EmployeeRepository employeeRepository;
  GetTopEmployees(this.employeeRepository);

  @override
  Future<Either<Failure, List<Employee>>> call(NoParams params) async {
    return await employeeRepository.getTopEmployees();
  }
}
