import 'package:crud_product/app/modules/home/domain/entities/pruduct_entity.dart';

class ProductModel extends ProductEntity {
  const ProductModel(
      {required String id,
      required String title,
      required String description,
      required double price,
      required String image})
      : super(
            id: id,
            title: title,
            description: description,
            price: price,
            image: image);
}
