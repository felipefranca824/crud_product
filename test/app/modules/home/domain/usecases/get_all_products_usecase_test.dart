import 'package:crud_product/app/modules/home/domain/entities/pruduct_home_entity.dart';
import 'package:crud_product/app/modules/home/domain/erros/erros.dart';
import 'package:crud_product/app/modules/home/domain/repositories/product_repository_interface.dart';
import 'package:crud_product/app/modules/home/domain/usecases/get_all_products_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class ProductRespositoryMock extends Mock
    implements ProductRepositoryInterface {}

void main() {
  late ProductRepositoryInterface repository;
  late GetAllProductsUsecaseInterface usecase;

  setUp(() {
    repository = ProductRespositoryMock();
    usecase = GetAllProductsUsecase(repository: repository);
  });

  const listProducts = <ProductHomeEntity>[
    ProductHomeEntity(
      id: '2',
      title: 'title',
      description: 'description',
      price: 5,
      image: 'image',
    ),
    ProductHomeEntity(
        id: '5',
        title: 'title',
        description: 'description',
        price: 10,
        image: 'image'),
  ];

  test('should a list of Products if success', () async {
    when(() => repository.getAllProducts())
        .thenAnswer((_) async => const Right(listProducts));

    final result = await usecase();

    expect(result, const Right(listProducts));

    verify(() => repository.getAllProducts()).called(1);
  });

  test('should a Failure if don\'t success', () async {
    final GetAllProductsFailure failure =
        GetAllProductsFailure(message: 'Falha ao buscar produtos');
    when(() => repository.getAllProducts())
        .thenAnswer((_) async => Left(failure));

    final result = await usecase();

    expect(result, Left(failure));

    verify(() => repository.getAllProducts()).called(1);
  });
}
