import 'package:house_helper_rental_application/core/common/cubits/app_user/app_account_cubit.dart';
import 'package:house_helper_rental_application/core/common/entities/account_info.dart';
import 'package:house_helper_rental_application/core/usecase/usecase.dart';
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
  final CurrentAccountInfo _currentAccountInfo;
  final AppAccountCubit _appUserCubit;
  AuthBloc({
    required AccountSignUp accountSignUp,
    required AccountLogin accountLogin,
    required CurrentAccountInfo currentAccountInfo,
    required AppAccountCubit appAccountCubit,
  })  : _accountSignUp = accountSignUp,
        _accountLogin = accountLogin,
        _currentAccountInfo = currentAccountInfo,
        _appUserCubit = appAccountCubit,
        super(AuthInitial()) {
    on<AuthEvent>((_, emit) => emit(AuthLoading()));
    on<AuthSignUp>(_onAuthSignUp);
    on<AuthLogin>(_onAuthLogin);
    on<AuthIsAccountLoggedIn>(_isUserLoggedIn);
  }

  void _isUserLoggedIn(
    AuthIsAccountLoggedIn event,
    Emitter<AuthState> emit,
  ) async {
    final res = await _currentAccountInfo(NoParams());

    res.fold(
      (failure) => emit(AuthFailure(failure.message)),
      (user) => _emitAuthSuccess(user, emit),
    );
  }

  void _onAuthSignUp(
    AuthSignUp event,
    Emitter<AuthState> emit,
  ) async {
    final res = await _accountSignUp(
      AccountSignUpParams(
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
    final res = await _accountLogin(
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
