import 'package:crud_product/app/modules/home/domain/entities/pruduct_entity.dart';
import 'package:crud_product/app/modules/home/infra/datasource/product_datasource_interface.dart';
import 'package:crud_product/app/modules/home/infra/models/product_model.dart';
import 'package:crud_product/app/modules/home/infra/repositories/product_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class ProductDatasourceMock extends Mock implements ProductDatasourceInterface {
}

void main() {
  late ProductRepository repository;
  late ProductDatasourceInterface datasource;

  setUp(() {
    datasource = ProductDatasourceMock();
    repository = ProductRepository(datasource: datasource);
  });

  const list = <ProductEntity>[
    ProductEntity(
        id: '2',
        title: 'title',
        description: 'description',
        price: 5,
        image: 'image'),
  ];

  test('should return a list of ProductModel if success', () async {
    when(() => datasource.getAllProducts()).thenAnswer((_) async => list);

    final result = await repository.getAllProducts();

    expect(result, const Right(list));
    verify(() => datasource.getAllProducts()).called(1);
  });
}
