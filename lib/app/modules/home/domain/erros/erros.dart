abstract class Failure implements Exception {
  String get message;
}

class GetAllProductsFailure extends Failure {
  @override
  final String message;

  GetAllProductsFailure({
    required this.message,
  });
}
