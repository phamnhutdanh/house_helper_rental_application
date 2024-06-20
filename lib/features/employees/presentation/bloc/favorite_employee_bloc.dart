import 'package:bloc/bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:house_helper_rental_application/core/common/entities/employee.dart';
import 'package:house_helper_rental_application/features/employees/domain/usecases/add_to_favorite.dart';
import 'package:house_helper_rental_application/features/employees/domain/usecases/check_favorite.dart';
import 'package:house_helper_rental_application/features/employees/domain/usecases/get_employee_by_id.dart';
import 'package:house_helper_rental_application/features/employees/domain/usecases/get_favorite_employees_of_customer.dart';
import 'package:house_helper_rental_application/features/employees/domain/usecases/remove_from_favorite.dart';
import 'package:meta/meta.dart';

part 'favorite_employee_event.dart';
part 'favorite_employee_state.dart';

class FavoriteEmployeeBloc
    extends Bloc<FavoriteEmployeeEvent, FavoriteEmployeeState> {
  final GetEmployeeById _getEmployeeById;
  final GetFavoriteEmployeesOfCustomer _getFavoriteEmployeesOfCustomer;
  final AddToFavorite _addToFavorite;
  final RemoveFromFavorite _removeFromFavorite;
  final CheckFavorite _checkFavorite;

  FavoriteEmployeeBloc({
    required GetEmployeeById getEmployeeById,
    required GetFavoriteEmployeesOfCustomer getFavoriteEmployeesOfCustomer,
    required AddToFavorite addToFavorite,
    required RemoveFromFavorite removeFromFavorite,
    required CheckFavorite checkFavorite,
  })  : _getEmployeeById = getEmployeeById,
        _getFavoriteEmployeesOfCustomer = getFavoriteEmployeesOfCustomer,
        _addToFavorite = addToFavorite,
        _removeFromFavorite = removeFromFavorite,
        _checkFavorite = checkFavorite,
        super(FavoriteEmployeeInitial()) {
    on<FavoriteEmployeeEvent>((event, emit) => emit(FavoriteEmployeeLoading()));
    on<GetFavoriteEmployeeByIdEvent>(_onGetEmployeeById);
    on<GetFavoriteEmployeesOfCustomerEvent>(_onGetFavoriteEmployees);
    on<AddToFavoriteEvent>(_onAddToFavorite);
    on<RemoveFromFavoriteEvent>(_onRemoveFromFavorite);
    on<CheckFavoriteEvent>(_onCheckFavorite);
  }

  void _onCheckFavorite(
    CheckFavoriteEvent event,
    Emitter<FavoriteEmployeeState> emit,
  ) async {
    final res = await _checkFavorite.call(CheckFavoriteParams(
      customerId: event.customerId,
      employeeId: event.employeeId,
    ));

    if (res.isRight()) {
      emit(CheckFavoriteSuccess(
        res.getRight().getOrElse(() => throw UnimplementedError()),
      ));
    } else {
      emit(FavoriteEmployeeFailure("Error remove favorite employee"));
    }
  }

  void _onRemoveFromFavorite(
    RemoveFromFavoriteEvent event,
    Emitter<FavoriteEmployeeState> emit,
  ) async {
    final res = await _removeFromFavorite.call(RemoveFromFavoriteParams(
      customerId: event.customerId,
      employeeId: event.employeeId,
    ));

    if (res.isRight()) {
      emit(RemoveFromFavoriteSuccess(
        res.getRight().getOrElse(() => throw UnimplementedError()),
      ));
    } else {
      emit(FavoriteEmployeeFailure("Error remove favorite employee"));
    }
  }

  void _onAddToFavorite(
    AddToFavoriteEvent event,
    Emitter<FavoriteEmployeeState> emit,
  ) async {
    final res = await _addToFavorite.call(AddToFavoriteParams(
      customerId: event.customerId,
      employeeId: event.employeeId,
    ));

    if (res.isRight()) {
      emit(AddToFavoriteSuccess(
        res.getRight().getOrElse(() => throw UnimplementedError()),
      ));
    } else {
      emit(FavoriteEmployeeFailure("Error add favorite employee"));
    }
  }

  void _onGetFavoriteEmployees(
    GetFavoriteEmployeesOfCustomerEvent event,
    Emitter<FavoriteEmployeeState> emit,
  ) async {
    final res = await _getFavoriteEmployeesOfCustomer
        .call(GetFavoriteEmployeesOfCustomerParams(
      customerId: event.customerId,
    ));

    if (res.isRight()) {
      emit(GetFavoriteEmployeesOfCustomerDisplaySuccess(
        res.getRight().getOrElse(() => throw UnimplementedError()),
      ));
    } else {
      emit(FavoriteEmployeeFailure("Error fetch favorite employees"));
    }
  }

  void _onGetEmployeeById(
    GetFavoriteEmployeeByIdEvent event,
    Emitter<FavoriteEmployeeState> emit,
  ) async {
    final res = await _getEmployeeById.call(GetEmployeeByIdParams(
      id: event.id,
    ));

    if (res.isRight()) {
      emit(GetFavoriteEmployeeByIdDisplaySuccess(
        res.getRight().getOrElse(() => throw UnimplementedError()),
      ));
    } else {
      emit(FavoriteEmployeeFailure("Error get favorite employee id"));
    }
  }
}
