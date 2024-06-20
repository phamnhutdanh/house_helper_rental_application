import 'package:house_helper_rental_application/core/common/entities/address.dart';
import 'package:house_helper_rental_application/core/error/failures.dart';
import 'package:house_helper_rental_application/core/usecase/usecase.dart';
import 'package:fpdart/fpdart.dart';
import 'package:house_helper_rental_application/features/address/domain/repository/address_repository.dart';

class RemoveEmployeeAddress
    implements UseCase<EmployeeAddress, RemoveEmployeeAddressParams> {
  final AddressRepository addressRepository;
  RemoveEmployeeAddress(this.addressRepository);

  @override
  Future<Either<Failure, EmployeeAddress>> call(
      RemoveEmployeeAddressParams params) async {
    return await addressRepository.removeEmployeeAddress(id: params.id);
  }
}

class RemoveEmployeeAddressParams {
  final String id;

  RemoveEmployeeAddressParams({
    required this.id,
  });
}
