import 'package:house_helper_rental_application/core/common/entities/booking.dart';
import 'package:house_helper_rental_application/core/common/entities/enum_type.dart';
import 'package:house_helper_rental_application/core/common/entities/service.dart';
import 'package:house_helper_rental_application/core/error/failures.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class BookingRepository {
  Future<Either<Failure, Booking>> createBooking({
    required String bookingTime,
    required String repeatStatus,
    required int totalPrice,
    required String note,
    required String paymentMethod,
    required String serviceId,
    required String accountId,
    required String customerAddressId,
    required List<ServiceDetails> serviceDetails,
  });

  Future<Either<Failure, List<Booking>>> getAllBookingOfCustomer({
    required String customerId,
  });

  Future<Either<Failure, Booking>> getBookingById({
    required String id,
  });

  Future<Either<Failure, Booking>> changeBookingStatus({
    required String id,
    required BookingStatus bookingStatus,
  });
}
