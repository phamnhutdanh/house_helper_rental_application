import 'package:house_helper_rental_application/core/common/cubits/app_user/app_account_cubit.dart';
import 'package:house_helper_rental_application/core/theme/theme.dart';
import 'package:house_helper_rental_application/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:house_helper_rental_application/features/auth/presentation/pages/login_page.dart';
import 'package:house_helper_rental_application/features/booking/presentation/bloc/booking_bloc.dart';
import 'package:house_helper_rental_application/core/routers/customer_app/main_router.dart';
import 'package:house_helper_rental_application/init_dependencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    ],
    child: const MyApp(),
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
      home: BlocSelector<AppAccountCubit, AppAccountState, bool>(
        selector: (state) {
          return state is AppAccountLoggedIn;
        },
        builder: (context, isLoggedIn) {
          if (isLoggedIn) {
            return MainRouter();
          }
          return MainRouter();
          //return const LoginPage();
        },
      ),
    );
  }
}
