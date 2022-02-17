abstract class Failure implements Exception {
  String get message;
}

class SaveProductFailure extends Failure {
  @override
  final String message;
  SaveProductFailure({
    required this.message,
  });
}

class UpdateProductFailure extends Failure {
  @override
  final String message;
  UpdateProductFailure({
    required this.message,
  });
}
