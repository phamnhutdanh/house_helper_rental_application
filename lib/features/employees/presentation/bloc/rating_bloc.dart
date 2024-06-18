import 'package:bloc/bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:house_helper_rental_application/core/common/entities/rating.dart';
import 'package:house_helper_rental_application/features/employees/domain/usecases/create_rating_employee.dart';
import 'package:meta/meta.dart';

part 'rating_event.dart';
part 'rating_state.dart';

class RatingBloc extends Bloc<RatingEvent, RatingState> {
  final CreateRatingEmployee _createRatingEmployee;

  RatingBloc({
    required CreateRatingEmployee createRatingEmployee,
  })  : _createRatingEmployee = createRatingEmployee,
        super(RatingInitial()) {
    on<RatingEvent>((event, emit) => emit(RatingLoading()));
    on<CreateRatingEmployeeEvent>(_onCreateRating);
  }

  void _onCreateRating(
    CreateRatingEmployeeEvent event,
    Emitter<RatingState> emit,
  ) async {
    final ratingEmployee =
        await _createRatingEmployee.call(CreateRatingEmployeeParams(
      bookingId: event.bookingId,
      customerId: event.customerId,
      employeeId: event.employeeId,
      score: event.score,
      comment: event.comment,
    ));

    if (ratingEmployee.isRight()) {
      emit(CreateRatingEmployeeSuccess(
        ratingEmployee.getRight().getOrElse(() => throw UnimplementedError()),
      ));
    } else {
      emit(RatingFailure("Error create rating"));
    }
  }
}
