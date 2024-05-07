class RatingEmployee {
  final String id;
  final double score;
  final String? comment;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String bookingId;
  final String customerId;
  final String employeeId;

  RatingEmployee({
    required this.id,
    required this.score,
    this.comment,
    required this.createdAt,
    required this.updatedAt,
    required this.bookingId,
    required this.customerId,
    required this.employeeId,
  });
}
