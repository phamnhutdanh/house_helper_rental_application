import 'package:house_helper_rental_application/core/common/entities/address.dart';
import 'package:house_helper_rental_application/core/common/entities/booking.dart';
import 'package:house_helper_rental_application/core/common/entities/employee.dart';
import 'package:house_helper_rental_application/core/common/entities/service.dart';
import 'package:house_helper_rental_application/core/error/failures.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class BookingRepository {
  Future<Either<Failure, List<Service>>> getAllServices();
  Future<Either<Failure, List<Employee>>> getAllEmployees();
  Future<Either<Failure, List<Employee>>> getTopEmployees();
  Future<Either<Failure, Service>> getServiceById({required String id});
  Future<Either<Failure, Booking>> createBooking({
    required String bookingTime,
    required String repeatStatus,
    required int totalPrice,
    required String note,
    required String paymentMethod,
    required String serviceId,
    required String customerId,
    required String customerAddressId,
    required List<ServiceDetails> serviceDetails,
  });

  Future<Either<Failure, CustomerAddress>> createCustomerAddress({
    required String address,
    required String fullName,
    required String phone,
    required String customerId,
    required bool isDefault,
  });
}
