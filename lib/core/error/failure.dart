abstract class Failure {
  String message;

  Failure({required this.message});
}

class ServerFailure extends Failure {
  ServerFailure({required String message}) : super(message: message);
}

class ConnectionFailure extends Failure {
  ConnectionFailure({required String message}) : super(message: message);
}
