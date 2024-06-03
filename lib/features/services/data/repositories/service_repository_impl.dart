import 'package:fpdart/fpdart.dart';
import 'package:house_helper_rental_application/core/common/entities/service.dart';
import 'package:house_helper_rental_application/core/error/exceptions.dart';
import 'package:house_helper_rental_application/core/error/failures.dart';
import 'package:house_helper_rental_application/features/services/data/datasources/service_remote_data_source.dart';
import 'package:house_helper_rental_application/features/services/domain/repository/service_repository.dart';

class ServiceRepositoryImpl implements ServiceRepository {
  final ServicesRemoteDataSource servicesRemoteDataSource;

  ServiceRepositoryImpl(
    this.servicesRemoteDataSource,
  );

  @override
  Future<Either<Failure, List<Service>>> getAllServices() async {
    try {
      final services = await servicesRemoteDataSource.getAllServices();
      return right(services);
    } on ServerExceptionError catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, Service>> getServiceById({
    required String id,
  }) async {
    try {
      final service = await servicesRemoteDataSource.getServiceById(id: id);
      return right(service);
    } on ServerExceptionError catch (e) {
      return left(Failure(e.message));
    }
  }
}
