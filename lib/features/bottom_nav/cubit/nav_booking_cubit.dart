import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'nav_booking_state.dart';

class NavBookingCubit extends Cubit<int> {
  NavBookingCubit() : super(0);
    changeSelectedIndex(newIndex) => emit(newIndex);
}
