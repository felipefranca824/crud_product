import 'package:crud_product/app/modules/home/domain/entities/pruduct_entity.dart';
import 'package:crud_product/app/modules/product/domain/erros/erros.dart';
import 'package:crud_product/app/modules/product/domain/repositories/product_repository_interface.dart';
import 'package:crud_product/app/modules/product/domain/usecases/update_product_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class ProductRespositoryMock extends Mock
    implements ProductRepositoryInterface {}

void main() {
  late ProductRepositoryInterface repository;
  late UpdateProductUsecaseInterface usecase;

  setUp(() {
    repository = ProductRespositoryMock();
    usecase = UpdateProductUsecase(repository: repository);
  });

  const product = ProductEntity(
      id: '2',
      title: 'title',
      description: 'description',
      price: 5,
      image: 'image');

  test('should return a ProductEntity if success', () async {
    when(() => repository.updateProduct(product: product))
        .thenAnswer((_) async => const Right(product));

    final result = await usecase(product: product);

    expect(result, const Right(product));

    verify(() => repository.updateProduct(product: product)).called(1);
  });

  test('should return a UpdateProductFailure if don\'t success', () async {
    final UpdateProductFailure failure =
        UpdateProductFailure(message: 'falha ao salvar produto');
    when(() => repository.updateProduct(product: product))
        .thenAnswer((_) async => Left(failure));

    final result = await usecase(product: product);

    expect(result, Left(failure));

    verify(() => repository.updateProduct(product: product)).called(1);
  });
}
