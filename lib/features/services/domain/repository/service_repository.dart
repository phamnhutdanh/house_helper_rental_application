import 'package:house_helper_rental_application/core/common/entities/service.dart';
import 'package:house_helper_rental_application/core/error/failures.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class ServiceRepository {
  Future<Either<Failure, List<Service>>> getAllServices();
  Future<Either<Failure, Service>> getServiceById({required String id});
}
