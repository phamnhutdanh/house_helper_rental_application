class CreateAddressInput {
  final String address;
  final String fullName;
  final String phone;

  CreateAddressInput({
    required this.address,
    required this.fullName,
    required this.phone,
  });

  Map<String, dynamic> toJson() {
    return {
      'address': address,
      'fullName': fullName,
      'phone': phone,
    };
  }
}

class CreateCustomerAddressInput {
  final String customerId;
  final bool isDefault;

  CreateCustomerAddressInput({
    required this.customerId,
    required this.isDefault,
  });

  Map<String, dynamic> toJson() {
    return {
      'customerId': customerId,
      'isDefault': isDefault,
    };
  }
}

class CreateEmployeeAddressInput {
  final String employeeId;
  final bool isDefault;

  CreateEmployeeAddressInput({
    required this.employeeId,
    required this.isDefault,
  });

  Map<String, dynamic> toJson() {
    return {
      'employeeId': employeeId,
      'isDefault': isDefault,
    };
  }
}

class AddressGraphqlDocuments {
  static String createCustomerAddressMutation = """
      mutation CreateCustomerAddress(\$createAddressInput: CreateAddressInput, \$createCustomerAddressInput: CreateCustomerAddressInput) {
      createCustomerAddress(createAddressInput: \$createAddressInput, createCustomerAddressInput: \$createCustomerAddressInput) {
          id
          addressType
          address {
            id
            phone
            fullName
            address
          }
          customer {
            id
            imageUri
            name
            phoneNumber
          }
      }
    }
""";

  static String removeCustomerAddressMutation = """
    mutation Mutation(\$id: String) {
      removeCustomerAddress(id: \$id) {
        id
      }
    }
""";

  static String createEmployeeAddressMutation = """
      mutation CreateEmployeeAddress(\$createAddressInput: CreateAddressInput, \$createEmployeeAddressInput: CreateEmployeeAddressInput) {
      createEmployeeAddress(createAddressInput: \$createAddressInput, createEmployeeAddressInput: \$createEmployeeAddressInput) {
          id
          addressType
          address {
            id
            phone
            fullName
            address
          }
          employee {
            id
            imageUri
            name
            phoneNumber
          }
      }
    }
""";

  static String removeEmployeeAddressMutation = """
    mutation Mutation(\$id: String) {
      removeEmployeeAddress(id: \$id) {
        id
      }
    }
""";

  static String getAllAddressOfCustomerQuery = """
      query GetAllAddressOfCustomer(\$customerId: String) {
        getAllAddressOfCustomer(customerId: \$customerId) {
          id
          addressType
          address {
            id
            phone
            fullName
            address
          }
          customer {
            id
            imageUri
            name
            phoneNumber
          }
        }
      }
""";

  static String getAllAddressOfEmployeeQuery = """
      query GetAllAddressOfEmployee(\$employeeId: String) {
        getAllAddressOfEmployee(employeeId: \$employeeId) {
          id
          addressType
          address {
            id
            phone
            fullName
            address
          }
          employee {
            id
            imageUri
            name
            phoneNumber
          }
        }
      }
""";

  static String getCustomerAddressByIdQuery = """
      query GetCustomerAddressById(\$id: String) {
        getCustomerAddressById(id: \$id) {
          id
          addressType
          address {
            id
            phone
            fullName
            address
          }
          customer {
            id
            imageUri
            name
            phoneNumber
          }
        }
      }
""";
}
