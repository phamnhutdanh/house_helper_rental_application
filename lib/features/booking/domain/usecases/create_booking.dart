import 'package:house_helper_rental_application/core/common/entities/booking.dart';
import 'package:house_helper_rental_application/core/common/entities/service.dart';
import 'package:house_helper_rental_application/core/error/failures.dart';
import 'package:house_helper_rental_application/core/usecase/usecase.dart';
import 'package:fpdart/fpdart.dart';
import 'package:house_helper_rental_application/features/booking/domain/repository/booking_repository.dart';

class CreateBooking implements UseCase<Booking, CreateBookingParams> {
  final BookingRepository bookingRepository;
  CreateBooking(this.bookingRepository);

  @override
  Future<Either<Failure, Booking>> call(CreateBookingParams params) async {
    return await bookingRepository.createBooking(
      bookingTime: params.bookingTime,
      customerAddressId: params.customerAddressId,
      accountId: params.accountId,
      note: params.note,
      paymentMethod: params.paymentMethod,
      repeatStatus: params.repeatStatus,
      serviceDetails: params.serviceDetails,
      serviceId: params.serviceId,
      totalPrice: params.totalPrice,
    );
  }
}

class CreateBookingParams {
  final String bookingTime;
  final String repeatStatus;
  final int totalPrice;
  final String note;
  final String paymentMethod;
  final String serviceId;
  final String accountId;
  final String customerAddressId;
  final List<ServiceDetails> serviceDetails;

  CreateBookingParams({
    required this.bookingTime,
    required this.repeatStatus,
    required this.totalPrice,
    required this.note,
    required this.paymentMethod,
    required this.serviceId,
    required this.accountId,
    required this.customerAddressId,
    required this.serviceDetails,
  });
}
