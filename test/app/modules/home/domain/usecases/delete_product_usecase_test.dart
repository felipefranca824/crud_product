import 'package:crud_product/app/modules/home/domain/entities/pruduct_entity.dart';
import 'package:crud_product/app/modules/home/domain/erros/erros.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:crud_product/app/modules/home/domain/repositories/product_repository_interface.dart';
import 'package:crud_product/app/modules/home/domain/usecases/delete_product_usecase.dart';

class ProductRespositoryMock extends Mock
    implements ProductRepositoryInterface {}

void main() {
  late ProductRepositoryInterface repository;
  late DeleteProductUsecaseInterface usecase;

  setUp(() {
    repository = ProductRespositoryMock();
    usecase = DeleteProductUsecase(repository: repository);
  });

  const product = ProductEntity(
      id: '2',
      title: 'title',
      description: 'description',
      price: 5,
      image: 'image');

  test('should return true if success', () async {
    when(() => repository.deleteProduct(product: product))
        .thenAnswer((_) async => const Right(true));

    final result = await usecase(product: product);

    expect(result, const Right(true));

    verify(() => repository.deleteProduct(product: product)).called(1);
  });

  test('should return a Failure if don\'t success', () async {
    final DeleteProductFailure failure =
        DeleteProductFailure(message: 'falha ao deletar produto');
    when(() => repository.deleteProduct(product: product))
        .thenAnswer((_) async => Left(failure));

    final result = await usecase(product: product);

    expect(result, Left(failure));

    verify(() => repository.deleteProduct(product: product)).called(1);
  });
}
