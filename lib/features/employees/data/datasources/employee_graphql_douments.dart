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

class FavoriteInput {
  final String employeeId;
  final String customerId;

  FavoriteInput({
    required this.employeeId,
    required this.customerId,
  });

  Map<String, dynamic> toJson() {
    return {
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

  static String addToFavoriteMutation = """
    mutation AddToFavorite(\$favoriteInput: FavoriteInput) {
      addToFavorite(favoriteInput: \$favoriteInput) {
        id
      }
    }
  """;

  static String removeFromFavoriteMutation = """
    mutation RemoveFromFavorite(\$favoriteInput: FavoriteInput) {
      removeFromFavorite(favoriteInput: \$favoriteInput) {
        id
      }
    }
  """;

    static String getFavoriteEmployeesOfCustomerQuery = """
      query GetFavoriteEmployeesOfCustomer(\$customerId: String) {
        getFavoriteEmployeesOfCustomer(customerId: \$customerId) {
          id
          employeeId
          employee {
            id
            imageUri
            name
            averageRating
            accountInfo {
              email
            }
          }
        }
      }
  """;

  static String checkFavoriteQuery = """
      query Query(\$favoriteInput: FavoriteInput) {
        checkFavorite(favoriteInput: \$favoriteInput)
      }
  """;

  static String getEmployeeByIdQuery = """
      query GetEmployeeById(\$id: String) {
        getEmployeeById(id: \$id) {
          id
          imageUri
          name
          phoneNumber
          ratings {
            id
            score
            updatedAt
            customer {
              imageUri
              name
            }
            comment
          }
          accountInfo {
            email
          }
          description
          age
          averageRating
          workingHours
          employeeAddresses {
            address {
              address
            }
          }
        }
      }
  """;
}
