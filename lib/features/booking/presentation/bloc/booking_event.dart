part of 'booking_bloc.dart';

@immutable
sealed class BookingEvent {}

final class BookingFetchAllHomeData extends BookingEvent {}
