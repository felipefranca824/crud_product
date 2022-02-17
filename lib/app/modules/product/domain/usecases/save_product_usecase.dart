import 'package:dartz/dartz.dart';

import 'package:crud_product/app/modules/home/domain/entities/pruduct_entity.dart';

import 'package:crud_product/app/modules/product/domain/entities/save_product_entity.dart';

import '../erros/erros.dart';
import '../repositories/product_repository_interface.dart';

abstract class SaveProductUsecaseInterface {
  Future<Either<Failure, ProductEntity>> call(
      {required SaveProductEntity product});
}

class SaveProductUsecase implements SaveProductUsecaseInterface {
  ProductRepositoryInterface repository;
  SaveProductUsecase({
    required this.repository,
  });

  @override
  Future<Either<Failure, ProductEntity>> call(
      {required SaveProductEntity product}) async {
    return await repository.saveProduct(product: product);
  }
}
