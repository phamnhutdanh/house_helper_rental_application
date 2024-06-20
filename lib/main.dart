import 'package:house_helper_rental_application/features/address/presentation/bloc/address_bloc.dart';
import 'package:house_helper_rental_application/features/auth/presentation/bloc/noti_bloc.dart';
import 'package:house_helper_rental_application/features/auth/presentation/cubits/app_user/app_account_cubit.dart';
import 'package:house_helper_rental_application/core/common/entities/enum_type.dart';
import 'package:house_helper_rental_application/core/routers/admin_app/admin_router.dart';
import 'package:house_helper_rental_application/core/routers/employee_app/task_router.dart';
import 'package:house_helper_rental_application/core/theme/theme.dart';
import 'package:house_helper_rental_application/features/accounts/presentation/bloc/accounts_bloc.dart';
import 'package:house_helper_rental_application/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:house_helper_rental_application/features/auth/presentation/pages/login_page.dart';
import 'package:house_helper_rental_application/features/booking/presentation/bloc/booking_bloc.dart';
import 'package:house_helper_rental_application/core/routers/customer_app/booking_router.dart';
import 'package:house_helper_rental_application/features/employees/presentation/bloc/employee_bloc.dart';
import 'package:house_helper_rental_application/features/employees/presentation/bloc/favorite_employee_bloc.dart';
import 'package:house_helper_rental_application/features/employees/presentation/bloc/rating_bloc.dart';
import 'package:house_helper_rental_application/features/services/presentation/bloc/service_bloc.dart';
import 'package:house_helper_rental_application/init_dependencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (_) => serviceLocator<AppAccountCubit>(),
      ),
      BlocProvider(
        create: (_) => serviceLocator<AuthBloc>(),
      ),
      BlocProvider(
        create: (_) => serviceLocator<BookingBloc>(),
      ),
      BlocProvider(
        create: (_) => serviceLocator<AccountsBloc>(),
      ),
      BlocProvider(
        create: (_) => serviceLocator<ServiceBloc>(),
      ),
      BlocProvider(
        create: (_) => serviceLocator<EmployeeBloc>(),
      ),
      BlocProvider(
        create: (_) => serviceLocator<AddressBloc>(),
      ),
      BlocProvider(
        create: (_) => serviceLocator<RatingBloc>(),
      ),
      BlocProvider(
        create: (_) => serviceLocator<FavoriteEmployeeBloc>(),
      ),
      BlocProvider(
        create: (_) => serviceLocator<NotiBloc>(),
      ),
    ],
    child: GraphQLProvider(
        client: ValueNotifier(serviceLocator()),
        child: const CacheProvider(child: MyApp())),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();

    context.read<AuthBloc>().add(AuthIsAccountLoggedIn());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'House Helper Rental App',
      theme: AppTheme.lightThemeMode,
      home: BlocSelector<AppAccountCubit, AppAccountState, AppAccountState>(
        selector: (state) {
          return state;
        },
        builder: (context, state) {
          if (state is AppAccountLoggedIn) {
            if (state.accountInfo.accountRole == AccountInfoRole.CUSTOMER) {
              return BookingRouter();
            } else if (state.accountInfo.accountRole ==
                AccountInfoRole.EMPLOYEE) {
              return TaskRouter();
            } else if (state.accountInfo.accountRole == AccountInfoRole.ADMIN) {
              return AdminRouter();
            } else {
              return const Text('Cannot get role');
            }
          }
          return const LoginPage();
        },
      ),
    );
  }
}
