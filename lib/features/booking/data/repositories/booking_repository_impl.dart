import 'package:fpdart/fpdart.dart';
import 'package:house_helper_rental_application/core/common/entities/booking.dart';
import 'package:house_helper_rental_application/core/common/entities/enum_type.dart';
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

  @override
  Future<Either<Failure, List<Booking>>> getAllBookingOfCustomer(
      {required String customerId}) async {
    try {
      final booking = await bookingRemoteDataSource.getAllBookingOfCustomer(
        customerId: customerId,
      );
      return right(booking);
    } on ServerExceptionError catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, Booking>> getBookingById({required String id}) async {
    try {
      final booking = await bookingRemoteDataSource.getBookingById(
        id: id,
      );
      return right(booking);
    } on ServerExceptionError catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, Booking>> changeBookingStatus({
    required String id,
    required BookingStatus bookingStatus,
  }) async {
    try {
      final booking = await bookingRemoteDataSource.changeBookingStatus(
        id: id,
        bookingStatus: bookingStatus,
      );
      return right(booking);
    } on ServerExceptionError catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<Booking>>> getAllBooking({
    required String employeeId,
  }) async {
    try {
      final booking =
          await bookingRemoteDataSource.getAllBooking(employeeId: employeeId);
      return right(booking);
    } on ServerExceptionError catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, Booking>> employeeAcceptBooking(
      {required String bookingId, required String employeeId}) async {
    try {
      final booking = await bookingRemoteDataSource.employeeAcceptBooking(
        bookingId: bookingId,
        employeeId: employeeId,
      );
      return right(booking);
    } on ServerExceptionError catch (e) {
      return left(Failure(e.message));
    }
  }
}
