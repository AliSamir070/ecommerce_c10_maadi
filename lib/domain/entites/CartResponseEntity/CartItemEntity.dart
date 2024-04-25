/// count : 1
/// _id : "66280c0732051602778e9794"
/// product : "6428ebc6dc1175abc65ca0b9"
/// price : 160

class CartItemEntity {
  CartItemEntity({
      this.count, 
      this.id, 
      this.product, 
      this.price,});

  int? count;
  String? id;
  String? product;
  int? price;

}