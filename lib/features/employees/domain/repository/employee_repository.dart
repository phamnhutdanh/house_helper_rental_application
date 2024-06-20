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

  Future<Either<Failure, Employee>> getEmployeeById({
    required String id,
  });

  Future<Either<Failure, List<FavoriteEmployee>>>
      getFavoriteEmployeesOfCustomer({
    required String customerId,
  });

  Future<Either<Failure, FavoriteEmployee>> addToFavorite({
    required String employeeId,
    required String customerId,
  });

  Future<Either<Failure, FavoriteEmployee>> removeFromFavorite({
    required String employeeId,
    required String customerId,
  });

  Future<Either<Failure, bool>> checkFavoriteInput({
    required String employeeId,
    required String customerId,
  });
}
