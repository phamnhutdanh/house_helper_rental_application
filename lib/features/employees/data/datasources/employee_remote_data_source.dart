import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:house_helper_rental_application/core/error/exceptions.dart';
import 'package:house_helper_rental_application/features/employees/data/datasources/employee_graphql_douments.dart';
import 'package:house_helper_rental_application/features/employees/data/models/employee_model.dart';
import 'package:house_helper_rental_application/features/employees/data/models/favorite_employee_model.dart';
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
  Future<EmployeeModel> getEmployeeById({
    required String id,
  });

  Future<bool> checkFavoriteInput({
    required String employeeId,
    required String customerId,
  });

  Future<List<FavoriteEmployeeModel>> getFavoriteEmployeesOfCustomer({
    required String customerId,
  });

  Future<FavoriteEmployeeModel> addToFavorite({
    required String employeeId,
    required String customerId,
  });

  Future<FavoriteEmployeeModel> removeFromFavorite({
    required String employeeId,
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

  @override
  Future<EmployeeModel> getEmployeeById({required String id}) async {
    try {
      final QueryOptions options = QueryOptions(
        document: gql(EmployeeGraphqlDocuments.getEmployeeByIdQuery),
        variables: {
          'id': id,
        },
        fetchPolicy: FetchPolicy.networkOnly,
      );

      final QueryResult result = await graphQLClient.query(options);

      if (result.hasException) {
        throw const ServerExceptionError('Query get employee by id is error!');
      }

      final resultData = result.data?['getEmployeeById'] ?? {};
      return EmployeeModel.fromJson(resultData);
    } catch (e) {
      throw ServerExceptionError(e.toString());
    }
  }

  @override
  Future<List<FavoriteEmployeeModel>> getFavoriteEmployeesOfCustomer(
      {required String customerId}) async {
    try {
      final QueryOptions options = QueryOptions(
        document:
            gql(EmployeeGraphqlDocuments.getFavoriteEmployeesOfCustomerQuery),
        variables: {
          'customerId': customerId,
          // 'id': id,
        },
        fetchPolicy: FetchPolicy.networkOnly,
      );

      final QueryResult result = await graphQLClient.query(options);

      if (result.hasException) {
        throw const ServerExceptionError(
            'Query get fav employee of cus is error!');
      }

      final resultData =
          result.data?['getFavoriteEmployeesOfCustomer'] as List<dynamic>;
      return resultData
          .map((employee) => FavoriteEmployeeModel.fromJson(employee))
          .toList();
    } catch (e) {
      throw ServerExceptionError(e.toString());
    }
  }

  @override
  Future<FavoriteEmployeeModel> addToFavorite(
      {required String employeeId, required String customerId}) async {
    try {
      final favorite = FavoriteInput(
        employeeId: employeeId,
        customerId: customerId,
      );

      final MutationOptions options = MutationOptions(
        document: gql(EmployeeGraphqlDocuments.addToFavoriteMutation),
        variables: {
          'favoriteInput': favorite.toJson(),
        },
        fetchPolicy: FetchPolicy.networkOnly,
      );

      final QueryResult result = await graphQLClient.mutate(options);

      if (result.hasException) {
        throw const ServerExceptionError('Mutation create favorite is error!');
      }
      return FavoriteEmployeeModel.fromJson(
          result.data?['addToFavorite'] ?? {});
    } catch (e) {
      throw ServerExceptionError(e.toString());
    }
  }

  @override
  Future<FavoriteEmployeeModel> removeFromFavorite(
      {required String employeeId, required String customerId}) async {
    try {
      final favorite = FavoriteInput(
        employeeId: employeeId,
        customerId: customerId,
      );

      final MutationOptions options = MutationOptions(
        document: gql(EmployeeGraphqlDocuments.removeFromFavoriteMutation),
        variables: {
          'favoriteInput': favorite.toJson(),
        },
        fetchPolicy: FetchPolicy.networkOnly,
      );

      final QueryResult result = await graphQLClient.mutate(options);

      if (result.hasException) {
        throw const ServerExceptionError('Mutation remove favorite is error!');
      }
      return FavoriteEmployeeModel.fromJson(
          result.data?['removeFromFavorite'] ?? {});
    } catch (e) {
      throw ServerExceptionError(e.toString());
    }
  }

  @override
  Future<bool> checkFavoriteInput(
      {required String employeeId, required String customerId}) async {
    try {
      final favoriteInput = FavoriteInput(
        employeeId: employeeId,
        customerId: customerId,
      );

      final QueryOptions options = QueryOptions(
        document: gql(EmployeeGraphqlDocuments.checkFavoriteQuery),
        variables: {
          'favoriteInput': favoriteInput.toJson(),
        },
        fetchPolicy: FetchPolicy.networkOnly,
      );

      final QueryResult result = await graphQLClient.query(options);

      if (result.hasException) {
        throw const ServerExceptionError('Query check fav employee is error!');
      }

      final resultData = result.data?['checkFavorite'] ?? {};
      return resultData;
    } catch (e) {
      throw ServerExceptionError(e.toString());
    }
  }
}
