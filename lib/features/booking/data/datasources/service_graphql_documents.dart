
class ServiceGraphqlDocuments {
  static String getAllServicesQuery = """
    query GetAllServices {
      getAllServices {
        id
        name
        imageUri
        description
      }
    }""";

  static String getServiceByIdQuery = """
    query GetServiceById(\$id: String) {
      getServiceById(id: \$id) {
        id
        name
        imageUri
        description
      }
    }""";
}
