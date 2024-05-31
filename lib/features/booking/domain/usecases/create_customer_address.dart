import 'package:house_helper_rental_application/core/common/entities/address.dart';
import 'package:house_helper_rental_application/core/error/failures.dart';
import 'package:house_helper_rental_application/core/usecase/usecase.dart';
import 'package:fpdart/fpdart.dart';
import 'package:house_helper_rental_application/features/booking/domain/repository/booking_repository.dart';

class CreateCustomerAddress
    implements UseCase<CustomerAddress, CreateCustomerAddressParams> {
  final BookingRepository bookingRepository;
  CreateCustomerAddress(this.bookingRepository);

  @override
  Future<Either<Failure, CustomerAddress>> call(
      CreateCustomerAddressParams params) async {
    return await bookingRepository.createCustomerAddress(
      address: params.address,
      fullName: params.fullName,
      phone: params.phone,
      customerId: params.customerId,
      isDefault: params.isDefault,
    );
  }
}

class CreateCustomerAddressParams {
  final String address;
  final String fullName;
  final String phone;
  final String customerId;
  final bool isDefault;

  CreateCustomerAddressParams({
    required this.address,
    required this.fullName,
    required this.phone,
    required this.customerId,
    required this.isDefault,
  });
}
