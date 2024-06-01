part of 'init_dependencies.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  _initAuth();
  _initBookingServices();
  _initAdmin();

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

void _initAdmin() {
  // Datasource
  serviceLocator
    ..registerFactory<AccountRemoteDataSource>(
      () => AccountRemoteDataSourceImpl(
        serviceLocator(),
      ),
    )
    // Repository
    ..registerFactory<AccountRepository>(
      () => AccountRepositoryImpl(
        serviceLocator(),
      ),
    )
    // Usecases
    ..registerFactory(
      () => GetAllAccounts(serviceLocator()),
    )
    // Bloc
    ..registerLazySingleton(
      () => AdminBloc(
        getAllAccounts: serviceLocator(),
      ),
    );
}

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
      () => AccountSignUp(serviceLocator()),
    )
    ..registerFactory(
      () => AccountLogin(serviceLocator()),
    )
    ..registerFactory(
      () => AccountSignOut(serviceLocator()),
    )
    ..registerFactory(
      () => CurrentAccountInfo(serviceLocator()),
    )
    // Bloc
    ..registerLazySingleton(
      () => AuthBloc(
        accountSignUp: serviceLocator(),
        accountLogin: serviceLocator(),
        currentAccountInfo: serviceLocator(),
        appAccountCubit: serviceLocator(),
        accountSignOut: serviceLocator(),
      ),
    );
}

void _initBookingServices() {
  // Datasource
  serviceLocator
    ..registerFactory<ServicesRemoteDataSource>(
      () => ServicesRemoteDataSourceImpl(serviceLocator()),
    )
    ..registerFactory<EmployeesRemoteDataSource>(
      () => EmployeesRemoteDataSourceImpl(serviceLocator()),
    )
    ..registerFactory<BookingRemoteDataSource>(
      () => BookingRemoteDataSourceImpl(serviceLocator()),
    )
    ..registerFactory<AddressRemoteDataSource>(
      () => AddressRemoteDataSourceImpl(serviceLocator()),
    )
    // Repository
    ..registerFactory<BookingRepository>(
      () => BookingRepositoryImpl(
        serviceLocator(),
        serviceLocator(),
        serviceLocator(),
        serviceLocator(),
      ),
    )
    // Usecases
    ..registerFactory(
      () => GetAllServices(serviceLocator()),
    )
    ..registerFactory(
      () => GetTopEmployees(serviceLocator()),
    )
    ..registerFactory(
      () => GetAllEmployees(serviceLocator()),
    )
    ..registerFactory(
      () => GetServiceById(serviceLocator()),
    )
    ..registerFactory(
      () => CreateBooking(serviceLocator()),
    )
    ..registerFactory(
      () => CreateCustomerAddress(serviceLocator()),
    )
    // Bloc
    ..registerLazySingleton(
      () => BookingBloc(
        getAllServices: serviceLocator(),
        getTopEmployees: serviceLocator(),
        getAllEmployees: serviceLocator(),
        currentAccountInfo: serviceLocator(),
        getServiceById: serviceLocator(),
        createBooking: serviceLocator(),
        createCustomerAddress: serviceLocator(),
      ),
    );
}
