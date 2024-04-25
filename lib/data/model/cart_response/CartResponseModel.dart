import 'package:ecommerce_c10_maadi/domain/entites/CartResponseEntity/CartResponseEntity.dart';

import 'CartModel.dart';

/// status : "success"
/// message : "Product added successfully to your cart"
/// numOfCartItems : 1
/// data : {"_id":"66280c0732051602778e9793","cartOwner":"662407a7be8b523235e0c86f","products":[{"count":1,"_id":"66280c0732051602778e9794","product":"6428ebc6dc1175abc65ca0b9","price":160}],"createdAt":"2024-04-23T19:29:11.876Z","updatedAt":"2024-04-23T19:29:12.072Z","__v":0,"totalCartPrice":160}

class CartResponseModel {
  CartResponseModel({
      this.status, 
      this.message, 
      this.numOfCartItems, 
      this.data,});

  CartResponseModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    numOfCartItems = json['numOfCartItems'];
    data = json['data'] != null ? CartModel.fromJson(json['data']) : null;
  }
  String? status;
  String? message;
  int? numOfCartItems;
  CartModel? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    map['numOfCartItems'] = numOfCartItems;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

  CartResponseEntity toCartResponseEntity(){
    return CartResponseEntity(
      message: message,
      data: data?.toCartEntity(),
      numOfCartItems: numOfCartItems
    );
  }
}