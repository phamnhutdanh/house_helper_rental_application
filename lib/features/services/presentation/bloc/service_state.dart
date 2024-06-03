part of 'service_bloc.dart';

@immutable
sealed class ServiceState {}

final class ServiceInitial extends ServiceState {}

final class ServiceLoading extends ServiceState {}

final class ServiceFailure extends ServiceState {
  final String error;
  ServiceFailure(this.error);
}

final class ServicesListDisplaySuccess extends ServiceState {
  final List<Service> services;
  ServicesListDisplaySuccess(this.services);
}

final class ServiceDetailDisplaySuccess extends ServiceState {
  final Service service;
  ServiceDetailDisplaySuccess(this.service);
}
