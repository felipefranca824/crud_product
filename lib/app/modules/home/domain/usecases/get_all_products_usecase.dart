import 'package:dartz/dartz.dart';

import 'package:crud_product/app/modules/home/domain/repositories/product_repository_interface.dart';

import '../entities/pruduct_home_entity.dart';
import '../erros/erros.dart';

abstract class GetAllProductsUsecaseInterface {
  Future<Either<Failure, List<ProductHomeEntity>>> call();
}

class GetAllProductsUsecase implements GetAllProductsUsecaseInterface {
  final ProductRepositoryInterface repository;
  GetAllProductsUsecase({
    required this.repository,
  });
  @override
  Future<Either<Failure, List<ProductHomeEntity>>> call() async {
    return await repository.getAllProducts();
  }
}
