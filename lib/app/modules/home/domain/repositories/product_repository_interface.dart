import 'package:crud_product/app/modules/home/domain/entities/pruduct_entity.dart';
import 'package:crud_product/app/modules/home/domain/erros/erros.dart';
import 'package:dartz/dartz.dart';

abstract class ProductRepositoryInterface {
  Future<Either<Failure, List<ProductEntity>>> getAllProducts();
  Future<Either<Failure, bool>> deleteProduct({required ProductEntity product});
}
