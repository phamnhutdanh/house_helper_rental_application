import 'package:fpdart/fpdart.dart';
import 'package:house_helper_rental_application/core/common/entities/employee.dart';
import 'package:house_helper_rental_application/core/error/exceptions.dart';
import 'package:house_helper_rental_application/core/error/failures.dart';
import 'package:house_helper_rental_application/features/employees/data/datasources/employee_remote_data_source.dart';
import 'package:house_helper_rental_application/features/employees/domain/repository/employee_repository.dart';

class EmployeeRepositoryImpl implements EmployeeRepository {
  final EmployeesRemoteDataSource employeesRemoteDataSource;

  EmployeeRepositoryImpl(
    this.employeesRemoteDataSource,
  );

  @override
  Future<Either<Failure, List<Employee>>> getTopEmployees() async {
    try {
      final employees = await employeesRemoteDataSource.getTopEmployees();
      return right(employees);
    } on ServerExceptionError catch (e) {
      return left(Failure(e.message));
    }
  }
}
