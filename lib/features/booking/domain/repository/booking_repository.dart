import 'package:house_helper_rental_application/core/error/failures.dart';
import 'package:house_helper_rental_application/core/common/entities/user.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class BookingRepository {
  Future<Either<Failure, User>> viewBooking({
    required String name,
  });
  Future<Either<Failure, User>> loginWithEmailPassword({
    required String email,
  });
  Future<Either<Failure, User>> currentUser();
}
