import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:house_helper_rental_application/core/error/exceptions.dart';
import 'package:house_helper_rental_application/features/employees/data/datasources/employee_graphql_douments.dart';
import 'package:house_helper_rental_application/features/employees/data/models/employee_model.dart';
import 'package:house_helper_rental_application/features/employees/data/models/rating_employee_model.dart';

abstract interface class EmployeesRemoteDataSource {
  Future<List<EmployeeModel>> getTopEmployees();
  Future<RatingEmployeeModel> createRatingEmployee({
    required double score,
    required String comment,
    required String employeeId,
    required String bookingId,
    required String customerId,
  });
}

class EmployeesRemoteDataSourceImpl implements EmployeesRemoteDataSource {
  final GraphQLClient graphQLClient;
  EmployeesRemoteDataSourceImpl(this.graphQLClient);

  @override
  Future<List<EmployeeModel>> getTopEmployees() async {
    try {
      final QueryOptions options = QueryOptions(
        document: gql(EmployeeGraphqlDocuments.getTopEmployeesQuery),
        fetchPolicy: FetchPolicy.networkOnly,
      );

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

  @override
  Future<RatingEmployeeModel> createRatingEmployee({
    required double score,
    required String comment,
    required String employeeId,
    required String bookingId,
    required String customerId,
  }) async {
    try {
      final createRatingEmployee = CreateRatingEmployeeInput(
        score: score,
        comment: comment,
        bookingId: bookingId,
        employeeId: employeeId,
        customerId: customerId,
      );

      final MutationOptions options = MutationOptions(
        document: gql(EmployeeGraphqlDocuments.createRatingEmployeeMutation),
        variables: {
          'createRatingEmployeeInput': createRatingEmployee.toJson(),
        },
        fetchPolicy: FetchPolicy.networkOnly,
      );

      final QueryResult result = await graphQLClient.mutate(options);

      if (result.hasException) {
        throw const ServerExceptionError('Mutation create rating is error!');
      }
      return RatingEmployeeModel.fromJson(
          result.data?['createRatingEmployee'] ?? {});
    } catch (e) {
      throw ServerExceptionError(e.toString());
    }
  }
}
