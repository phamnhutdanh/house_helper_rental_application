import 'package:fpdart/fpdart.dart';
import 'package:house_helper_rental_application/core/common/entities/address.dart';
import 'package:house_helper_rental_application/core/error/exceptions.dart';
import 'package:house_helper_rental_application/core/error/failures.dart';
import 'package:house_helper_rental_application/features/address/data/datasources/address_remote_data_source.dart';
import 'package:house_helper_rental_application/features/address/domain/repository/address_repository.dart';

class AddressRepositoryImpl implements AddressRepository {
  final AddressRemoteDataSource addressRemoteDataSource;

  AddressRepositoryImpl(
    this.addressRemoteDataSource,
  );

  @override
  Future<Either<Failure, CustomerAddress>> createCustomerAddress({
    required String address,
    required String fullName,
    required String phone,
    required String customerId,
    required bool isDefault,
  }) async {
    try {
      final customerAddress =
          await addressRemoteDataSource.createCustomerAddress(
        address: address,
        customerId: customerId,
        fullName: fullName,
        isDefault: isDefault,
        phone: phone,
      );
      return right(customerAddress);
    } on ServerExceptionError catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<CustomerAddress>>> getAllAddressOfCustomer(
      {required String customerId}) async {
    try {
      final customerAddresses =
          await addressRemoteDataSource.getAllAddressOfCustomer(
        customerId: customerId,
      );
      return right(customerAddresses);
    } on ServerExceptionError catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, CustomerAddress>> getCustomerAddressById(
      {required String id}) async {
    try {
      final customerAddress =
          await addressRemoteDataSource.getCustomerAddressById(
        id: id,
      );
      return right(customerAddress);
    } on ServerExceptionError catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, CustomerAddress>> removeCustomerAddress(
      {required String id}) async {
    try {
      final customerAddress =
          await addressRemoteDataSource.removeCustomerAddress(
        id: id,
      );
      return right(customerAddress);
    } on ServerExceptionError catch (e) {
      return left(Failure(e.message));
    }
  }
}
