import 'package:house_helper_rental_application/core/common/entities/booking.dart';
import 'package:house_helper_rental_application/core/error/failures.dart';
import 'package:house_helper_rental_application/core/usecase/usecase.dart';
import 'package:fpdart/fpdart.dart';
import 'package:house_helper_rental_application/features/booking/domain/repository/booking_repository.dart';

class EmployeeAccept implements UseCase<Booking, EmployeeAcceptParams> {
  final BookingRepository bookingRepository;
  EmployeeAccept(this.bookingRepository);

  @override
  Future<Either<Failure, Booking>> call(EmployeeAcceptParams params) async {
    return await bookingRepository.employeeAcceptBooking(
      bookingId: params.bookingId,
      employeeId: params.employeeId,
    );
  }
}

class EmployeeAcceptParams {
  final String bookingId;
  final String employeeId;

  EmployeeAcceptParams({
    required this.bookingId,
    required this.employeeId,
  });
}
