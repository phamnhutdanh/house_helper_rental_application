class CreateRatingEmployeeInput {
  final double score;
  final String comment;
  final String bookingId;
  final String employeeId;
  final String customerId;

  CreateRatingEmployeeInput({
    required this.score,
    required this.comment,
    required this.bookingId,
    required this.employeeId,
    required this.customerId,
  });

  Map<String, dynamic> toJson() {
    return {
      'score': score.toInt(),
      'comment': comment,
      'bookingId': bookingId,
      'employeeId': employeeId,
      'customerId': customerId,
    };
  }
}

class EmployeeGraphqlDocuments {
  static String getTopEmployeesQuery = """
    query GetTopEmployees {
      getTopEmployees {
        id
        imageUri
        name
        phoneNumber
        workingHours
        description
        age
        averageRating
        accountInfoId
      }
  }""";

  static String createRatingEmployeeMutation = """
    mutation CreateRatingEmployee(\$createRatingEmployeeInput: CreateRatingEmployeeInput) {
      createRatingEmployee(createRatingEmployeeInput: \$createRatingEmployeeInput) {
        id
        score
        comment
      }
    }
  """;
}
