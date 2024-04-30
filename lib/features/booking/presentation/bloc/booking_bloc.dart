import 'package:bloc/bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:house_helper_rental_application/core/common/entities/employee.dart';
import 'package:house_helper_rental_application/core/common/entities/service.dart';
import 'package:house_helper_rental_application/core/usecase/usecase.dart';
import 'package:house_helper_rental_application/features/booking/domain/usecases/get_all_employees.dart';
import 'package:house_helper_rental_application/features/booking/domain/usecases/get_all_services.dart';
import 'package:house_helper_rental_application/features/booking/domain/usecases/get_top_employees.dart';
import 'package:meta/meta.dart';

part 'booking_event.dart';
part 'booking_state.dart';

class BookingBloc extends Bloc<BookingEvent, BookingState> {
  final GetAllServices _getAllServices;
  final GetTopEmployees _getTopEmployees;
  final GetAllEmployees _getAllEmployees;

  BookingBloc({
    required GetAllServices getAllServices,
    required GetTopEmployees getTopEmployees,
    required GetAllEmployees getAllEmployees,
  })  : _getAllServices = getAllServices,
        _getTopEmployees = getTopEmployees,
        _getAllEmployees = getAllEmployees,
        super(BookingInitial()) {
    on<BookingEvent>((event, emit) => emit(BookingLoading()));
    on<BookingFetchAllServices>(_onFetchAllServices);
    on<BookingFetchAllTopEmployees>(_onFetchAllTopEmployees);
    on<BookingFetchAllEmployees>(_onFetchAllEmployees);
    on<BookingFetchAllHomeData>(_onFetchHomeData);
  }

  void _onFetchHomeData(
    BookingFetchAllHomeData event,
    Emitter<BookingState> emit,
  ) async {
    final topEmployees = await _getTopEmployees.call(NoParams());
    final services = await _getAllServices.call(NoParams());

    if (topEmployees.isRight() && services.isRight()) {
      emit(HomeInfoDisplaySuccess(topEmployees.getRight().getOrElse(() => []),
          services.getRight().getOrElse(() => [])));
    } else {
      emit(BookingFailure("Error"));
    }
  }

  void _onFetchAllServices(
    BookingFetchAllServices event,
    Emitter<BookingState> emit,
  ) async {
    final res = await _getAllServices.call(NoParams());

    res.fold(
      (l) => emit(BookingFailure(l.message)),
      (r) => emit(ServicesDisplaySuccess(r)),
    );
  }

  void _onFetchAllTopEmployees(
    BookingFetchAllTopEmployees event,
    Emitter<BookingState> emit,
  ) async {
    final res = await _getTopEmployees.call(NoParams());

    res.fold(
      (l) => emit(BookingFailure(l.message)),
      (r) => emit(TopEmployeesDisplaySuccess(r)),
    );
  }

  void _onFetchAllEmployees(
    BookingFetchAllEmployees event,
    Emitter<BookingState> emit,
  ) async {
    final res = await _getAllEmployees.call(NoParams());

    res.fold(
      (l) => emit(BookingFailure(l.message)),
      (r) => emit(AllEmployeesDisplaySuccess(r)),
    );
  }
}
