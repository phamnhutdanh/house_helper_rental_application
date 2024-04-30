part of 'booking_bloc.dart';

@immutable
sealed class BookingEvent {}

final class BookingFetchAllServices extends BookingEvent {}
final class BookingFetchAllTopEmployees extends BookingEvent {}
final class BookingFetchAllEmployees extends BookingEvent {}
final class BookingFetchAllHomeData extends BookingEvent {}
