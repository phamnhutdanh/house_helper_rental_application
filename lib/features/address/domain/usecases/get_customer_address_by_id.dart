import 'package:house_helper_rental_application/core/common/entities/address.dart';
import 'package:house_helper_rental_application/core/error/failures.dart';
import 'package:house_helper_rental_application/core/usecase/usecase.dart';
import 'package:fpdart/fpdart.dart';
import 'package:house_helper_rental_application/features/address/domain/repository/address_repository.dart';

class GetCustomerAddressById
    implements UseCase<CustomerAddress, GetCustomerAddressByIdParams> {
  final AddressRepository addressRepository;
  GetCustomerAddressById(this.addressRepository);

  @override
  Future<Either<Failure, CustomerAddress>> call(
      GetCustomerAddressByIdParams params) async {
    return await addressRepository.getCustomerAddressById(
      id: params.id,
    );
  }
}

class GetCustomerAddressByIdParams {
  final String id;

  GetCustomerAddressByIdParams({
    required this.id,
  });
}
