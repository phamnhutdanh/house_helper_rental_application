part of 'rating_bloc.dart';

@immutable
sealed class RatingEvent {}

final class CreateRatingEmployeeEvent extends RatingEvent {
  final double score;
  final String comment;
  final String bookingId;
  final String employeeId;
  final String customerId;

  CreateRatingEmployeeEvent({
    required this.score,
    required this.comment,
    required this.bookingId,
    required this.employeeId,
    required this.customerId,
  });
}
