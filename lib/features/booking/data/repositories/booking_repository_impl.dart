import 'package:fpdart/fpdart.dart';
import 'package:house_helper_rental_application/core/common/entities/booking.dart';
import 'package:house_helper_rental_application/core/common/entities/service.dart';
import 'package:house_helper_rental_application/core/error/exceptions.dart';
import 'package:house_helper_rental_application/core/error/failures.dart';
import 'package:house_helper_rental_application/features/booking/data/datasources/booking_remote_data_source.dart';
import 'package:house_helper_rental_application/features/booking/domain/repository/booking_repository.dart';

class BookingRepositoryImpl implements BookingRepository {
  final BookingRemoteDataSource bookingRemoteDataSource;

  BookingRepositoryImpl(
    this.bookingRemoteDataSource,
  );

  @override
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
  }) async {
    try {
      final booking = await bookingRemoteDataSource.createBooking(
        bookingTime: bookingTime,
        customerAddressId: customerAddressId,
        customerId: accountId,
        note: note,
        paymentMethod: paymentMethod,
        repeatStatus: repeatStatus,
        serviceDetails: serviceDetails,
        serviceId: serviceId,
        totalPrice: totalPrice,
      );
      return right(booking);
    } on ServerExceptionError catch (e) {
      return left(Failure(e.message));
    }
  }
}
