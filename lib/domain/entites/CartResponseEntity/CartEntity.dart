import 'CartItemEntity.dart';

/// _id : "66280c0732051602778e9793"
/// cartOwner : "662407a7be8b523235e0c86f"
/// products : [{"count":1,"_id":"66280c0732051602778e9794","product":"6428ebc6dc1175abc65ca0b9","price":160}]
/// totalCartPrice : 160

class CartEntity {
  CartEntity({
      this.id, 
      this.cartOwner, 
      this.products, 
      this.totalCartPrice,});

  String? id;
  String? cartOwner;
  List<CartItemEntity>? products;
  int? totalCartPrice;

}