part of 'service_bloc.dart';

@immutable
sealed class ServiceEvent {}

final class FetchAllServicesEvent extends ServiceEvent {}

final class GetServiceByIdEvent extends ServiceEvent {
  final String serviceId;

  GetServiceByIdEvent({
    required this.serviceId,
  });
}
