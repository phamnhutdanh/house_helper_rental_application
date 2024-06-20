import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:house_helper_rental_application/core/error/exceptions.dart';
import 'package:house_helper_rental_application/features/address/data/datasources/address_graphql_documents.dart';
import 'package:house_helper_rental_application/features/address/data/models/customer_address_model.dart';
import 'package:house_helper_rental_application/features/address/data/models/employee_address_model.dart';

abstract interface class AddressRemoteDataSource {
  Future<CustomerAddressModel> createCustomerAddress({
    required String address,
    required String fullName,
    required String phone,
    required String customerId,
    required bool isDefault,
  });

  Future<List<CustomerAddressModel>> getAllAddressOfCustomer({
    required String customerId,
  });



  Future<CustomerAddressModel> getCustomerAddressById({
    required String id,
  });

  Future<CustomerAddressModel> removeCustomerAddress({
    required String id,
  });

  Future<List<EmployeeAddressModel>> getAllAddressOfEmployee({
    required String employeeId,
  });
  
  Future<EmployeeAddressModel> createEmployeeAddress({
    required String address,
    required String fullName,
    required String phone,
    required String employeeId,
    required bool isDefault,
  });

  Future<EmployeeAddressModel> removeEmployeeAddress({
    required String id,
  });
}

class AddressRemoteDataSourceImpl implements AddressRemoteDataSource {
  final GraphQLClient graphQLClient;
  AddressRemoteDataSourceImpl(this.graphQLClient);

  @override
  Future<CustomerAddressModel> createCustomerAddress({
    required String address,
    required String fullName,
    required String phone,
    required String customerId,
    required bool isDefault,
  }) async {
    try {
      final createAddressInput = CreateAddressInput(
        address: address,
        fullName: fullName,
        phone: phone,
      );

      final createCustomerAddressInput = CreateCustomerAddressInput(
        customerId: customerId,
        isDefault: isDefault,
      );

      final MutationOptions options = MutationOptions(
        document: gql(AddressGraphqlDocuments.createCustomerAddressMutation),
        variables: {
          'createAddressInput': createAddressInput.toJson(),
          'createCustomerAddressInput': createCustomerAddressInput.toJson(),
        },
        fetchPolicy: FetchPolicy.networkOnly,
      );

      final QueryResult result = await graphQLClient.mutate(options);

      if (result.hasException) {
        throw const ServerExceptionError(
            'Mutation create customer address is error!');
      }
      return CustomerAddressModel.fromJson(
          result.data?['createCustomerAddress'] ?? {});
    } catch (e) {
      throw ServerExceptionError(e.toString());
    }
  }

  @override
  Future<List<CustomerAddressModel>> getAllAddressOfCustomer(
      {required String customerId}) async {
    try {
      final QueryOptions options = QueryOptions(
        document: gql(AddressGraphqlDocuments.getAllAddressOfCustomerQuery),
        variables: {
          'customerId': customerId,
        },
        fetchPolicy: FetchPolicy.networkOnly,
      );

      final QueryResult result = await graphQLClient.query(options);

      if (result.hasException) {
        throw const ServerExceptionError(
            'Query get all addresses of customer is error!');
      }
      final resultData =
          result.data?['getAllAddressOfCustomer'] as List<dynamic>;
      return resultData
          .map((customerAddress) =>
              CustomerAddressModel.fromJson(customerAddress))
          .toList();
    } catch (e) {
      throw ServerExceptionError(e.toString());
    }
  }

  @override
  Future<CustomerAddressModel> getCustomerAddressById(
      {required String id}) async {
    try {
      final QueryOptions options = QueryOptions(
        document: gql(AddressGraphqlDocuments.getCustomerAddressByIdQuery),
        variables: {
          'id': id,
        },
        fetchPolicy: FetchPolicy.networkOnly,
      );

      final QueryResult result = await graphQLClient.query(options);

      if (result.hasException) {
        throw const ServerExceptionError(
            'Query get customer address by id is error!');
      }
      final resultData = result.data?['getCustomerAddressById'];
      return CustomerAddressModel.fromJson(resultData);
    } catch (e) {
      throw ServerExceptionError(e.toString());
    }
  }

  @override
  Future<CustomerAddressModel> removeCustomerAddress(
      {required String id}) async {
    try {
      final MutationOptions options = MutationOptions(
        document: gql(AddressGraphqlDocuments.removeCustomerAddressMutation),
        variables: {
          'id': id,
        },
        fetchPolicy: FetchPolicy.networkOnly,
      );

      final QueryResult result = await graphQLClient.mutate(options);

      if (result.hasException) {
        throw const ServerExceptionError(
            'Mutation delete customer address is error!');
      }
      return CustomerAddressModel.fromJson(
          result.data?['removeCustomerAddress'] ?? {});
    } catch (e) {
      throw ServerExceptionError(e.toString());
    }
  }

  @override
  Future<List<EmployeeAddressModel>> getAllAddressOfEmployee(
      {required String employeeId}) async {
    try {
      final QueryOptions options = QueryOptions(
        document: gql(AddressGraphqlDocuments.getAllAddressOfEmployeeQuery),
        variables: {
          'employeeId': employeeId,
        },
        fetchPolicy: FetchPolicy.networkOnly,
      );

      final QueryResult result = await graphQLClient.query(options);

      if (result.hasException) {
        throw const ServerExceptionError(
            'Query getAllAddressOfEmployee is error!');
      }
      final resultData =
          result.data?['getAllAddressOfEmployee'] as List<dynamic>;
      return resultData
          .map((customerAddress) =>
              EmployeeAddressModel.fromJson(customerAddress))
          .toList();
    } catch (e) {
      throw ServerExceptionError(e.toString());
    }
  }

  @override
  Future<EmployeeAddressModel> createEmployeeAddress(
      {required String address,
      required String fullName,
      required String phone,
      required String employeeId,
      required bool isDefault}) async {
    try {
      final createAddressInput = CreateAddressInput(
        address: address,
        fullName: fullName,
        phone: phone,
      );

      final createEmployeeAddressInput = CreateEmployeeAddressInput(
        employeeId: employeeId,
        isDefault: isDefault,
      );

      final MutationOptions options = MutationOptions(
        document: gql(AddressGraphqlDocuments.createEmployeeAddressMutation),
        variables: {
          'createAddressInput': createAddressInput.toJson(),
          'createEmployeeAddressInput': createEmployeeAddressInput.toJson(),
        },
        fetchPolicy: FetchPolicy.networkOnly,
      );

      final QueryResult result = await graphQLClient.mutate(options);

      if (result.hasException) {
        throw const ServerExceptionError(
            'Mutation createEmployeeAddressInput is error!');
      }
      return EmployeeAddressModel.fromJson(
          result.data?['createEmployeeAddress'] ?? {});
    } catch (e) {
      throw ServerExceptionError(e.toString());
    }
  }

  @override
  Future<EmployeeAddressModel> removeEmployeeAddress(
      {required String id}) async {
    try {
      final MutationOptions options = MutationOptions(
        document: gql(AddressGraphqlDocuments.removeEmployeeAddressMutation),
        variables: {
          'id': id,
        },
        fetchPolicy: FetchPolicy.networkOnly,
      );

      final QueryResult result = await graphQLClient.mutate(options);

      if (result.hasException) {
        throw const ServerExceptionError(
            'Mutation removeEmployeeAddress is error!');
      }
      return EmployeeAddressModel.fromJson(
          result.data?['removeEmployeeAddress'] ?? {});
    } catch (e) {
      throw ServerExceptionError(e.toString());
    }
  }
}
