import 'package:equatable/equatable.dart';

class Product extends Equatable {
  const Product({
    required this.id,
    this.isFavorite = false,
    required this.name,
    required this.subName,
    required this.cost,
    required this.imagePath,
  });
  final String id;
  final bool isFavorite;
  final String name;
  final String subName;
  final double cost;
  final String imagePath;

  @override
  List<Object?> get props => [id, isFavorite, name, subName, cost, imagePath];
}
