import 'package:bloc/bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:house_helper_rental_application/core/common/entities/account_info.dart';
import 'package:house_helper_rental_application/core/common/entities/address.dart';
import 'package:house_helper_rental_application/core/common/entities/booking.dart';
import 'package:house_helper_rental_application/core/common/entities/employee.dart';
import 'package:house_helper_rental_application/core/common/entities/service.dart';
import 'package:house_helper_rental_application/core/usecase/usecase.dart';
import 'package:house_helper_rental_application/features/auth/domain/usecases/current_account_info.dart';
import 'package:house_helper_rental_application/features/booking/domain/usecases/create_booking.dart';
import 'package:house_helper_rental_application/features/booking/domain/usecases/create_customer_address.dart';
import 'package:house_helper_rental_application/features/booking/domain/usecases/get_all_employees.dart';
import 'package:house_helper_rental_application/features/booking/domain/usecases/get_all_services.dart';
import 'package:house_helper_rental_application/features/booking/domain/usecases/get_service_by_id.dart';
import 'package:house_helper_rental_application/features/booking/domain/usecases/get_top_employees.dart';
import 'package:meta/meta.dart';

part 'booking_event.dart';
part 'booking_state.dart';

class BookingBloc extends Bloc<BookingEvent, BookingState> {
  final GetAllServices _getAllServices;
  final GetTopEmployees _getTopEmployees;
  final CurrentAccountInfo _currentAccountInfo;
  final GetServiceById _getServiceById;
  final CreateBooking _createBooking;
  final CreateCustomerAddress _createCustomerAddress;

  BookingBloc({
    required GetAllServices getAllServices,
    required GetTopEmployees getTopEmployees,
    required GetAllEmployees getAllEmployees,
    required CurrentAccountInfo currentAccountInfo,
    required GetServiceById getServiceById,
    required CreateBooking createBooking,
    required CreateCustomerAddress createCustomerAddress,
  })  : _getAllServices = getAllServices,
        _getTopEmployees = getTopEmployees,
        _currentAccountInfo = currentAccountInfo,
        _getServiceById = getServiceById,
        _createBooking = createBooking,
        _createCustomerAddress = createCustomerAddress,
        super(BookingInitial()) {
    on<BookingEvent>((event, emit) => emit(BookingLoading()));
    on<BookingFetchAllHomeData>(_onFetchHomeData);
    on<BookingFetchAllCheckoutData>(_onFetchAllCheckoutData);
    on<BookingCreateData>(_onBookingCreateData);
    on<BookingCreateCustomerAddress>(_onBookingCreateCustomerAddress);
  }

  void _onBookingCreateCustomerAddress(
    BookingCreateCustomerAddress event,
    Emitter<BookingState> emit,
  ) async {
    final customerAddress =
        await _createCustomerAddress.call(CreateCustomerAddressParams(
      address: event.address,
      customerId: event.customerId,
      fullName: event.fullName,
      isDefault: event.isDefault,
      phone: event.phone,
    ));

    // customerAddress.fold((l) => ,
    // (r)  {
    //     r.addressId
    //     return emit(BookingCreateCustomerAddressSuccess(r));
    // },
    // );
    if (customerAddress.isRight()) {
      emit(BookingCreateCustomerAddressSuccess(
        customerAddress.getRight().getOrElse(() => throw UnimplementedError()),
      ));
    } else {
      emit(BookingFailure("Error create customer address"));
    }
  }

  void _onBookingCreateData(
    BookingCreateData event,
    Emitter<BookingState> emit,
  ) async {
    final booking = await _createBooking.call(CreateBookingParams(
      bookingTime: event.bookingTime,
      customerAddressId: event.customerAddressId,
      customerId: event.customerId,
      note: event.note,
      paymentMethod: event.paymentMethod,
      repeatStatus: event.repeatStatus,
      serviceDetails: event.serviceDetails,
      serviceId: event.serviceId,
      totalPrice: event.totalPrice,
    ));

    if (booking.isRight()) {
      emit(BookingCreateDataSuccess(
        booking.getRight().getOrElse(() => throw UnimplementedError()),
      ));
    } else {
      emit(BookingFailure("Error create booking"));
    }
  }

  void _onFetchAllCheckoutData(
    BookingFetchAllCheckoutData event,
    Emitter<BookingState> emit,
  ) async {
    final service = await _getServiceById.call(GetServiceByIdParams(
      id: event.serviceId,
    ));
    final currentAccount = await _currentAccountInfo.call(NoParams());

    if (service.isRight()) {
      emit(CheckoutInfoDisplaySuccess(
        service.getRight().getOrElse(() => throw UnimplementedError()),
        currentAccount.getRight().getOrElse(() => throw UnimplementedError()),
      ));
    } else {
      emit(BookingFailure("Error fetch service details"));
    }
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
      emit(BookingHomeInfoDisplaySuccess(
        topEmployees.getRight().getOrElse(() => throw UnimplementedError()),
        services.getRight().getOrElse(() => throw UnimplementedError()),
        currentAccount.getRight().getOrElse(() => throw UnimplementedError()),
      ));
    } else {
      emit(BookingFailure("Error fetch home data"));
    }
  }
}
