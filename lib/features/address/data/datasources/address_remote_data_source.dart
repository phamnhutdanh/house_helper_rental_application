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
}
