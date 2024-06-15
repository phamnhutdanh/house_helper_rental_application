import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:house_helper_rental_application/core/error/exceptions.dart';
import 'package:house_helper_rental_application/features/address/data/datasources/address_graphql_documents.dart';
import 'package:house_helper_rental_application/features/address/data/models/customer_address_model.dart';

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
        document: gql(AddressGraphqlDocuments.createCustomerAddress),
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
        document: gql(AddressGraphqlDocuments.getAllAddressOfCustomer),
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
        document: gql(AddressGraphqlDocuments.getCustomerAddressById),
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
}
