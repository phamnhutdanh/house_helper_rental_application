import 'package:house_helper_rental_application/core/common/entities/service.dart';
import 'package:house_helper_rental_application/core/error/failures.dart';
import 'package:house_helper_rental_application/core/usecase/usecase.dart';
import 'package:fpdart/fpdart.dart';
import 'package:house_helper_rental_application/features/services/domain/repository/service_repository.dart';

class GetServiceById implements UseCase<Service, GetServiceByIdParams> {
  final ServiceRepository serviceRepository;
  GetServiceById(this.serviceRepository);

  @override
  Future<Either<Failure, Service>> call(GetServiceByIdParams params) async {
    return await serviceRepository.getServiceById(id: params.id);
  }
}

class GetServiceByIdParams {
  final String id;

  GetServiceByIdParams({
    required this.id,
  });
}
