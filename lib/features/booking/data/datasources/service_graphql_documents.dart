class ServiceGraphqlDocuments {
  static String getAllServicesQuery = """
    query GetAllServices {
      getAllServices {
        id
        name
        imageUri
        serviceCode
      }
    }""";

  static String getServiceByIdQuery = """
   query GetServiceById(\$id: String) {
      getServiceById(id: \$id) {
        id
        name
        serviceDetails {
          id
          name
          imageUri
          fee
        }
      }
    }""";
}
