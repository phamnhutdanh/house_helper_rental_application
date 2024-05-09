class CreateCustomerAccountInput {
  final String email;
  final String name;

  CreateCustomerAccountInput({
    required this.email,
    required this.name,
  });

  Map<String, dynamic> toJson() {
    return {'email': email, 'name': name};
  }
}

class CreateSessionInput {
  final String sessionToken;
  final String expires;
  final String accessToken;

  final int? expiresAt;
  final int? expiresIn;
  final bool? isExpired;

  final String? providerRefreshToken;
  final String? providerToken;
  final String? refreshToken;
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
    mutation Mutation(\$createCustomerAccountInput: CreateCustomerAccountInput, \$createSessionInput: CreateSessionInput) {
      createCustomerAccount(createCustomerAccountInput: \$createCustomerAccountInput, createSessionInput: \$createSessionInput) {
          id
          email
          role
          createdAt
          updatedAt
          status
      }
    }
    """;
}
