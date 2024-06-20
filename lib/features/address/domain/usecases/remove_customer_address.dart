import 'package:house_helper_rental_application/core/common/entities/address.dart';
import 'package:house_helper_rental_application/core/error/failures.dart';
import 'package:house_helper_rental_application/core/usecase/usecase.dart';
import 'package:fpdart/fpdart.dart';
import 'package:house_helper_rental_application/features/address/domain/repository/address_repository.dart';

class RemoveCustomerAddress
    implements UseCase<CustomerAddress, RemoveCustomerAddressParams> {
  final AddressRepository addressRepository;
  RemoveCustomerAddress(this.addressRepository);

  @override
  Future<Either<Failure, CustomerAddress>> call(
      RemoveCustomerAddressParams params) async {
    return await addressRepository.removeCustomerAddress(id: params.id);
  }
}

class RemoveCustomerAddressParams {
  final String id;

  RemoveCustomerAddressParams({
    required this.id,
  });
}
