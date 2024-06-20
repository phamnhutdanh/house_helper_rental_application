import 'package:house_helper_rental_application/core/common/entities/booking.dart';
import 'package:house_helper_rental_application/core/error/failures.dart';
import 'package:house_helper_rental_application/core/usecase/usecase.dart';
import 'package:fpdart/fpdart.dart';
import 'package:house_helper_rental_application/features/booking/domain/repository/booking_repository.dart';

class GetAllBooking implements UseCase<List<Booking>, GetBookingParams> {
  final BookingRepository bookingRepository;
  GetAllBooking(this.bookingRepository);

  @override
  Future<Either<Failure, List<Booking>>> call(GetBookingParams params) async {
    return await bookingRepository.getAllBooking(employeeId: params.employeeId);
  }
}

class GetBookingParams {
  final String employeeId;

  GetBookingParams({
    required this.employeeId,
  });
}
