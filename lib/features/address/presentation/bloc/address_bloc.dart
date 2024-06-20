import 'package:bloc/bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:house_helper_rental_application/core/common/entities/address.dart';
import 'package:house_helper_rental_application/features/address/domain/usecases/create_customer_address.dart';
import 'package:house_helper_rental_application/features/address/domain/usecases/create_employee_address.dart';
import 'package:house_helper_rental_application/features/address/domain/usecases/get_all_address_of_customer.dart';
import 'package:house_helper_rental_application/features/address/domain/usecases/get_all_address_of_employee.dart';
import 'package:house_helper_rental_application/features/address/domain/usecases/get_customer_address_by_id.dart';
import 'package:house_helper_rental_application/features/address/domain/usecases/remove_customer_address.dart';
import 'package:house_helper_rental_application/features/address/domain/usecases/remove_employee_address.dart';
import 'package:meta/meta.dart';

part 'address_event.dart';
part 'address_state.dart';

class AddressBloc extends Bloc<AddressEvent, AddressState> {
  final CreateCustomerAddress _createCustomerAddress;
  final GetAllAddressOfCustomer _getAllAddressOfCustomer;
  final RemoveCustomerAddress _removeCustomerAddress;
  final GetCustomerAddressById _getCustomerAddressById;
  final CreateEmployeeAddress _createEmployeeAddress;
  final GetAllAddressOfEmployee _getAllAddressOfEmployee;
  final RemoveEmployeeAddress _removeEmployeeAddress;
  AddressBloc({
    required GetCustomerAddressById getCustomerAddressById,
    required CreateCustomerAddress createCustomerAddress,
    required GetAllAddressOfCustomer getAllAddressOfCustomer,
    required RemoveCustomerAddress removeCustomerAddress,
    required CreateEmployeeAddress createEmployeeAddress,
    required GetAllAddressOfEmployee getAllAddressOfEmployee,
    required RemoveEmployeeAddress removeEmployeeAddress,
  })  : _createCustomerAddress = createCustomerAddress,
        _getAllAddressOfCustomer = getAllAddressOfCustomer,
        _getCustomerAddressById = getCustomerAddressById,
        _removeCustomerAddress = removeCustomerAddress,
        _createEmployeeAddress = createEmployeeAddress,
        _getAllAddressOfEmployee = getAllAddressOfEmployee,
        _removeEmployeeAddress = removeEmployeeAddress,
        super(AddressInitial()) {
    on<AddressEvent>((event, emit) => emit(AddressLoading()));
    on<CreateCustomerAddressEvent>(_onCreateCustomerAddress);
    on<GetAllAddressOfCustomerEvent>(_onGetAllAddressOfCustomer);
    on<GetCustomerAddressByIdEvent>(_onGetCustomerAddressById);
    on<RemoveCustomerAddressEvent>(_onRemoveCustomerAddress);

    on<CreateEmployeeAddressEvent>(_onCreateEmployeeAddress);
    on<GetAllAddressOfEmployeeEvent>(_onGetAllAddressOfEmployee);
    on<RemoveEmployeeAddressEvent>(_onRemoveEmployeeAddress);
  }

  void _onRemoveEmployeeAddress(
    RemoveEmployeeAddressEvent event,
    Emitter<AddressState> emit,
  ) async {
    final customerAddress =
        await _removeEmployeeAddress.call(RemoveEmployeeAddressParams(
      id: event.id,
    ));

    if (customerAddress.isRight()) {
      emit(RemoveEmployeeAddressSuccess(
        customerAddress.getRight().getOrElse(() => throw UnimplementedError()),
      ));
    } else {
      emit(AddressFailure("Error remove emp address"));
    }
  }

  void _onGetAllAddressOfEmployee(
    GetAllAddressOfEmployeeEvent event,
    Emitter<AddressState> emit,
  ) async {
    final customerAddresses =
        await _getAllAddressOfEmployee.call(GetAllAddressOfEmployeeParams(
      employeeId: event.employeeId,
    ));

    if (customerAddresses.isRight()) {
      emit(FetchAllAddressOfEmployeeDisplaySuccess(
        customerAddresses
            .getRight()
            .getOrElse(() => throw UnimplementedError()),
      ));
    } else {
      emit(AddressFailure("Error get all address of emp"));
    }
  }

  void _onCreateEmployeeAddress(
    CreateEmployeeAddressEvent event,
    Emitter<AddressState> emit,
  ) async {
    final customerAddress =
        await _createEmployeeAddress.call(CreateEmployeeAddressParams(
      address: event.address,
      employeeId: event.employeeId,
      fullName: event.fullName,
      isDefault: event.isDefault,
      phone: event.phone,
    ));

    if (customerAddress.isRight()) {
      emit(CreateEmployeeAddressSuccess(
        customerAddress.getRight().getOrElse(() => throw UnimplementedError()),
      ));
    } else {
      emit(AddressFailure("Error create emp address"));
    }
  }

  void _onRemoveCustomerAddress(
    RemoveCustomerAddressEvent event,
    Emitter<AddressState> emit,
  ) async {
    final customerAddress =
        await _removeCustomerAddress.call(RemoveCustomerAddressParams(
      id: event.id,
    ));

    if (customerAddress.isRight()) {
      emit(RemoveCustomerAddressSuccess(
        customerAddress.getRight().getOrElse(() => throw UnimplementedError()),
      ));
    } else {
      emit(AddressFailure("Error remove customer address"));
    }
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
