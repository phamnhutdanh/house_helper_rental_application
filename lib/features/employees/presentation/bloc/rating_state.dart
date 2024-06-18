part of 'rating_bloc.dart';

@immutable
sealed class RatingState {}

final class RatingInitial extends RatingState {}

final class RatingLoading extends RatingState {}

final class RatingFailure extends RatingState {
  final String error;
  RatingFailure(this.error);
}

final class CreateRatingEmployeeSuccess extends RatingState {
  final RatingEmployee ratingEmployee;

  CreateRatingEmployeeSuccess(this.ratingEmployee);
}
