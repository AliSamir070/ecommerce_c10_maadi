import 'CartEntity.dart';

/// message : "Product added successfully to your cart"
/// numOfCartItems : 1
/// data : {"_id":"66280c0732051602778e9793","cartOwner":"662407a7be8b523235e0c86f","products":[{"count":1,"_id":"66280c0732051602778e9794","product":"6428ebc6dc1175abc65ca0b9","price":160}],"totalCartPrice":160}

class CartResponseEntity {
  CartResponseEntity({
      this.message, 
      this.numOfCartItems, 
      this.data,});
  String? message;
  int? numOfCartItems;
  CartEntity? data;

}