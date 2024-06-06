class Service {
  final String? id;
  final String? name;
  final String? serviceCode;
  final String? description;
  final String? imageUri;
  final List<ServiceDetails>? serviceDetails;

  Service({
    this.id,
    this.name,
    this.description,
    this.imageUri,
    this.serviceCode,
    this.serviceDetails,
  });
}

class ServiceDetails {
  final String? id;
  final String? name;
  final String? description;
  final String? imageUri;
  final String? serviceDetailCode;
  final int? fee;
  final String? serviceId;

  ServiceDetails({
    this.id,
    this.name,
    this.description,
    this.imageUri,
    this.serviceDetailCode,
    this.fee,
    this.serviceId,
  });
}
