class NotificationEmployee {
  final String id;
  final String description;
  final String? imageUri;
  final String employeeId;

  NotificationEmployee({
    required this.id,
    required this.description,
    this.imageUri,
    required this.employeeId,
  });
}

class NotificationCustomer {
  final String id;
  final String description;
  final String? imageUri;
  final String customerId;

  NotificationCustomer({
    required this.id,
    required this.description,
    this.imageUri,
    required this.customerId,
  });
}
