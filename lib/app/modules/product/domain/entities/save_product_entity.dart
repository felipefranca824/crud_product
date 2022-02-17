import 'package:equatable/equatable.dart';

class SaveProductEntity extends Equatable {
  final String title;
  final String description;
  final double price;
  final String image;

  const SaveProductEntity({
    required this.title,
    required this.description,
    required this.price,
    required this.image,
  });

  @override
  List<Object?> get props => [
        title,
        description,
        price,
        image,
      ];
}
