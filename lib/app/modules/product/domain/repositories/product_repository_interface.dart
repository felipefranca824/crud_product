import 'package:crud_product/app/modules/home/domain/entities/pruduct_entity.dart';
import '../erros/erros.dart';
import 'package:crud_product/app/modules/product/domain/entities/save_product_entity.dart';
import 'package:dartz/dartz.dart';

abstract class ProductRepositoryInterface {
  Future<Either<Failure, ProductEntity>> saveProduct(
      {required SaveProductEntity product});
  Future<Either<Failure, ProductEntity>> updateProduct(
      {required ProductEntity product});
}
