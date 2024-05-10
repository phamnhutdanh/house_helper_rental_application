part of 'init_dependencies.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  _initAuth();
  _initBookingServices();

  final supabase = await Supabase.initialize(
    url: AppSecrets.supabaseUrl,
    anonKey: AppSecrets.supabaseAnonKey,
  );
  serviceLocator.registerLazySingleton(() => supabase.client);

  await initHiveForFlutter();
  final GraphQLClient graphQLClient = GraphQLClient(
    link: HttpLink(AppSecrets.linkDeploy),
    cache: GraphQLCache(store: HiveStore()),
  );
  serviceLocator.registerLazySingleton(() => graphQLClient);

  serviceLocator.registerFactory(() => InternetConnection());
  // core
  serviceLocator.registerLazySingleton(
    () => AppAccountCubit(),
  );
  serviceLocator.registerFactory<ConnectionChecker>(
    () => ConnectionCheckerImpl(
      serviceLocator(),
    ),
  );
}

// void _initHive() async {
//   final defaultDirectory = (await getApplicationDocumentsDirectory()).path;
//   Hive.init(defaultDirectory);
//   serviceLocator.registerLazySingleton(
//     () => Hive.box('house_help'),
//   );
// }

void _initAuth() {
  // Datasource
  serviceLocator
    ..registerFactory<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(
        serviceLocator(),
        serviceLocator(),
      ),
    )
    // Repository
    ..registerFactory<AuthRepository>(
      () => AuthRepositoryImpl(
        serviceLocator(),
        serviceLocator(),
      ),
    )

    // Usecases
    ..registerFactory(
      () => AccountSignUp(
        serviceLocator(),
      ),
    )
    ..registerFactory(
      () => AccountLogin(
        serviceLocator(),
      ),
    )
    ..registerFactory(
      () => CurrentAccountInfo(
        serviceLocator(),
      ),
    )
    // Bloc
    ..registerLazySingleton(
      () => AuthBloc(
        accountSignUp: serviceLocator(),
        accountLogin: serviceLocator(),
        currentAccountInfo: serviceLocator(),
        appAccountCubit: serviceLocator(),
      ),
    );
}

void _initBookingServices() {
  // Datasource
  serviceLocator
    ..registerFactory<ServicesRemoteDataSource>(
      () => ServicesRemoteDataSourceImpl(
        serviceLocator(),
      ),
    )
    ..registerFactory<EmployeesRemoteDataSource>(
      () => EmployeesRemoteDataSourceImpl(
        serviceLocator(),
      ),
    )
    // Repository
    ..registerFactory<BookingRepository>(
      () => BookingRepositoryImpl(
        serviceLocator(),
        serviceLocator(),
      ),
    )
    // Usecases
    ..registerFactory(
      () => GetAllServices(
        serviceLocator(),
      ),
    )
    ..registerFactory(
      () => GetTopEmployees(
        serviceLocator(),
      ),
    )
    ..registerFactory(
      () => GetAllEmployees(
        serviceLocator(),
      ),
    )
    // Bloc
    ..registerLazySingleton(
      () => BookingBloc(
          getAllServices: serviceLocator(),
          getTopEmployees: serviceLocator(),
          getAllEmployees: serviceLocator()),
    );
}
