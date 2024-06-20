import 'package:bloc/bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:house_helper_rental_application/core/common/entities/account_info.dart';
import 'package:house_helper_rental_application/core/usecase/usecase.dart';
import 'package:house_helper_rental_application/features/accounts/domain/usecases/get_account_by_id.dart';
import 'package:house_helper_rental_application/features/accounts/domain/usecases/get_all_accounts.dart';
import 'package:meta/meta.dart';

part 'accounts_event.dart';
part 'accounts_state.dart';

class AccountsBloc extends Bloc<AccountsEvent, AccountsState> {
  final GetAllAccounts _getAllAccounts;
  final GetAccountById _getAccountById;

  AccountsBloc({
    required GetAllAccounts getAllAccounts,
    required GetAccountById getAccountById,
  })  : _getAllAccounts = getAllAccounts,
        _getAccountById = getAccountById,
        super(AccountsInitial()) {
    on<AccountsEvent>((event, emit) => emit(AccountsLoading()));
    on<FetchAllAccountData>(_onFetchAccounts);
    on<GetAccountByIdEvent>(_onGetAccountById);
  }

  void _onGetAccountById(
    GetAccountByIdEvent event,
    Emitter<AccountsState> emit,
  ) async {
    final account =
        await _getAccountById.call(GetAccountByIdParams(id: event.id));

    if (account.isRight()) {
      emit(GetAccountByIdSuccess(
        account.getRight().getOrElse(() => throw UnimplementedError()),
      ));
    } else {
      emit(AccountsFailure("Error fetch account data"));
    }
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
