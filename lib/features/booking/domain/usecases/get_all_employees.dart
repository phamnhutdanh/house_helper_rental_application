import 'package:house_helper_rental_application/core/common/entities/employee.dart';
import 'package:house_helper_rental_application/core/error/failures.dart';
import 'package:house_helper_rental_application/core/usecase/usecase.dart';
import 'package:fpdart/fpdart.dart';
import 'package:house_helper_rental_application/features/booking/domain/repository/booking_repository.dart';

class GetAllEmployees implements UseCase<List<Employee>, NoParams> {
  final BookingRepository bookingRepository;
  GetAllEmployees(this.bookingRepository);

  @override
  Future<Either<Failure, List<Employee>>> call(NoParams params) async {
    return await bookingRepository.getAllEmployees();
  }
}
