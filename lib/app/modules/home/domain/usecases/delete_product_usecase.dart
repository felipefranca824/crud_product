import 'package:crud_product/app/modules/home/domain/entities/pruduct_entity.dart';
import 'package:dartz/dartz.dart';

import 'package:crud_product/app/modules/home/domain/erros/erros.dart';
import 'package:crud_product/app/modules/home/domain/repositories/product_repository_interface.dart';

abstract class DeleteProductUsecaseInterface {
  Future<Either<Failure, bool>> call({required ProductEntity product});
}

class DeleteProductUsecase implements DeleteProductUsecaseInterface {
  final ProductRepositoryInterface repository;
  DeleteProductUsecase({
    required this.repository,
  });
  @override
  Future<Either<Failure, bool>> call({required ProductEntity product}) async {
    return await repository.deleteProduct(product: product);
  }
}
