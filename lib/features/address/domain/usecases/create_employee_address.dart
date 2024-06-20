import 'package:house_helper_rental_application/core/common/entities/address.dart';
import 'package:house_helper_rental_application/core/error/failures.dart';
import 'package:house_helper_rental_application/core/usecase/usecase.dart';
import 'package:fpdart/fpdart.dart';
import 'package:house_helper_rental_application/features/address/domain/repository/address_repository.dart';

class CreateEmployeeAddress
    implements UseCase<EmployeeAddress, CreateEmployeeAddressParams> {
  final AddressRepository addressRepository;
  CreateEmployeeAddress(this.addressRepository);

  @override
  Future<Either<Failure, EmployeeAddress>> call(
      CreateEmployeeAddressParams params) async {
    return await addressRepository.createEmployeeAddress(
      address: params.address,
      fullName: params.fullName,
      phone: params.phone,
      employeeId: params.employeeId,
      isDefault: params.isDefault,
    );
  }
}

class CreateEmployeeAddressParams {
  final String address;
  final String fullName;
  final String phone;
  final String employeeId;
  final bool isDefault;

  CreateEmployeeAddressParams({
    required this.address,
    required this.fullName,
    required this.phone,
    required this.employeeId,
    required this.isDefault,
  });
}
