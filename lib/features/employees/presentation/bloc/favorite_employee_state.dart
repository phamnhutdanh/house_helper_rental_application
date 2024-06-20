part of 'favorite_employee_bloc.dart';

@immutable
sealed class FavoriteEmployeeState {}

final class FavoriteEmployeeInitial extends FavoriteEmployeeState {}

final class FavoriteEmployeeLoading extends FavoriteEmployeeState {}

final class FavoriteEmployeeFailure extends FavoriteEmployeeState {
  final String error;
  FavoriteEmployeeFailure(this.error);
}

final class GetFavoriteEmployeeByIdDisplaySuccess
    extends FavoriteEmployeeState {
  final Employee employee;
  GetFavoriteEmployeeByIdDisplaySuccess(this.employee);
}

final class GetFavoriteEmployeesOfCustomerDisplaySuccess
    extends FavoriteEmployeeState {
  final List<FavoriteEmployee> employees;
  GetFavoriteEmployeesOfCustomerDisplaySuccess(this.employees);
}

final class AddToFavoriteSuccess extends FavoriteEmployeeState {
  final FavoriteEmployee employee;
  AddToFavoriteSuccess(this.employee);
}

final class RemoveFromFavoriteSuccess extends FavoriteEmployeeState {
  final FavoriteEmployee employee;
  RemoveFromFavoriteSuccess(this.employee);
}

final class CheckFavoriteSuccess extends FavoriteEmployeeState {
  final bool isFavorite;
  CheckFavoriteSuccess(this.isFavorite);
}
