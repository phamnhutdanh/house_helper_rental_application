import 'package:bloc/bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:house_helper_rental_application/core/common/entities/employee.dart';
import 'package:house_helper_rental_application/core/usecase/usecase.dart';
import 'package:house_helper_rental_application/features/employees/domain/usecases/get_employee_by_id.dart';
import 'package:house_helper_rental_application/features/employees/domain/usecases/get_top_employees.dart';
import 'package:meta/meta.dart';

part 'employee_event.dart';
part 'employee_state.dart';

class EmployeeBloc extends Bloc<EmployeeEvent, EmployeeState> {
  final GetTopEmployees _getTopEmployees;
  final GetEmployeeById _getEmployeeById;

  EmployeeBloc({
    required GetTopEmployees getTopEmployees,
    required GetEmployeeById getEmployeeById,
  })  : _getTopEmployees = getTopEmployees,
        _getEmployeeById = getEmployeeById,
        super(EmployeeInitial()) {
    on<EmployeeEvent>((event, emit) => emit(EmployeeLoading()));
    on<FetchTopEmployeesEvent>(_onFetchTopEmployees);
    on<GetEmployeeByIdEvent>(_onGetEmployeeById);
  }

  void _onGetEmployeeById(
    GetEmployeeByIdEvent event,
    Emitter<EmployeeState> emit,
  ) async {
    final res = await _getEmployeeById.call(GetEmployeeByIdParams(
      id: event.id,
    ));

    if (res.isRight()) {
      emit(GetEmployeeByIdDisplaySuccess(
        res.getRight().getOrElse(() => throw UnimplementedError()),
      ));
    } else {
      emit(EmployeeFailure("Error get employee id"));
    }
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
