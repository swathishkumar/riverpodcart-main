import 'package:collection/collection.dart';

import 'product.dart';

class Cart {
  int? id;
  List<Product>? products;
  double? total;
  double? discountedTotal;
  int? userId;
  int? totalProducts;
  int? totalQuantity;

  Cart({
    this.id,
    this.products,
    this.total,
    this.discountedTotal,
    this.userId,
    this.totalProducts,
    this.totalQuantity,
  });

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        id: json['id'] as int?,
        products: (json['products'] as List<dynamic>?)
            ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
            .toList(),
        total: (json['total'] as num?)?.toDouble(),
        discountedTotal: (json['discountedTotal'] as num?)?.toDouble(),
        userId: json['userId'] as int?,
        totalProducts: json['totalProducts'] as int?,
        totalQuantity: json['totalQuantity'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'products': products?.map((e) => e.toJson()).toList(),
        'total': total,
        'discountedTotal': discountedTotal,
        'userId': userId,
        'totalProducts': totalProducts,
        'totalQuantity': totalQuantity,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Cart) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      id.hashCode ^
      products.hashCode ^
      total.hashCode ^
      discountedTotal.hashCode ^
      userId.hashCode ^
      totalProducts.hashCode ^
      totalQuantity.hashCode;
}
