import 'dart:io';

import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:house_helper_rental_application/core/common/entities/enum_type.dart';
import 'package:house_helper_rental_application/core/error/exceptions.dart';
import 'package:house_helper_rental_application/features/auth/data/datasources/auth_graphql_documents.dart';
import 'package:house_helper_rental_application/features/auth/data/models/account_model.dart';
import 'package:house_helper_rental_application/features/auth/data/models/notification_account_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class AuthRemoteDataSource {
  Session? get currentUserSession;
  Future<AccountModel> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
    required bool isEmployee,
  });
  Future<AccountModel> loginWithEmailPassword({
    required String email,
    required String password,
  });
  Future<AccountModel?> getCurrentAccountInfoData();
  Future<void> signOut();

  Future<AccountModel> updateInfoCustomer({
    required String imageUri,
    required String name,
    required String phone,
    required String customerId,
  });

  Future<String> uploadImage({
    required File image,
  });

  Future<List<NotificationAccountModel>> getAllNotification({
    required String accountId,
  });

  Future<NotificationAccountModel> changeNotificationStatus({
    required String id,
    required String status,
  });

  Future<AccountModel> updateAccountStatus({
    required String accountId,
    required AccountStatus status,
  });

  Future<AccountModel> updateInfoEmployee({
    required String imageUri,
    required String name,
    required String phone,
    required String employeeId,
    required String description,
  });
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final SupabaseClient supabaseClient;
  final GraphQLClient graphQLClient;

  AuthRemoteDataSourceImpl(this.supabaseClient, this.graphQLClient);

  @override
  Session? get currentUserSession => supabaseClient.auth.currentSession;

  @override
  Future<AccountModel> loginWithEmailPassword({
    required String email,
    required String password,
  }) async {
    try {
      final response = await supabaseClient.auth.signInWithPassword(
        password: password,
        email: email,
      );
      if (response.user == null) {
        throw const ServerExceptionError('User is null!');
      }

      final QueryOptions options = QueryOptions(
        document: gql(AuthGraphqlDocuments.getAccountInfoByIdQuery),
        variables: {
          'id': response.user?.id ?? '',
        },
        fetchPolicy: FetchPolicy.networkOnly,
      );

      final QueryResult result = await graphQLClient.query(options);

      if (result.hasException) {
        throw const ServerExceptionError(
            'Query login with email and password is error!');
      }

      return AccountModel.fromJson(result.data?['getAccountInfoById'] ?? {});
    } on AuthException catch (e) {
      throw ServerExceptionError(e.message);
    } catch (e) {
      throw ServerExceptionError(e.toString());
    }
  }

  @override
  Future<AccountModel> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
    required bool isEmployee,
  }) async {
    try {
      final response = await supabaseClient.auth.signUp(
        password: password,
        email: email,
        data: {
          'name': name,
        },
      );

      if (response.user == null) {
        throw const ServerExceptionError('User is null!');
      }

      final sessionInput = CreateSessionInput(
          sessionToken: response.session?.accessToken ?? '',
          expires: '2024-05-08T03:13:57.182Z',
          accessToken: response.session?.accessToken ?? '',
          expiresAt: response.session?.expiresAt ?? 0,
          expiresIn: response.session?.expiresIn ?? 0,
          isExpired: response.session?.isExpired ?? false,
          providerRefreshToken: response.session?.providerRefreshToken ?? '',
          providerToken: response.session?.providerToken ?? '',
          refreshToken: response.session?.refreshToken ?? '',
          tokenType: response.session?.tokenType ?? '');

      final accountInput = CreateAccountInput(
          email: email,
          name: name,
          accountId: response.user?.id ?? '',
          isEmployee: isEmployee);
      final MutationOptions options = MutationOptions(
        document: gql(AuthGraphqlDocuments.createAccountMutation),
        variables: {
          'createAccountInput': accountInput.toJson(),
          'createSessionInput': sessionInput.toJson()
        },
        fetchPolicy: FetchPolicy.networkOnly,
      );

      final QueryResult result = await graphQLClient.mutate(options);

      if (result.hasException) {
        throw const ServerExceptionError(
            'Mutation sign up with email and password is error!');
      }
      return AccountModel.fromJson(result.data?['createAccount'] ?? {});
    } on AuthException catch (e) {
      throw ServerExceptionError(e.message);
    } catch (e) {
      throw ServerExceptionError(e.toString());
    }
  }

  @override
  Future<AccountModel?> getCurrentAccountInfoData() async {
    try {
      if (currentUserSession != null) {
        final QueryOptions options = QueryOptions(
          document: gql(AuthGraphqlDocuments.getAccountInfoByIdQuery),
          variables: {
            'id': currentUserSession?.user.id ?? '',
          },
          fetchPolicy: FetchPolicy.networkOnly,
        );

        final QueryResult result = await graphQLClient.query(options);

        if (result.hasException) {
          throw const ServerExceptionError(
              'Query get current info account data is error!');
        }
        return AccountModel.fromJson(result.data?['getAccountInfoById'] ?? {});
      }
      return null;
    } catch (e) {
      throw ServerExceptionError(e.toString());
    }
  }

  @override
  Future<void> signOut() async {
    try {
      return await supabaseClient.auth.signOut();
    } catch (e) {
      throw ServerExceptionError(e.toString());
    }
  }

  @override
  Future<AccountModel> updateInfoCustomer(
      {required String imageUri,
      required String name,
      required String phone,
      required String customerId}) async {
    try {
      final accountInput = UpdateCustomerInput(
        name: name,
        phone: phone,
        imageUri: imageUri,
        customerId: customerId,
      );

      final MutationOptions options = MutationOptions(
        document: gql(AuthGraphqlDocuments.updateCustomerInfoMutation),
        variables: {
          'updateCustomerInput': accountInput.toJson(),
        },
        fetchPolicy: FetchPolicy.networkOnly,
      );

      final QueryResult result = await graphQLClient.mutate(options);

      if (result.hasException) {
        throw const ServerExceptionError('Mutation update is error!');
      }
      return AccountModel.fromJson(result.data?['updateCustomerInfo'] ?? {});
    } catch (e) {
      throw ServerExceptionError(e.toString());
    }
  }

  @override
  Future<String> uploadImage({required File image}) async {
    try {
      final timestamp = DateTime.now().millisecondsSinceEpoch;
      await supabaseClient.storage.from('helpu_buckets').upload(
            timestamp.toString(),
            image,
          );

      return supabaseClient.storage.from('helpu_buckets').getPublicUrl(
            timestamp.toString(),
          );
    } on StorageException catch (e) {
      throw ServerExceptionError(e.message);
    } catch (e) {
      throw ServerExceptionError(e.toString());
    }
  }

  @override
  Future<NotificationAccountModel> changeNotificationStatus(
      {required String id, required String status}) async {
    try {
      final input = ChangeNotiInput(
        id: id,
        status: status,
      );

      final MutationOptions options = MutationOptions(
        document: gql(AuthGraphqlDocuments.changeNotiStatusMutation),
        variables: {
          'changeNotiInput': input.toJson(),
        },
        fetchPolicy: FetchPolicy.networkOnly,
      );

      final QueryResult result = await graphQLClient.mutate(options);

      if (result.hasException) {
        throw const ServerExceptionError('Mutation change status is error!');
      }
      return NotificationAccountModel.fromJson(
          result.data?['changeNotiStatus'] ?? {});
    } catch (e) {
      throw ServerExceptionError(e.toString());
    }
  }

  @override
  Future<List<NotificationAccountModel>> getAllNotification(
      {required String accountId}) async {
    try {
      final QueryOptions options = QueryOptions(
        document: gql(AuthGraphqlDocuments.getNotificationOfAccountQuery),
        variables: {
          'accountId': accountId,
        },
        fetchPolicy: FetchPolicy.networkOnly,
      );

      final QueryResult result = await graphQLClient.query(options);

      if (result.hasException) {
        throw const ServerExceptionError('Query get noti data is error!');
      }
      final resultData =
          result.data?['getNotificationOfAccount'] as List<dynamic>;
      return resultData
          .map((noti) => NotificationAccountModel.fromJson(noti))
          .toList();
    } catch (e) {
      throw ServerExceptionError(e.toString());
    }
  }

  @override
  Future<AccountModel> updateAccountStatus(
      {required String accountId, required AccountStatus status}) async {
    try {
      final input = AccountStatusInput(
        accountId: accountId,
        status: status,
      );

      final MutationOptions options = MutationOptions(
        document: gql(AuthGraphqlDocuments.updateAccountStatusMutation),
        variables: {
          'accountStatusInput': input.toJson(),
        },
        fetchPolicy: FetchPolicy.networkOnly,
      );

      final QueryResult result = await graphQLClient.mutate(options);

      if (result.hasException) {
        throw const ServerExceptionError('Mutation change status is error!');
      }
      return AccountModel.fromJson(result.data?['updateAccountStatus'] ?? {});
    } catch (e) {
      throw ServerExceptionError(e.toString());
    }
  }

  @override
  Future<AccountModel> updateInfoEmployee(
      {required String imageUri,
      required String name,
      required String phone,
      required String employeeId,
      required String description}) async {
    try {
      final accountInput = UpdateEmployeeInput(
        name: name,
        phone: phone,
        imageUri: imageUri,
        employeeId: employeeId,
        description: description,
      );

      final MutationOptions options = MutationOptions(
        document: gql(AuthGraphqlDocuments.updateEmployeeInfoMutation),
        variables: {
          'updateEmployeeInput': accountInput.toJson(),
        },
        fetchPolicy: FetchPolicy.networkOnly,
      );

      final QueryResult result = await graphQLClient.mutate(options);

      if (result.hasException) {
        throw const ServerExceptionError('Mutation update is error!');
      }
      return AccountModel.fromJson(result.data?['updateEmployeeInfo'] ?? {});
    } catch (e) {
      throw ServerExceptionError(e.toString());
    }
  }
}
