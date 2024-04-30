import 'package:house_helper_rental_application/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:house_helper_rental_application/core/network/connection_checker.dart';
import 'package:house_helper_rental_application/core/secrets/app_secrets.dart';
import 'package:house_helper_rental_application/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:house_helper_rental_application/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:house_helper_rental_application/features/auth/domain/repository/auth_repository.dart';
import 'package:house_helper_rental_application/features/auth/domain/usecases/current_user.dart';
import 'package:house_helper_rental_application/features/auth/domain/usecases/user_login.dart';
import 'package:house_helper_rental_application/features/auth/domain/usecases/user_sign_up.dart';
import 'package:house_helper_rental_application/features/auth/presentation/bloc/auth_bloc.dart';

import 'package:get_it/get_it.dart';
import 'package:house_helper_rental_application/features/booking/data/datasources/employees_remote_data_source.dart';
import 'package:house_helper_rental_application/features/booking/data/datasources/services_remote_data_source.dart';
import 'package:house_helper_rental_application/features/booking/data/repositories/booking_repository_impl.dart';
import 'package:house_helper_rental_application/features/booking/domain/repository/booking_repository.dart';
import 'package:house_helper_rental_application/features/booking/domain/usecases/get_all_employees.dart';
import 'package:house_helper_rental_application/features/booking/domain/usecases/get_all_services.dart';
import 'package:house_helper_rental_application/features/booking/domain/usecases/get_top_employees.dart';
import 'package:house_helper_rental_application/features/booking/presentation/bloc/booking_bloc.dart';
//import 'package:hive/hive.dart';
import 'package:house_helper_rental_application/features/bottom_nav/cubit/nav_booking_cubit.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
//import 'package:path_provider/path_provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'init_dependencies.main.dart';
