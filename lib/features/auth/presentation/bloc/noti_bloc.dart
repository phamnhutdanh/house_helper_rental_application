import 'package:bloc/bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:house_helper_rental_application/core/common/entities/notification.dart';
import 'package:house_helper_rental_application/features/auth/domain/usecases/change_noti_status.dart';
import 'package:house_helper_rental_application/features/auth/domain/usecases/get_all_noti.dart';
import 'package:meta/meta.dart';

part 'noti_event.dart';
part 'noti_state.dart';

class NotiBloc extends Bloc<NotiEvent, NotiState> {
  final GetAllNoti _getAllNoti;
  final ChangeNotiStatus _changeNotiStatus;

  NotiBloc({
    required GetAllNoti getAllNoti,
    required ChangeNotiStatus changeNotiStatus,
  })  : _getAllNoti = getAllNoti,
        _changeNotiStatus = changeNotiStatus,
        super(NotiInitial()) {
    on<NotiEvent>((_, emit) => emit(NotiLoading()));
    on<GetAllNotiEvent>(_onGetAllNoti);
    on<ChangeNotiEvent>(_onChangeNoti);
  }
  void _onChangeNoti(
    ChangeNotiEvent event,
    Emitter<NotiState> emit,
  ) async {
    final res = await _changeNotiStatus.call(ChangeNotiParams(
      id: event.id,
      status: event.status,
    ));

    if (res.isRight()) {
      emit(ChangeNotiStatusSuccess(
        res.getRight().getOrElse(() => throw UnimplementedError()),
      ));
    } else {
      emit(NotiFailure("Error change noti sts"));
    }
  }

  void _onGetAllNoti(
    GetAllNotiEvent event,
    Emitter<NotiState> emit,
  ) async {
    final res = await _getAllNoti.call(GetAllNotiParams(
      accountId: event.accountId,
    ));

    if (res.isRight()) {
      emit(GetAllNotiSuccess(
        res.getRight().getOrElse(() => throw UnimplementedError()),
      ));
    } else {
      emit(NotiFailure("Error get all noti"));
    }
  }
}
