import 'package:house_helper_rental_application/core/common/entities/address.dart';
import 'package:house_helper_rental_application/core/error/failures.dart';
import 'package:house_helper_rental_application/core/usecase/usecase.dart';
import 'package:fpdart/fpdart.dart';
import 'package:house_helper_rental_application/features/address/domain/repository/address_repository.dart';

class GetAllAddressOfCustomer
    implements UseCase<List<CustomerAddress>, GetAllAddressOfCustomerParams> {
  final AddressRepository addressRepository;
  GetAllAddressOfCustomer(this.addressRepository);

  @override
  Future<Either<Failure, List<CustomerAddress>>> call(
      GetAllAddressOfCustomerParams params) async {
    return await addressRepository.getAllAddressOfCustomer(
      customerId: params.customerId,
    );
  }
}

class GetAllAddressOfCustomerParams {
  final String customerId;

  GetAllAddressOfCustomerParams({
    required this.customerId,
  });
}
