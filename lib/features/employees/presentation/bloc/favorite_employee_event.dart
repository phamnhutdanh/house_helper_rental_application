part of 'favorite_employee_bloc.dart';

@immutable
sealed class FavoriteEmployeeEvent {}

final class GetFavoriteEmployeeByIdEvent extends FavoriteEmployeeEvent {
  final String id;
  GetFavoriteEmployeeByIdEvent({required this.id});
}

final class GetFavoriteEmployeesOfCustomerEvent extends FavoriteEmployeeEvent {
  final String customerId;
  GetFavoriteEmployeesOfCustomerEvent({required this.customerId});
}

final class AddToFavoriteEvent extends FavoriteEmployeeEvent {
  final String customerId;
  final String employeeId;

  AddToFavoriteEvent({
    required this.employeeId,
    required this.customerId,
  });
}

final class RemoveFromFavoriteEvent extends FavoriteEmployeeEvent {
  final String customerId;
  final String employeeId;

  RemoveFromFavoriteEvent({
    required this.employeeId,
    required this.customerId,
  });
}

final class CheckFavoriteEvent extends FavoriteEmployeeEvent {
  final String customerId;
  final String employeeId;

  CheckFavoriteEvent({
    required this.employeeId,
    required this.customerId,
  });
}
