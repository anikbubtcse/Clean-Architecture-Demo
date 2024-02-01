class Constants {
  static const String baseUrl = 'https://jsonplaceholder.typicode.com/users';

  static String getUrl(String id) {
    return '$baseUrl?id=$id';
  }
}
