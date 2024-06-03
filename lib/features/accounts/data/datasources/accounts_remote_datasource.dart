import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:house_helper_rental_application/core/error/exceptions.dart';
import 'package:house_helper_rental_application/features/accounts/data/datasources/accounts_graphql_documents.dart';
import 'package:house_helper_rental_application/features/accounts/data/models/account_item_model.dart';

abstract interface class AccountsRemoteDataSource {
  Future<List<AccountItemModel>> getAllAccounts();
}

class AccountRemoteDataSourceImpl implements AccountsRemoteDataSource {
  final GraphQLClient graphQLClient;
  AccountRemoteDataSourceImpl(this.graphQLClient);

  @override
  Future<List<AccountItemModel>> getAllAccounts() async {
    try {
      final QueryOptions options = QueryOptions(
        document: gql(
          AccountsGraphqlDocuments.getAllAccounts,
        ),
      );

      final QueryResult result = await graphQLClient.query(options);

      if (result.hasException) {
        throw const ServerExceptionError('Query get all accounts is error!');
      }

      final resultData = result.data?['getAllAccountInfos'] as List<dynamic>;
      return resultData
          .map((account) => AccountItemModel.fromJson(account))
          .toList();
    } catch (e) {
      throw ServerExceptionError(e.toString());
    }
  }
}
