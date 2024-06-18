import 'package:house_helper_rental_application/core/common/entities/booking.dart';
import 'package:house_helper_rental_application/core/common/entities/enum_type.dart';

import 'package:house_helper_rental_application/core/error/failures.dart';
import 'package:house_helper_rental_application/core/usecase/usecase.dart';
import 'package:fpdart/fpdart.dart';
import 'package:house_helper_rental_application/features/booking/domain/repository/booking_repository.dart';

class ChangeBookingStatus
    implements UseCase<Booking, ChangeBookingStatusParams> {
  final BookingRepository bookingRepository;
  ChangeBookingStatus(this.bookingRepository);

  @override
  Future<Either<Failure, Booking>> call(
      ChangeBookingStatusParams params) async {
    return await bookingRepository.changeBookingStatus(
      id: params.id,
      bookingStatus: params.bookingStatus,
    );
  }
}

class ChangeBookingStatusParams {
  final String id;
  final BookingStatus bookingStatus;

  ChangeBookingStatusParams({
    required this.id,
    required this.bookingStatus,
  });
}
