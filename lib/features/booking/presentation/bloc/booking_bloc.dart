import 'package:bloc/bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:house_helper_rental_application/core/common/entities/account_info.dart';
import 'package:house_helper_rental_application/core/common/entities/employee.dart';
import 'package:house_helper_rental_application/core/common/entities/service.dart';
import 'package:house_helper_rental_application/core/usecase/usecase.dart';
import 'package:house_helper_rental_application/features/auth/domain/usecases/current_account_info.dart';
import 'package:house_helper_rental_application/features/booking/domain/usecases/get_all_employees.dart';
import 'package:house_helper_rental_application/features/booking/domain/usecases/get_all_services.dart';
import 'package:house_helper_rental_application/features/booking/domain/usecases/get_top_employees.dart';
import 'package:meta/meta.dart';

part 'booking_event.dart';
part 'booking_state.dart';

class BookingBloc extends Bloc<BookingEvent, BookingState> {
  final GetAllServices _getAllServices;
  final GetTopEmployees _getTopEmployees;
  final CurrentAccountInfo _currentAccountInfo;

  BookingBloc(
      {required GetAllServices getAllServices,
      required GetTopEmployees getTopEmployees,
      required GetAllEmployees getAllEmployees,
      required CurrentAccountInfo currentAccountInfo})
      : _getAllServices = getAllServices,
        _getTopEmployees = getTopEmployees,
        _currentAccountInfo = currentAccountInfo,
        super(BookingInitial()) {
    on<BookingEvent>((event, emit) => emit(BookingLoading()));
    on<BookingFetchAllHomeData>(_onFetchHomeData);
  }

  void _onFetchHomeData(
    BookingFetchAllHomeData event,
    Emitter<BookingState> emit,
  ) async {
    final topEmployees = await _getTopEmployees.call(NoParams());
    final services = await _getAllServices.call(NoParams());
    final currentAccount = await _currentAccountInfo.call(NoParams());

    if (topEmployees.isRight() &&
        services.isRight() &&
        currentAccount.isRight()) {
      emit(HomeInfoDisplaySuccess(
        topEmployees.getRight().getOrElse(() => throw UnimplementedError()),
        services.getRight().getOrElse(() => throw UnimplementedError()),
        currentAccount.getRight().getOrElse(() => throw UnimplementedError()),
      ));
    } else {
      emit(BookingFailure("Error"));
    }
  }
}
