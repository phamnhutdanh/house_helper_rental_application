import 'package:bloc/bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:house_helper_rental_application/core/common/entities/address.dart';
import 'package:house_helper_rental_application/features/address/domain/usecases/create_customer_address.dart';
import 'package:meta/meta.dart';

part 'address_event.dart';
part 'address_state.dart';

class AddressBloc extends Bloc<AddressEvent, AddressState> {
  final CreateCustomerAddress _createCustomerAddress;

  AddressBloc({
    required CreateCustomerAddress createCustomerAddress,
  })  : _createCustomerAddress = createCustomerAddress,
        super(AddressInitial()) {
    on<AddressEvent>((event, emit) => emit(AddressLoading()));
    on<CreateCustomerAddressEvent>(_onCreateCustomerAddress);
  }

  void _onCreateCustomerAddress(
    CreateCustomerAddressEvent event,
    Emitter<AddressState> emit,
  ) async {
    final customerAddress =
        await _createCustomerAddress.call(CreateCustomerAddressParams(
      address: event.address,
      customerId: event.customerId,
      fullName: event.fullName,
      isDefault: event.isDefault,
      phone: event.phone,
    ));

    if (customerAddress.isRight()) {
      emit(CreateCustomerAddressSuccess(
        customerAddress.getRight().getOrElse(() => throw UnimplementedError()),
      ));
    } else {
      emit(AddressFailure("Error create customer address"));
    }
  }
}
