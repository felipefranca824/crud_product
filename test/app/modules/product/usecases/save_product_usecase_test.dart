import 'package:crud_product/app/modules/home/domain/entities/pruduct_entity.dart';
import 'package:crud_product/app/modules/product/domain/entities/save_product_entity.dart';
import 'package:crud_product/app/modules/product/domain/erros/erros.dart';
import 'package:crud_product/app/modules/product/domain/repositories/product_repository_interface.dart';
import 'package:crud_product/app/modules/product/domain/usecases/save_product_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class ProductRespositoryMock extends Mock
    implements ProductRepositoryInterface {}

void main() {
  late ProductRepositoryInterface repository;
  late SaveProductUsecaseInterface usecase;

  setUp(() {
    repository = ProductRespositoryMock();
    usecase = SaveProductUsecase(repository: repository);
  });

  const product = ProductEntity(
      id: '2',
      title: 'title',
      description: 'description',
      price: 5,
      image: 'image');

  const productSave = SaveProductEntity(
      title: 'title', description: 'description', price: 5, image: 'image');

  test('should return a ProductEntity if success', () async {
    when(() => repository.saveProduct(product: productSave))
        .thenAnswer((_) async => const Right(product));

    final result = await usecase(product: productSave);

    expect(result, const Right(product));

    verify(() => repository.saveProduct(product: productSave)).called(1);
  });

  test('should return a SaveProductFailure if don\'t success', () async {
    final SaveProductFailure failure =
        SaveProductFailure(message: 'falha ao salvar produto');
    when(() => repository.saveProduct(product: productSave))
        .thenAnswer((_) async => Left(failure));

    final result = await usecase(product: productSave);

    expect(result, Left(failure));

    verify(() => repository.saveProduct(product: productSave)).called(1);
  });
}
