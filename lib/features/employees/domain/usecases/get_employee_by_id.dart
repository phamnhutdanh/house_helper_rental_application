import 'package:house_helper_rental_application/core/common/entities/employee.dart';
import 'package:house_helper_rental_application/core/error/failures.dart';
import 'package:house_helper_rental_application/core/usecase/usecase.dart';
import 'package:fpdart/fpdart.dart';
import 'package:house_helper_rental_application/features/employees/domain/repository/employee_repository.dart';

class GetEmployeeById implements UseCase<Employee, GetEmployeeByIdParams> {
  final EmployeeRepository employeeRepository;
  GetEmployeeById(this.employeeRepository);

  @override
  Future<Either<Failure, Employee>> call(GetEmployeeByIdParams params) async {
    return await employeeRepository.getEmployeeById(id: params.id);
  }
}

class GetEmployeeByIdParams {
  final String id;

  GetEmployeeByIdParams({
    required this.id,
  });
}
