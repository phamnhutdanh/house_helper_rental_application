class AccountGraphqlDocuments {
  static String getAllAccounts = """
    query GetAllAccountInfos {
      getAllAccountInfos {
        id
        email
        accountRole
        status
        employee {
          id
          name
          imageUri
        }
        customer {
          id
          name
          imageUri
        }
      }
    }
    """;
}
