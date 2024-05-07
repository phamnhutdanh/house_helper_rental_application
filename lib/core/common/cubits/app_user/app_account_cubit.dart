
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:house_helper_rental_application/core/common/entities/account_info.dart';

part 'app_account_state.dart';

class AppAccountCubit extends Cubit<AppAccountState> {
  AppAccountCubit() : super(AppAccountInitial());

  void updateAccount(AccountInfo? accountInfo) {
    if (accountInfo == null) {
      emit(AppAccountInitial());
    } else {
      emit(AppAccountLoggedIn(accountInfo));
    }
  }
}
