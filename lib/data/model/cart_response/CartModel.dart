import 'package:ecommerce_c10_maadi/domain/entites/CartResponseEntity/CartEntity.dart';

import 'CartItemModel.dart';

/// _id : "66280c0732051602778e9793"
/// cartOwner : "662407a7be8b523235e0c86f"
/// products : [{"count":1,"_id":"66280c0732051602778e9794","product":"6428ebc6dc1175abc65ca0b9","price":160}]
/// createdAt : "2024-04-23T19:29:11.876Z"
/// updatedAt : "2024-04-23T19:29:12.072Z"
/// __v : 0
/// totalCartPrice : 160

class CartModel {
  CartModel({
      this.id, 
      this.cartOwner, 
      this.products, 
      this.createdAt, 
      this.updatedAt, 
      this.v, 
      this.totalCartPrice,});

  CartModel.fromJson(dynamic json) {
    id = json['_id'];
    cartOwner = json['cartOwner'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(CartItemModel.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    totalCartPrice = json['totalCartPrice'];
  }
  String? id;
  String? cartOwner;
  List<CartItemModel>? products;
  String? createdAt;
  String? updatedAt;
  int? v;
  int? totalCartPrice;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['cartOwner'] = cartOwner;
    if (products != null) {
      map['products'] = products?.map((v) => v.toJson()).toList();
    }
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    map['totalCartPrice'] = totalCartPrice;
    return map;
  }

  CartEntity toCartEntity(){
    return CartEntity(
      id: id,
      cartOwner: cartOwner,
      totalCartPrice: totalCartPrice,
      products: products?.map((cartItemModel) => cartItemModel.toCartItemEntity()).toList()
    );
  }
}