import 'package:house_helper_rental_application/core/common/entities/rating.dart';
import 'package:house_helper_rental_application/core/error/failures.dart';
import 'package:house_helper_rental_application/core/usecase/usecase.dart';
import 'package:fpdart/fpdart.dart';
import 'package:house_helper_rental_application/features/employees/domain/repository/employee_repository.dart';

class CreateRatingEmployee
    implements UseCase<RatingEmployee, CreateRatingEmployeeParams> {
  final EmployeeRepository employeeRepository;
  CreateRatingEmployee(this.employeeRepository);

  @override
  Future<Either<Failure, RatingEmployee>> call(
      CreateRatingEmployeeParams params) async {
    return await employeeRepository.createRatingEmployee(
      score: params.score,
      comment: params.comment,
      bookingId: params.bookingId,
      employeeId: params.employeeId,
      customerId: params.customerId,
    );
  }
}

class CreateRatingEmployeeParams {
  final double score;
  final String comment;
  final String bookingId;
  final String employeeId;
  final String customerId;

  CreateRatingEmployeeParams({
    required this.score,
    required this.comment,
    required this.bookingId,
    required this.employeeId,
    required this.customerId,
  });
}
