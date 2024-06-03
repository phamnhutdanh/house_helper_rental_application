import 'package:bloc/bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:house_helper_rental_application/core/common/entities/employee.dart';
import 'package:house_helper_rental_application/core/usecase/usecase.dart';
import 'package:house_helper_rental_application/features/employees/domain/usecases/get_top_employees.dart';
import 'package:meta/meta.dart';

part 'employee_event.dart';
part 'employee_state.dart';

class EmployeeBloc extends Bloc<EmployeeEvent, EmployeeState> {
  final GetTopEmployees _getTopEmployees;

  EmployeeBloc({
    required GetTopEmployees getTopEmployees,
  })  : _getTopEmployees = getTopEmployees,
        super(EmployeeInitial()) {
    on<EmployeeEvent>((event, emit) => emit(EmployeeLoading()));
    on<FetchTopEmployeesEvent>(_onFetchTopEmployees);
  }

  void _onFetchTopEmployees(
    FetchTopEmployeesEvent event,
    Emitter<EmployeeState> emit,
  ) async {
    final topEmployees = await _getTopEmployees.call(NoParams());

    if (topEmployees.isRight()) {
      emit(TopEmployeesDisplaySuccess(
        topEmployees.getRight().getOrElse(() => throw UnimplementedError()),
      ));
    } else {
      emit(EmployeeFailure("Error fetch top employees"));
    }
  }
}
