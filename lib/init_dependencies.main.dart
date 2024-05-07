part of 'init_dependencies.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  _initAuth();
  _initBookingServices();
  final supabase = await Supabase.initialize(
    url: AppSecrets.supabaseUrl,
    anonKey: AppSecrets.supabaseAnonKey,
  );

  //Hive.defaultDirectory = (await getApplicationDocumentsDirectory()).path;

  serviceLocator.registerLazySingleton(() => supabase.client);

  // serviceLocator.registerLazySingleton(
  //   () => Hive.box(name: 'blogs'),
  // );

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

void _initAuth() {
  // Datasource
  serviceLocator
    ..registerFactory<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(
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
