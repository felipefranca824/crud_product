import 'package:dartz/dartz.dart';

import 'package:crud_product/app/modules/home/domain/entities/pruduct_entity.dart';
import 'package:crud_product/app/modules/home/domain/erros/erros.dart';

import '../../domain/repositories/product_repository_interface.dart';
import '../datasource/product_datasource_interface.dart';

class ProductRepository implements ProductRepositoryInterface {
  final ProductDatasourceInterface datasource;
  ProductRepository({
    required this.datasource,
  });

  @override
  Future<Either<Failure, bool>> deleteProduct(
      {required ProductEntity product}) async {
    try {
      final result = await datasource.deleteProduct(product);
      return Right(result);
    } catch (e) {
      return Left(DeleteProductFailure(message: 'Falha ao excluir produto'));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getAllProducts() async {
    try {
      final result = await datasource.getAllProducts();
      return Right(result);
    } catch (e) {
      return Left(GetAllProductsFailure(message: 'Erro ao buscar produtos'));
    }
  }
}
