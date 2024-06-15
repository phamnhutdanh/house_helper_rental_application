import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:house_helper_rental_application/core/error/exceptions.dart';
import 'package:house_helper_rental_application/features/services/data/datasources/service_graphql_documents.dart';

import 'package:house_helper_rental_application/features/services/data/models/service_model.dart';

abstract interface class ServicesRemoteDataSource {
  Future<List<ServiceModel>> getAllServices();
  Future<ServiceModel> getServiceById({required String id});
}

class ServicesRemoteDataSourceImpl implements ServicesRemoteDataSource {
  final GraphQLClient graphQLClient;
  ServicesRemoteDataSourceImpl(this.graphQLClient);

  @override
  Future<List<ServiceModel>> getAllServices() async {
    try {
      final QueryOptions options = QueryOptions(
        document: gql(ServiceGraphqlDocuments.getAllServicesQuery),
        fetchPolicy: FetchPolicy.networkOnly,
      );

      final QueryResult result = await graphQLClient.query(options);

      if (result.hasException) {
        throw const ServerExceptionError('Query get all services is error!');
      }

      final resultData = result.data?['getAllServices'] as List<dynamic>;
      return resultData
          .map((service) => ServiceModel.fromJson(service))
          .toList();
    } catch (e) {
      throw ServerExceptionError(e.toString());
    }
  }

  @override
  Future<ServiceModel> getServiceById({
    required String id,
  }) async {
    try {
      final QueryOptions options = QueryOptions(
        document: gql(ServiceGraphqlDocuments.getServiceByIdQuery),
        variables: {
          'id': id,
        },
        fetchPolicy: FetchPolicy.networkOnly,
      );

      final QueryResult result = await graphQLClient.query(options);

      if (result.hasException) {
        throw const ServerExceptionError('Query get services by id is error!');
      }

      final resultData = result.data?['getServiceById'] ?? {};
      return ServiceModel.fromJson(resultData);
    } catch (e) {
      throw ServerExceptionError(e.toString());
    }
  }
}
