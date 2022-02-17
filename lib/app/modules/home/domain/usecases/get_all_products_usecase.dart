import 'package:dartz/dartz.dart';

import 'package:crud_product/app/modules/home/domain/repositories/product_repository_interface.dart';

import '../entities/pruduct_entity.dart';
import '../erros/erros.dart';

abstract class GetAllProductsUsecaseInterface {
  Future<Either<Failure, List<ProductEntity>>> call();
}

class GetAllProductsUsecase implements GetAllProductsUsecaseInterface {
  final ProductRepositoryInterface repository;
  GetAllProductsUsecase({
    required this.repository,
  });
  @override
  Future<Either<Failure, List<ProductEntity>>> call() async {
    return await repository.getAllProducts();
  }
}
