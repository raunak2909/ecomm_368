import 'package:ecomm_368/data/remote/models/cart_model.dart';
import 'package:ecomm_368/data/remote/repository/cart_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cart_event.dart';
import 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartRepository cartRepo;

  CartBloc({required this.cartRepo}) : super(CartInitialState()) {
    on<AddCartEvent>((event, emit) async{
      try {
        emit(CartLoadingState());
        dynamic res = await cartRepo.addToCart(productId: event.productId, qty: event.quantity);

        if(res["status"]=="true"||res["status"]){
          emit(CartSuccessState());
        } else {
          emit(CartErrorState(errorMsg: res["message"]));
        }


      } catch (e) {
        emit(CartErrorState(errorMsg: e.toString()));
      }
    });

    on<FetchAllCartEvent>((event, emit) async{

      try{
        emit(CartLoadingState());
        dynamic res = await cartRepo.fetchAllCartItems();

        if(res["status"]=="true"||res["status"]){
          CartResponseModel cartResModel = CartResponseModel.fromJson(res);
          emit(CartLoadedState(allCartItems: cartResModel.data));
        } else {
          emit(CartErrorState(errorMsg: res["message"]));
        }

      } catch(e){
        emit(CartErrorState(errorMsg: e.toString()));
      }

    });
  }
}
