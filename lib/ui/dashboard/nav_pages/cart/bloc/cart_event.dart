import 'package:ecomm_368/data/remote/models/cart_model.dart';

abstract class CartEvent{}

class AddCartEvent extends CartEvent{
  int productId;
  int quantity;
  AddCartEvent({required this.productId,required this.quantity});
}
class FetchAllCartEvent extends CartEvent{}