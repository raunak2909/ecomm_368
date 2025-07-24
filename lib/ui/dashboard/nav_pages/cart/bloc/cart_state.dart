
import '../../../../../data/remote/models/cart_model.dart';

abstract class CartState {}

class CartInitialState extends CartState {}
class CartLoadingState extends CartState {}
class CartSuccessState extends CartState {}
class CartLoadedState extends CartState {
  List<CartItem> allCartItems;
  CartLoadedState({required this.allCartItems});
}
class CartErrorState extends CartState {
  String errorMsg;
  CartErrorState({required this.errorMsg});
}