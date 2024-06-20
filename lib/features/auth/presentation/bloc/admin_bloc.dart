import 'package:bloc/bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:house_helper_rental_application/core/common/entities/account_info.dart';
import 'package:house_helper_rental_application/core/common/entities/enum_type.dart';
import 'package:house_helper_rental_application/features/auth/domain/usecases/change_account_status.dart';
import 'package:meta/meta.dart';

part 'admin_event.dart';
part 'admin_state.dart';

class AdminBloc extends Bloc<AdminEvent, AdminState> {
  final ChangeAccountStatus _changeAccountStatus;
  AdminBloc({
    required ChangeAccountStatus changeAccountStatus,
  })  : _changeAccountStatus = changeAccountStatus,
        super(AdminInitial()) {
    on<AdminEvent>((_, emit) => emit(AdminLoading()));
    on<ChangeAccountStatusEvent>(_onChangeAccountStatus);
  }

  void _onChangeAccountStatus(
    ChangeAccountStatusEvent event,
    Emitter<AdminState> emit,
  ) async {
    final res = await _changeAccountStatus.call(ChangeAccountStatusParams(
      accountId: event.accountId,
      status: event.status,
    ));

    if (res.isRight()) {
      emit(ChangeAccountStatusSuccess(
        res.getRight().getOrElse(() => throw UnimplementedError()),
      ));
    } else {
      emit(AdminFailure("Error change acc sts"));
    }
  }
}
