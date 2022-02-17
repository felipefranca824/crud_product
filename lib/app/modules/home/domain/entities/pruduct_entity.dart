import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final String id;
  final String title;
  final String description;
  final double price;
  final String image;
  const ProductEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.image,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        price,
        image,
      ];
}
