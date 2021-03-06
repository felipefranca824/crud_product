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

class DeleteProductFailure extends Failure {
  @override
  final String message;
  DeleteProductFailure({
    required this.message,
  });
}
