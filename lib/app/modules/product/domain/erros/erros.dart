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
