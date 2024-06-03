import 'package:house_helper_rental_application/core/common/entities/employee.dart';
import 'package:house_helper_rental_application/core/error/failures.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class EmployeeRepository {
  Future<Either<Failure, List<Employee>>> getTopEmployees();
}
