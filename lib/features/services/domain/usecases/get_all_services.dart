import 'package:house_helper_rental_application/core/common/entities/service.dart';
import 'package:house_helper_rental_application/core/error/failures.dart';
import 'package:house_helper_rental_application/core/usecase/usecase.dart';
import 'package:fpdart/fpdart.dart';
import 'package:house_helper_rental_application/features/services/domain/repository/service_repository.dart';

class GetAllServices implements UseCase<List<Service>, NoParams> {
  final ServiceRepository serviceRepository;
  GetAllServices(this.serviceRepository);

  @override
  Future<Either<Failure, List<Service>>> call(NoParams params) async {
    return await serviceRepository.getAllServices();
  }
}
