import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:house_helper_rental_application/core/error/exceptions.dart';
import 'package:house_helper_rental_application/features/admin/data/datasources/account_graphql_documents.dart';
import 'package:house_helper_rental_application/features/admin/data/models/account_model.dart';

abstract interface class AccountRemoteDataSource {
  Future<List<AccountModel>> getAllAccounts();
}

class AccountRemoteDataSourceImpl implements AccountRemoteDataSource {
  final GraphQLClient graphQLClient;
  AccountRemoteDataSourceImpl(this.graphQLClient);

  @override
  Future<List<AccountModel>> getAllAccounts() async {
    try {
      final QueryOptions options = QueryOptions(
        document: gql(
          AccountGraphqlDocuments.getAllAccounts,
        ),
      );

      final QueryResult result = await graphQLClient.query(options);

      if (result.hasException) {
        throw const ServerExceptionError('Query get all accounts is error!');
      }

      final resultData = result.data?['getAllAccountInfos'] as List<dynamic>;
      return resultData
          .map((account) => AccountModel.fromJson(account))
          .toList();
    } catch (e) {
      throw ServerExceptionError(e.toString());
    }
  }
}
