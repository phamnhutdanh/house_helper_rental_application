import 'package:bloc/bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:house_helper_rental_application/core/common/entities/booking.dart';
import 'package:house_helper_rental_application/core/common/entities/service.dart';
import 'package:house_helper_rental_application/features/booking/domain/usecases/create_booking.dart';
import 'package:meta/meta.dart';

part 'booking_event.dart';
part 'booking_state.dart';

class BookingBloc extends Bloc<BookingEvent, BookingState> {
  final CreateBooking _createBooking;

  BookingBloc({
    required CreateBooking createBooking,
  })  : _createBooking = createBooking,
        super(BookingInitial()) {
    on<BookingEvent>((event, emit) => emit(BookingLoading()));
    on<BookingCreateDataEvent>(_onBookingCreateData);
  }

  void _onBookingCreateData(
    BookingCreateDataEvent event,
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
      emit(CreateBookingSuccess(
        booking.getRight().getOrElse(() => throw UnimplementedError()),
      ));
    } else {
      emit(BookingFailure("Error create booking"));
    }
  }
}
