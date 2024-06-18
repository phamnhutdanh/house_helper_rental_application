import 'package:house_helper_rental_application/core/common/entities/booking.dart';
import 'package:house_helper_rental_application/core/error/failures.dart';
import 'package:house_helper_rental_application/core/usecase/usecase.dart';
import 'package:fpdart/fpdart.dart';
import 'package:house_helper_rental_application/features/booking/domain/repository/booking_repository.dart';

class GetAllBookingOfCustomer
    implements UseCase<List<Booking>, GetAllBookingOfCustomerParams> {
  final BookingRepository bookingRepository;
  GetAllBookingOfCustomer(this.bookingRepository);

  @override
  Future<Either<Failure, List<Booking>>> call(
      GetAllBookingOfCustomerParams params) async {
    return await bookingRepository.getAllBookingOfCustomer(
      customerId: params.customerId,
    );
  }
}

class GetAllBookingOfCustomerParams {
  final String customerId;

  GetAllBookingOfCustomerParams({
    required this.customerId,
  });
}
