import 'package:bloc/bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:house_helper_rental_application/core/common/entities/account_info.dart';
import 'package:house_helper_rental_application/core/usecase/usecase.dart';
import 'package:house_helper_rental_application/features/admin/domain/usecases/get_all_accounts.dart';
import 'package:meta/meta.dart';

part 'admin_event.dart';
part 'admin_state.dart';

class AdminBloc extends Bloc<AdminEvent, AdminState> {
  final GetAllAccounts _getAllAccounts;

  AdminBloc({
    required GetAllAccounts getAllAccounts,
  })  : _getAllAccounts = getAllAccounts,
        super(AdminInitial()) {
    on<AdminEvent>((event, emit) => emit(AdminLoading()));
    on<AdminFetchAllAccountData>(_onFetchAccounts);
  }

  void _onFetchAccounts(
    AdminFetchAllAccountData event,
    Emitter<AdminState> emit,
  ) async {
    final accounts = await _getAllAccounts.call(NoParams());

    if (accounts.isRight()) {
      emit(AccountsDisplaySuccess(
        accounts.getRight().getOrElse(() => throw UnimplementedError()),
      ));
    } else {
      emit(AdminFailure("Error fetch all accounts data"));
    }
  }
}
