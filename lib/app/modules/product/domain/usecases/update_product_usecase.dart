import 'package:dartz/dartz.dart';

import 'package:crud_product/app/modules/product/domain/repositories/product_repository_interface.dart';

import '../../../home/domain/entities/pruduct_entity.dart';
import '../erros/erros.dart';

abstract class UpdateProductUsecaseInterface {
  Future<Either<Failure, ProductEntity>> call({required ProductEntity product});
}

class UpdateProductUsecase implements UpdateProductUsecaseInterface {
  ProductRepositoryInterface repository;

  UpdateProductUsecase({
    required this.repository,
  });

  @override
  Future<Either<Failure, ProductEntity>> call(
      {required ProductEntity product}) async {
    return await repository.updateProduct(product: product);
  }
}
