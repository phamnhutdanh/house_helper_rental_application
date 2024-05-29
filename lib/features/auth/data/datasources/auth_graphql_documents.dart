class CreateAccountInput {
  final String email;
  final String name;
  final String accountId;
  final bool isEmployee;

  CreateAccountInput({
    required this.email,
    required this.name,
    required this.accountId,
    required this.isEmployee,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'name': name,
      'accountId': accountId,
      'isEmployee': isEmployee
    };
  }
}

class CreateSessionInput {
  final String sessionToken;
  final String expires;
  final String accessToken;

  final int expiresAt;
  final int expiresIn;
  final bool isExpired;

  final String providerRefreshToken;
  final String providerToken;
  final String refreshToken;
  final String tokenType;

  CreateSessionInput({
    required this.sessionToken,
    required this.expires,
    required this.accessToken,
    required this.expiresAt,
    required this.expiresIn,
    required this.isExpired,
    required this.providerRefreshToken,
    required this.providerToken,
    required this.refreshToken,
    required this.tokenType,
  });

  Map<String, dynamic> toJson() {
    return {
      'sessionToken': sessionToken,
      'expires': expires,
      'accessToken': accessToken,
      'expiresAt': expiresAt,
      'expiresIn': expiresIn,
      'isExpired': isExpired,
      'providerRefreshToken': providerRefreshToken,
      'providerToken': providerToken,
      'refreshToken': refreshToken,
      'tokenType': tokenType,
    };
  }
}

class AuthGraphqlDocuments {
  static String createCustomerAccountMutation = """
    mutation CreateAccount(\$createAccountInput: CreateAccountInput, \$createSessionInput: CreateSessionInput) {
      createAccount(createAccountInput: \$createAccountInput, createSessionInput: \$createSessionInput) {
        id
        email
        createdAt
        updatedAt
        status
        accountRole
      }
    }
    """;

  static String getAccountInfoByIdQuery = """
    query GetAccountInfoById(\$id: String) {
      getAccountInfoById(id: \$id) {
        id
        email
        accountRole
        createdAt
        updatedAt
        status
      }
    }""";
}
