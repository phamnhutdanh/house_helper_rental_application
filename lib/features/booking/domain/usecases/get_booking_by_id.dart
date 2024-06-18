import 'package:house_helper_rental_application/core/common/entities/booking.dart';
import 'package:house_helper_rental_application/core/error/failures.dart';
import 'package:house_helper_rental_application/core/usecase/usecase.dart';
import 'package:fpdart/fpdart.dart';
import 'package:house_helper_rental_application/features/booking/domain/repository/booking_repository.dart';

class GetBookingById implements UseCase<Booking, GetBookingByIdParams> {
  final BookingRepository bookingRepository;
  GetBookingById(this.bookingRepository);

  @override
  Future<Either<Failure, Booking>> call(GetBookingByIdParams params) async {
    return await bookingRepository.getBookingById(id: params.id);
  }
}

class GetBookingByIdParams {
  final String id;

  GetBookingByIdParams({
    required this.id,
  });
}
