import 'package:house_helper_rental_application/core/common/entities/address.dart';
import 'package:house_helper_rental_application/core/error/failures.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class AddressRepository {
  Future<Either<Failure, CustomerAddress>> createCustomerAddress({
    required String address,
    required String fullName,
    required String phone,
    required String customerId,
    required bool isDefault,
  });

  Future<Either<Failure, List<CustomerAddress>>> getAllAddressOfCustomer({
    required String customerId,
  });

  Future<Either<Failure, CustomerAddress>> getCustomerAddressById({
    required String id,
  });

  Future<Either<Failure, CustomerAddress>> removeCustomerAddress({
    required String id,
  });
}
