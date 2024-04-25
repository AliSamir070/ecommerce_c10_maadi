import 'package:ecommerce_c10_maadi/domain/entites/CartResponseEntity/CartItemEntity.dart';

/// count : 1
/// _id : "66280c0732051602778e9794"
/// product : "6428ebc6dc1175abc65ca0b9"
/// price : 160

class CartItemModel {
  CartItemModel({
      this.count, 
      this.id, 
      this.product, 
      this.price,});

  CartItemModel.fromJson(dynamic json) {
    count = json['count'];
    id = json['_id'];
    product = json['product'];
    price = json['price'];
  }
  int? count;
  String? id;
  String? product;
  int? price;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['count'] = count;
    map['_id'] = id;
    map['product'] = product;
    map['price'] = price;
    return map;
  }

  CartItemEntity toCartItemEntity(){
    return CartItemEntity(
      price: price,
      id: id,
      count: count,
      product: product
    );
  }
}