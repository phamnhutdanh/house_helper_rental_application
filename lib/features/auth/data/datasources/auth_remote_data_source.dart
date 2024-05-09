import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:house_helper_rental_application/core/error/exceptions.dart';
import 'package:house_helper_rental_application/features/auth/data/datasources/graphql_documents.dart';
import 'package:house_helper_rental_application/features/auth/data/models/account_info_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class AuthRemoteDataSource {
  Session? get currentUserSession;
  Future<AccountInfoModel> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  });
  Future<AccountInfoModel> loginWithEmailPassword({
    required String email,
    required String password,
  });
  Future<AccountInfoModel?> getCurrentAccountInfoData();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final SupabaseClient supabaseClient;
  final GraphQLClient graphQLClient;

  AuthRemoteDataSourceImpl(this.supabaseClient, this.graphQLClient);

  @override
  Session? get currentUserSession => supabaseClient.auth.currentSession;

  @override
  Future<AccountInfoModel> loginWithEmailPassword({
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
      return AccountInfoModel.fromJson(response.user!.toJson());
    } on AuthException catch (e) {
      throw ServerExceptionError(e.message);
    } catch (e) {
      throw ServerExceptionError(e.toString());
    }
  }

  @override
  Future<AccountInfoModel> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
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

      final customerInput =
          CreateCustomerAccountInput(email: email, name: name);
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

      final MutationOptions options = MutationOptions(
          document: gql(AuthGraphqlDocuments.createCustomerAccountMutation),
          variables: {
            'createCustomerAccountInput': customerInput.toJson(),
            'createSessionInput': sessionInput.toJson()
          });

      final QueryResult result = await graphQLClient.mutate(options);

      if (result.hasException) {
        throw const ServerExceptionError('Mutation is error!');
      }
      return AccountInfoModel.fromJson(result.data ?? {});
    } on AuthException catch (e) {
      throw ServerExceptionError(e.message);
    } catch (e) {
      throw ServerExceptionError(e.toString());
    }
  }

  @override
  Future<AccountInfoModel?> getCurrentAccountInfoData() async {
    try {
      if (currentUserSession != null) {
        // final userData = await supabaseClient.from('profiles').select().eq(
        //       'id',
        //       currentUserSession!.user.id,
        //     );

        String query = """
          query GetAllAccountInfos {
            getAllAccountInfos {
              id
              email
              role
              createdAt
              updatedAt
              status
            }
          }
        """;

        // final addStarMutation = useMutation(
        //   MutationOptions(
        //     document:
        //         gql(addStar), // this is the mutation string you just created
        //     // you can update the cache based on results
        //     update: (cache,  result) {
        //       return cache;
        //     },
        //     variables: {
        //       'input': 'dasda'
        //     },
        //     // or do something with the result.data on completion
        //     onCompleted: (dynamic resultData) {
        //       print(resultData);
        //     },
        //   ),
        // );

        // ...
        final readResult = useQuery(
          QueryOptions(
            document: gql(query),
            variables: {},
            pollInterval: const Duration(seconds: 10),
          ),
        );
        final result = readResult.result;

        if (result.hasException) {
          throw const ServerExceptionError('Error!');
        }

        if (result.isLoading) {}

        return AccountInfoModel.fromJson(
                result.data?['GetAllAccountInfos']?['getAllAccountInfos'])
            .copyWith(
          email: currentUserSession!.user.email,
        );
      }

      return null;
    } catch (e) {
      throw ServerExceptionError(e.toString());
    }
  }
}
