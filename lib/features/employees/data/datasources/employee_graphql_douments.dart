class EmployeeGraphqlDocuments {
  static String getTopEmployees = """
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
}
