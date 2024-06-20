import 'package:house_helper_rental_application/core/common/entities/address.dart';
import 'package:house_helper_rental_application/core/error/failures.dart';
import 'package:house_helper_rental_application/core/usecase/usecase.dart';
import 'package:fpdart/fpdart.dart';
import 'package:house_helper_rental_application/features/address/domain/repository/address_repository.dart';

class GetAllAddressOfEmployee
    implements UseCase<List<EmployeeAddress>, GetAllAddressOfEmployeeParams> {
  final AddressRepository addressRepository;
  GetAllAddressOfEmployee(this.addressRepository);

  @override
  Future<Either<Failure, List<EmployeeAddress>>> call(
      GetAllAddressOfEmployeeParams params) async {
    return await addressRepository.getAllAddressOfEmployee(
      employeeId: params.employeeId,
    );
  }
}

class GetAllAddressOfEmployeeParams {
  final String employeeId;

  GetAllAddressOfEmployeeParams({
    required this.employeeId,
  });
}
