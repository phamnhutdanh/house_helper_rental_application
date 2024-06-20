part of 'init_dependencies.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  _initAuth();
  _initBooking();
  _initAccounts();
  _initAddress();
  _initEmployees();
  _initServices();

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

void _initAccounts() {
  // Datasource
  serviceLocator
    ..registerFactory<AccountsRemoteDataSource>(
      () => AccountRemoteDataSourceImpl(
        serviceLocator(),
      ),
    )
    // Repository
    ..registerFactory<AccountsRepository>(
      () => AccountsRepositoryImpl(
        serviceLocator(),
      ),
    )
    // Usecases
    ..registerFactory(
      () => GetAllAccounts(serviceLocator()),
    )
    // Bloc
    ..registerLazySingleton(
      () => AccountsBloc(
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
    ..registerFactory(
      () => UpdateInfoCustomer(serviceLocator()),
    )
    ..registerFactory(
      () => ChangeNotiStatus(serviceLocator()),
    )
    ..registerFactory(
      () => GetAllNoti(serviceLocator()),
    )
    // Bloc
    ..registerLazySingleton(
      () => AuthBloc(
        accountSignUp: serviceLocator(),
        accountLogin: serviceLocator(),
        currentAccountInfo: serviceLocator(),
        appAccountCubit: serviceLocator(),
        accountSignOut: serviceLocator(),
        updateInfoCustomer: serviceLocator(),
      ),
    )
    ..registerLazySingleton(
      () => NotiBloc(
        changeNotiStatus: serviceLocator(),
        getAllNoti: serviceLocator(),
      ),
    );
}

void _initAddress() {
  // Datasource
  serviceLocator
    ..registerFactory<AddressRemoteDataSource>(
      () => AddressRemoteDataSourceImpl(serviceLocator()),
    )
    // Repository
    ..registerFactory<AddressRepository>(
      () => AddressRepositoryImpl(
        serviceLocator(),
      ),
    )
    // Usecases
    ..registerFactory(
      () => CreateCustomerAddress(serviceLocator()),
    )
    ..registerFactory(
      () => GetAllAddressOfCustomer(serviceLocator()),
    )
    ..registerFactory(
      () => GetCustomerAddressById(serviceLocator()),
    )
    ..registerFactory(
      () => RemoveCustomerAddress(serviceLocator()),
    )
    // Bloc
    ..registerLazySingleton(
      () => AddressBloc(
        createCustomerAddress: serviceLocator(),
        getAllAddressOfCustomer: serviceLocator(),
        getCustomerAddressById: serviceLocator(),
        removeCustomerAddress: serviceLocator(),
      ),
    );
}

void _initEmployees() {
  // Datasource
  serviceLocator
    ..registerFactory<EmployeesRemoteDataSource>(
      () => EmployeesRemoteDataSourceImpl(serviceLocator()),
    )
    // Repository
    ..registerFactory<EmployeeRepository>(
      () => EmployeeRepositoryImpl(
        serviceLocator(),
      ),
    )
    // Usecases
    ..registerFactory(
      () => GetTopEmployees(serviceLocator()),
    )
    ..registerFactory(
      () => CreateRatingEmployee(serviceLocator()),
    )
    ..registerFactory(
      () => GetEmployeeById(serviceLocator()),
    )
    ..registerFactory(
      () => AddToFavorite(serviceLocator()),
    )
    ..registerFactory(
      () => RemoveFromFavorite(serviceLocator()),
    )
    ..registerFactory(
      () => GetFavoriteEmployeesOfCustomer(serviceLocator()),
    )
    ..registerFactory(
      () => CheckFavorite(serviceLocator()),
    )
    // Bloc
    ..registerLazySingleton(
      () => EmployeeBloc(
        getTopEmployees: serviceLocator(),
        getEmployeeById: serviceLocator(),
      ),
    )
    ..registerLazySingleton(
      () => RatingBloc(
        createRatingEmployee: serviceLocator(),
      ),
    )
    ..registerLazySingleton(
      () => FavoriteEmployeeBloc(
        addToFavorite: serviceLocator(),
        removeFromFavorite: serviceLocator(),
        getEmployeeById: serviceLocator(),
        getFavoriteEmployeesOfCustomer: serviceLocator(),
        checkFavorite: serviceLocator(),
      ),
    );
}

void _initServices() {
  // Datasource
  serviceLocator
    ..registerFactory<ServicesRemoteDataSource>(
      () => ServicesRemoteDataSourceImpl(serviceLocator()),
    )
    // Repository
    ..registerFactory<ServiceRepository>(
      () => ServiceRepositoryImpl(
        serviceLocator(),
      ),
    )
    // Usecases
    ..registerFactory(
      () => GetAllServices(serviceLocator()),
    )
    ..registerFactory(
      () => GetServiceById(serviceLocator()),
    )
    // Bloc
    ..registerLazySingleton(
      () => ServiceBloc(
        getAllServices: serviceLocator(),
        getServiceById: serviceLocator(),
      ),
    );
}

void _initBooking() {
  // Datasource
  serviceLocator
    ..registerFactory<BookingRemoteDataSource>(
      () => BookingRemoteDataSourceImpl(serviceLocator()),
    )
    // Repository
    ..registerFactory<BookingRepository>(
      () => BookingRepositoryImpl(
        serviceLocator(),
      ),
    )
    // Usecases
    ..registerFactory(
      () => CreateBooking(serviceLocator()),
    )
    ..registerFactory(
      () => GetAllBookingOfCustomer(serviceLocator()),
    )
    ..registerFactory(
      () => GetBookingById(serviceLocator()),
    )
    ..registerFactory(
      () => ChangeBookingStatus(serviceLocator()),
    )
    // Bloc
    ..registerLazySingleton(
      () => BookingBloc(
        createBooking: serviceLocator(),
        getBookingById: serviceLocator(),
        getAllBookingOfCustomer: serviceLocator(),
        changeBookingStatus: serviceLocator(),
      ),
    );
}
