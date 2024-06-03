import 'package:bloc/bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:house_helper_rental_application/core/common/entities/service.dart';
import 'package:house_helper_rental_application/core/usecase/usecase.dart';
import 'package:house_helper_rental_application/features/services/domain/usecases/get_all_services.dart';
import 'package:house_helper_rental_application/features/services/domain/usecases/get_service_by_id.dart';
import 'package:meta/meta.dart';

part 'service_event.dart';
part 'service_state.dart';

class ServiceBloc extends Bloc<ServiceEvent, ServiceState> {
  final GetAllServices _getAllServices;
  final GetServiceById _getServiceById;

  ServiceBloc({
    required GetAllServices getAllServices,
    required GetServiceById getServiceById,
  })  : _getAllServices = getAllServices,
        _getServiceById = getServiceById,
        super(ServiceInitial()) {
    on<ServiceEvent>((event, emit) => emit(ServiceLoading()));
    on<FetchAllServicesEvent>(_onFetchAllServices);
    on<GetServiceByIdEvent>(_onGetServiceById);
  }

  void _onFetchAllServices(
    FetchAllServicesEvent event,
    Emitter<ServiceState> emit,
  ) async {
    final services = await _getAllServices.call(NoParams());

    if (services.isRight()) {
      emit(ServicesListDisplaySuccess(
        services.getRight().getOrElse(() => throw UnimplementedError()),
      ));
    } else {
      emit(ServiceFailure("Error fetch all services data"));
    }
  }

  void _onGetServiceById(
    GetServiceByIdEvent event,
    Emitter<ServiceState> emit,
  ) async {
    final service =
        await _getServiceById.call(GetServiceByIdParams(id: event.serviceId));

    if (service.isRight()) {
      emit(ServiceDetailDisplaySuccess(
        service.getRight().getOrElse(() => throw UnimplementedError()),
      ));
    } else {
      emit(ServiceFailure("Error fetch service details"));
    }
  }
}
