class MyException implements Exception{
  String title;
  String message;

  MyException({required this.title, required this.message});

  @override
  String toString() {
    return "Exception: $title, Message: $message";
  }

}

class NetworkException extends MyException {
  NetworkException({required String message}) : super(title: "No Internet", message: message);
}

class ServerException extends MyException {
  ServerException({required String message})
      : super(title: "Server Error", message: message);
}

class InvalidInputException extends MyException {
  InvalidInputException({required String message})
      : super(title: "Invalid Input", message: message);
}

class UnauthorizedException extends MyException {
  UnauthorizedException({required String message})
      : super(title: "Unauthorized", message: message);
}

