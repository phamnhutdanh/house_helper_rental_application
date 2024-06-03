import 'package:bloc/bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:house_helper_rental_application/core/common/entities/account_info.dart';
import 'package:house_helper_rental_application/core/usecase/usecase.dart';
import 'package:house_helper_rental_application/features/accounts/domain/usecases/get_all_accounts.dart';
import 'package:meta/meta.dart';

part 'accounts_event.dart';
part 'accounts_state.dart';

class AccountsBloc extends Bloc<AccountsEvent, AccountsState> {
  final GetAllAccounts _getAllAccounts;

  AccountsBloc({
    required GetAllAccounts getAllAccounts,
  })  : _getAllAccounts = getAllAccounts,
        super(AccountsInitial()) {
    on<AccountsEvent>((event, emit) => emit(AccountsLoading()));
    on<FetchAllAccountData>(_onFetchAccounts);
  }

  void _onFetchAccounts(
    FetchAllAccountData event,
    Emitter<AccountsState> emit,
  ) async {
    final accounts = await _getAllAccounts.call(NoParams());

    if (accounts.isRight()) {
      emit(AccountsDisplaySuccess(
        accounts.getRight().getOrElse(() => throw UnimplementedError()),
      ));
    } else {
      emit(AccountsFailure("Error fetch all accounts data"));
    }
  }
}
