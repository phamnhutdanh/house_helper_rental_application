import 'package:bloc/bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:house_helper_rental_application/core/common/entities/address.dart';
import 'package:house_helper_rental_application/features/address/domain/usecases/create_customer_address.dart';
import 'package:house_helper_rental_application/features/address/domain/usecases/get_all_address_of_customer.dart';
import 'package:house_helper_rental_application/features/address/domain/usecases/get_customer_address_by_id.dart';
import 'package:meta/meta.dart';

part 'address_event.dart';
part 'address_state.dart';

class AddressBloc extends Bloc<AddressEvent, AddressState> {
  final CreateCustomerAddress _createCustomerAddress;
  final GetAllAddressOfCustomer _getAllAddressOfCustomer;
  final GetCustomerAddressById _getCustomerAddressById;

  AddressBloc({
    required CreateCustomerAddress createCustomerAddress,
    required GetAllAddressOfCustomer getAllAddressOfCustomer,
    required GetCustomerAddressById getCustomerAddressById,
  })  : _createCustomerAddress = createCustomerAddress,
        _getAllAddressOfCustomer = getAllAddressOfCustomer,
        _getCustomerAddressById = getCustomerAddressById,
        super(AddressInitial()) {
    on<AddressEvent>((event, emit) => emit(AddressLoading()));
    on<CreateCustomerAddressEvent>(_onCreateCustomerAddress);
    on<GetAllAddressOfCustomerEvent>(_onGetAllAddressOfCustomer);
    on<GetCustomerAddressByIdEvent>(_onGetCustomerAddressById);
  }

  void _onGetAllAddressOfCustomer(
    GetAllAddressOfCustomerEvent event,
    Emitter<AddressState> emit,
  ) async {
    
    final customerAddresses =
        await _getAllAddressOfCustomer.call(GetAllAddressOfCustomerParams(
      customerId: event.customerId,
    ));

    if (customerAddresses.isRight()) {
      emit(FetchAllAddressOfCustomerDisplaySuccess(
        customerAddresses
            .getRight()
            .getOrElse(() => throw UnimplementedError()),
      ));
    } else {
      emit(AddressFailure("Error get all address of customer"));
    }
  }

  void _onGetCustomerAddressById(
    GetCustomerAddressByIdEvent event,
    Emitter<AddressState> emit,
  ) async {
    final customerAddress =
        await _getCustomerAddressById.call(GetCustomerAddressByIdParams(
      id: event.id,
    ));

    if (customerAddress.isRight()) {
      emit(GetCustomerAddressByIdDisplaySuccess(
        customerAddress.getRight().getOrElse(() => throw UnimplementedError()),
      ));
    } else {
      emit(AddressFailure("Error get customer address by id"));
    }
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
