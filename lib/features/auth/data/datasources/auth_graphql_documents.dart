import 'package:house_helper_rental_application/core/common/entities/enum_type.dart';

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

class UpdateCustomerInput {
  final String customerId;
  final String name;
  final String phone;
  final String imageUri;

  UpdateCustomerInput({
    required this.customerId,
    required this.name,
    required this.phone,
    required this.imageUri,
  });

  Map<String, dynamic> toJson() {
    return {
      'customerId': customerId,
      'name': name,
      'phone': phone,
      'imageUri': imageUri,
    };
  }
}

class ChangeNotiInput {
  final String id;
  final String status;

  ChangeNotiInput({
    required this.id,
    required this.status,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'status': status,
    };
  }
}

class UpdateEmployeeInput {
  final String employeeId;
  final String name;
  final String phone;
  final String imageUri;
  final String description;

  UpdateEmployeeInput({
    required this.employeeId,
    required this.name,
    required this.phone,
    required this.imageUri,
    required this.description,
  });

  Map<String, dynamic> toJson() {
    return {
      'employeeId': employeeId,
      'name': name,
      'phone': phone,
      'imageUri': imageUri,
      'description': description,
    };
  }
}

class AccountStatusInput {
  final String accountId;
  final AccountStatus status;

  AccountStatusInput({
    required this.accountId,
    required this.status,
  });

  Map<String, dynamic> toJson() {
    return {
      'accountId': accountId,
      'status': status == AccountStatus.NONE
          ? "NONE"
          : status == AccountStatus.BANNED
              ? "BANNED"
              : "WARNING",
    };
  }
}

class AuthGraphqlDocuments {
  static String createAccountMutation = """
    mutation CreateAccount(\$createAccountInput: CreateAccountInput, \$createSessionInput: CreateSessionInput) {
      createAccount(createAccountInput: \$createAccountInput, createSessionInput: \$createSessionInput) {
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

  static String getAccountInfoByIdQuery = """
    query GetAccountInfoById(\$id: String) {
      getAccountInfoById(id: \$id) {
        id
        email
        accountRole
        status
        employee {
          id
          name
          imageUri
          phoneNumber
          averageRating
          employeeAddresses {
              address {
                address
              }
          }
        }
        customer {
          id
          name
          imageUri
          phoneNumber
          customerAddresses { 
              address {
                address
              }
          }
        }
      }
    }""";

  static String updateCustomerInfoMutation = """
mutation Mutation(\$updateCustomerInput: UpdateCustomerInput) {
  updateCustomerInfo(updateCustomerInput: \$updateCustomerInput) {
        id
        email
        accountRole
        status
        employee {
          id
          name
          imageUri
          averageRating
          phoneNumber
          employeeAddresses {
              address {
                address
              }
          }
        }
        customer {
          id
          name
          imageUri
          phoneNumber
          customerAddresses { 
              address {
                address
              }
          }
        }
  }
}
""";

static String updateEmployeeInfoMutation = """
mutation Mutation(\$updateEmployeeInput: UpdateEmployeeInput) {
  updateEmployeeInfo(updateEmployeeInput: \$updateEmployeeInput) {
     id
        email
        accountRole
        status
        employee {
          id
          name
          imageUri
          averageRating
          phoneNumber
          employeeAddresses {
              address {
                address
              }
          }
        }
        customer {
          id
          name
          imageUri
          phoneNumber
          customerAddresses { 
              address {
                address
              }
          }
        }
  }
}
""";

  static String getNotificationOfAccountQuery = """
query GetNotificationOfAccount(\$accountId: String) {
  getNotificationOfAccount(accountId: \$accountId) {
    id
    description
    imageUri
    status
    title
    updatedAt
    createdAt
  }
}
""";

  static String changeNotiStatusMutation = """
mutation Mutation(\$changeNotiInput: ChangeNotiInput) {
  changeNotiStatus(changeNotiInput: \$changeNotiInput) {
    id
    title
    description
    createdAt
    accountId
    updatedAt
  }
}
""";

static String updateAccountStatusMutation = """
mutation UpdateAccountStatus(\$accountStatusInput: AccountStatusInput) {
  updateAccountStatus(accountStatusInput: \$accountStatusInput) {
  id
        email
        accountRole
        status
        employee {
          id
          name
          imageUri
          averageRating
          phoneNumber
          employeeAddresses {
              address {
                address
              }
          }
        }
        customer {
          id
          name
          imageUri
          phoneNumber
          customerAddresses { 
              address {
                address
              }
          }
        }  
  }
}

""";
}
