import 'package:collection/collection.dart';

import 'cart.dart';

class RespModel {
  List<Cart>? carts;
  int? total;
  int? skip;
  int? limit;

  RespModel({this.carts, this.total, this.skip, this.limit});

  factory RespModel.fromJson(Map<String, dynamic> json) => RespModel(
        carts: (json['carts'] as List<dynamic>?)
            ?.map((e) => Cart.fromJson(e as Map<String, dynamic>))
            .toList(),
        total: json['total'] as int?,
        skip: json['skip'] as int?,
        limit: json['limit'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'carts': carts?.map((e) => e.toJson()).toList(),
        'total': total,
        'skip': skip,
        'limit': limit,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! RespModel) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      carts.hashCode ^ total.hashCode ^ skip.hashCode ^ limit.hashCode;
}
