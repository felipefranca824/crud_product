import 'package:crud_product/app/modules/home/domain/entities/pruduct_entity.dart';

abstract class ProductDatasourceInterface {
  Future<List<ProductEntity>> getAllProducts();
  Future<bool> deleteProduct(ProductEntity product);
}
