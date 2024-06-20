import 'package:bloc/bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:house_helper_rental_application/core/common/entities/booking.dart';
import 'package:house_helper_rental_application/core/common/entities/enum_type.dart';
import 'package:house_helper_rental_application/core/common/entities/service.dart';
import 'package:house_helper_rental_application/features/booking/domain/usecases/change_booking_status.dart';
import 'package:house_helper_rental_application/features/booking/domain/usecases/create_booking.dart';
import 'package:house_helper_rental_application/features/booking/domain/usecases/employee_accept.dart';
import 'package:house_helper_rental_application/features/booking/domain/usecases/get_all_booking.dart';
import 'package:house_helper_rental_application/features/booking/domain/usecases/get_all_booking_of_customer.dart';
import 'package:house_helper_rental_application/features/booking/domain/usecases/get_booking_by_id.dart';
import 'package:meta/meta.dart';

part 'booking_event.dart';
part 'booking_state.dart';

class BookingBloc extends Bloc<BookingEvent, BookingState> {
  final CreateBooking _createBooking;
  final GetBookingById _getBookingById;
  final GetAllBookingOfCustomer _getAllBookingOfCustomer;
  final GetAllBooking _getAllBooking;
  final ChangeBookingStatus _changeBookingStatus;
  final EmployeeAccept _employeeAccept;

  BookingBloc({
    required CreateBooking createBooking,
    required GetBookingById getBookingById,
    required GetAllBookingOfCustomer getAllBookingOfCustomer,
    required GetAllBooking getAllBooking,
    required ChangeBookingStatus changeBookingStatus,
    required EmployeeAccept employeeAccept,
  })  : _createBooking = createBooking,
        _getBookingById = getBookingById,
        _getAllBookingOfCustomer = getAllBookingOfCustomer,
        _getAllBooking = getAllBooking,
        _changeBookingStatus = changeBookingStatus,
        _employeeAccept = employeeAccept,
        super(BookingInitial()) {
    on<BookingEvent>((event, emit) => emit(BookingLoading()));
    on<BookingCreateDataEvent>(_onBookingCreateData);
    on<GetAllBookingOfCustomerEvent>(_onGetAllBookingOfCustomer);
    on<GetAllBookingEvent>(_onGetAllBooking);
    on<GetBookingByIdEvent>(_onGetBookingById);
    on<BookingChangeStatusEvent>(_onChangeBookingStatus);
    on<BookingEmployeeAcceptEvent>(_onAcceptBooking);
  }

  void _onAcceptBooking(
    BookingEmployeeAcceptEvent event,
    Emitter<BookingState> emit,
  ) async {
    final booking = await _employeeAccept.call(EmployeeAcceptParams(
      bookingId: event.bookingId,
      employeeId: event.employeeId,
    ));

    if (booking.isRight()) {
      emit(EmployeeAcceptSuccess(
        booking.getRight().getOrElse(() => throw UnimplementedError()),
      ));
    } else {
      emit(BookingFailure("Error accept status booking"));
    }
  }

  void _onGetAllBooking(
    GetAllBookingEvent event,
    Emitter<BookingState> emit,
  ) async {
    final bookings = await _getAllBooking
        .call(GetBookingParams(employeeId: event.employeeId));

    if (bookings.isRight()) {
      emit(AllBookingDisplaySuccess(
        bookings.getRight().getOrElse(() => throw UnimplementedError()),
      ));
    } else {
      emit(BookingFailure("Error get all booking"));
    }
  }

  void _onChangeBookingStatus(
    BookingChangeStatusEvent event,
    Emitter<BookingState> emit,
  ) async {
    final booking = await _changeBookingStatus.call(ChangeBookingStatusParams(
      id: event.id,
      bookingStatus: event.bookingStatus,
    ));

    if (booking.isRight()) {
      emit(ChangeBookingStatusSuccess(
        booking.getRight().getOrElse(() => throw UnimplementedError()),
      ));
    } else {
      emit(BookingFailure("Error change status booking"));
    }
  }

  void _onGetBookingById(
    GetBookingByIdEvent event,
    Emitter<BookingState> emit,
  ) async {
    final booking = await _getBookingById.call(GetBookingByIdParams(
      id: event.id,
    ));

    if (booking.isRight()) {
      emit(GetBookingByIdDisplaySuccess(
        booking.getRight().getOrElse(() => throw UnimplementedError()),
      ));
    } else {
      emit(BookingFailure("Error get booking id"));
    }
  }

  void _onGetAllBookingOfCustomer(
    GetAllBookingOfCustomerEvent event,
    Emitter<BookingState> emit,
  ) async {
    final bookings =
        await _getAllBookingOfCustomer.call(GetAllBookingOfCustomerParams(
      customerId: event.customerId,
    ));

    if (bookings.isRight()) {
      emit(AllBookingOfCustomerDisplaySuccess(
        bookings.getRight().getOrElse(() => throw UnimplementedError()),
      ));
    } else {
      emit(BookingFailure("Error get all booking"));
    }
  }

  void _onBookingCreateData(
    BookingCreateDataEvent event,
    Emitter<BookingState> emit,
  ) async {
    final booking = await _createBooking.call(CreateBookingParams(
      bookingTime: event.bookingTime,
      customerAddressId: event.customerAddressId,
      accountId: event.accountId,
      note: event.note,
      paymentMethod: event.paymentMethod,
      repeatStatus: event.repeatStatus,
      serviceDetails: event.serviceDetails,
      serviceId: event.serviceId,
      totalPrice: event.totalPrice,
    ));

    if (booking.isRight()) {
      emit(CreateBookingSuccess(
        booking.getRight().getOrElse(() => throw UnimplementedError()),
      ));
    } else {
      emit(BookingFailure("Error create booking"));
    }
  }
}
