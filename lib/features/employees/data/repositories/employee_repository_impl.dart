import 'package:fpdart/fpdart.dart';
import 'package:house_helper_rental_application/core/common/entities/employee.dart';
import 'package:house_helper_rental_application/core/common/entities/rating.dart';
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

  @override
  Future<Either<Failure, RatingEmployee>> createRatingEmployee(
      {required double score,
      required String comment,
      required String employeeId,
      required String bookingId,
      required String customerId}) async {
    try {
      final ratingEmployee =
          await employeesRemoteDataSource.createRatingEmployee(
        score: score,
        comment: comment,
        bookingId: bookingId,
        employeeId: employeeId,
        customerId: customerId,
      );
      return right(ratingEmployee);
    } on ServerExceptionError catch (e) {
      return left(Failure(e.message));
    }
  }
}
