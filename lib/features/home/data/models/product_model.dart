import 'package:alexapps_task/features/home/domain/entities/product.dart';

class ProductModel extends Product {
  const ProductModel({
    required super.id,
    super.isFavorite,
    required super.name,
    required super.subName,
    required super.cost,
    required super.imagePath,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      isFavorite: json['isFavorite'] ?? false,
      name: json['name'],
      subName: json['subName'],
      cost: (json['cost'] as num).toDouble(),
      imagePath: json['imagePath'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'isFavorite': isFavorite,
      'name': name,
      'subName': subName,
      'cost': cost,
      'imagePath': imagePath,
    };
  }
}
