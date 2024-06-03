import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:house_helper_rental_application/core/error/exceptions.dart';
import 'package:house_helper_rental_application/features/employees/data/datasources/employee_graphql_douments.dart';
import 'package:house_helper_rental_application/features/employees/data/models/employee_model.dart';

abstract interface class EmployeesRemoteDataSource {
  Future<List<EmployeeModel>> getTopEmployees();
}

class EmployeesRemoteDataSourceImpl implements EmployeesRemoteDataSource {
  final GraphQLClient graphQLClient;
  EmployeesRemoteDataSourceImpl(this.graphQLClient);

  @override
  Future<List<EmployeeModel>> getTopEmployees() async {
    try {
      final QueryOptions options =
          QueryOptions(document: gql(EmployeeGraphqlDocuments.getTopEmployees));

      final QueryResult result = await graphQLClient.query(options);

      if (result.hasException) {
        throw const ServerExceptionError('Query get top employees is error!');
      }

      final resultData = result.data?['getTopEmployees'] as List<dynamic>;
      return resultData
          .map((employee) => EmployeeModel.fromJson(employee))
          .toList();
    } catch (e) {
      throw ServerExceptionError(e.toString());
    }
  }
}
