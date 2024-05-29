import 'package:house_helper_rental_application/core/common/entities/employee.dart';
import 'package:house_helper_rental_application/core/common/entities/service.dart';
import 'package:house_helper_rental_application/core/error/failures.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class BookingRepository {
  Future<Either<Failure, List<Service>>> getAllServices();
  Future<Either<Failure, List<Employee>>> getAllEmployees();
  Future<Either<Failure, List<Employee>>> getTopEmployees();
  Future<Either<Failure, Service>> getServiceById({required String id});
}
