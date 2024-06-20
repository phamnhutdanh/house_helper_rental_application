import 'dart:io';

import 'package:house_helper_rental_application/features/auth/domain/usecases/update_info_customer.dart';
import 'package:house_helper_rental_application/features/auth/presentation/cubits/app_user/app_account_cubit.dart';
import 'package:house_helper_rental_application/core/common/entities/account_info.dart';
import 'package:house_helper_rental_application/core/usecase/usecase.dart';
import 'package:house_helper_rental_application/features/auth/domain/usecases/account_sign_out.dart';
import 'package:house_helper_rental_application/features/auth/domain/usecases/current_account_info.dart';
import 'package:house_helper_rental_application/features/auth/domain/usecases/account_login.dart';
import 'package:house_helper_rental_application/features/auth/domain/usecases/account_sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AccountSignUp _accountSignUp;
  final AccountLogin _accountLogin;
  final AccountSignOut _accountSignOut;
  final CurrentAccountInfo _currentAccountInfo;
  final AppAccountCubit _appUserCubit;
  final UpdateInfoCustomer _updateInfoCustomer;
  AuthBloc({
    required AccountSignUp accountSignUp,
    required AccountLogin accountLogin,
    required AccountSignOut accountSignOut,
    required CurrentAccountInfo currentAccountInfo,
    required AppAccountCubit appAccountCubit,
    required UpdateInfoCustomer updateInfoCustomer,
  })  : _accountSignUp = accountSignUp,
        _accountLogin = accountLogin,
        _accountSignOut = accountSignOut,
        _currentAccountInfo = currentAccountInfo,
        _appUserCubit = appAccountCubit,
        _updateInfoCustomer = updateInfoCustomer,
        super(AuthInitial()) {
    on<AuthEvent>((_, emit) => emit(AuthLoading()));
    on<AuthSignUp>(_onAuthSignUp);
    on<AuthLogin>(_onAuthLogin);
    on<AuthSignOut>(_onAuthSignOut);
    on<AuthIsAccountLoggedIn>(_isUserLoggedIn);
    on<UpdateInfoCustomerEvent>(_onUpdateCustomerInfo);
  }

  void _onUpdateCustomerInfo(
    UpdateInfoCustomerEvent event,
    Emitter<AuthState> emit,
  ) async {
    final res = await _updateInfoCustomer.call(UpdateInfoCustomerParams(
      customerId: event.customerId,
      phone: event.phone,
      image: event.image,
      name: event.name,
    ));

    res.fold(
      (failure) => emit(AuthFailure(failure.message)),
      (accountInfo) => _emitAuthSuccess(accountInfo, emit),
    );
  }

  void _isUserLoggedIn(
    AuthIsAccountLoggedIn event,
    Emitter<AuthState> emit,
  ) async {
    final res = await _currentAccountInfo.call(NoParams());

    res.fold(
      (failure) => emit(AuthFailure(failure.message)),
      (user) => _emitAuthSuccess(user, emit),
    );
  }

  void _onAuthSignOut(
    AuthSignOut event,
    Emitter<AuthState> emit,
  ) async {
    final res = await _accountSignOut.call(NoParams());

    res.fold(
      (failure) => emit(AuthFailure(failure.message)),
      (success) => emit(AuthInitial()),
    );
  }

  void _onAuthSignUp(
    AuthSignUp event,
    Emitter<AuthState> emit,
  ) async {
    final res = await _accountSignUp.call(
      AccountSignUpParams(
        isEmployee: event.isEmployee,
        email: event.email,
        password: event.password,
        name: event.name,
      ),
    );

    res.fold(
      (failure) => emit(AuthFailure(failure.message)),
      (accountInfo) => _emitAuthSuccess(accountInfo, emit),
    );
  }

  void _onAuthLogin(
    AuthLogin event,
    Emitter<AuthState> emit,
  ) async {
    final res = await _accountLogin.call(
      AccountLoginParams(
        email: event.email,
        password: event.password,
      ),
    );

    res.fold(
      (failure) => emit(AuthFailure(failure.message)),
      (accountInfo) => _emitAuthSuccess(accountInfo, emit),
    );
  }

  void _emitAuthSuccess(
    AccountInfo accountInfo,
    Emitter<AuthState> emit,
  ) {
    _appUserCubit.updateAccount(accountInfo);
    emit(AuthSuccess(accountInfo));
  }
}
