import 'package:house_helper_rental_application/core/common/entities/employee.dart';
import 'package:house_helper_rental_application/core/common/entities/rating.dart';
import 'package:house_helper_rental_application/core/error/failures.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class EmployeeRepository {
  Future<Either<Failure, List<Employee>>> getTopEmployees();
  Future<Either<Failure, RatingEmployee>> createRatingEmployee({
    required double score,
    required String comment,
    required String employeeId,
    required String bookingId,
    required String customerId,
  });
}
