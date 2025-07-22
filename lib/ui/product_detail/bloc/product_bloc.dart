import 'package:ecomm_368/data/remote/models/product_model.dart';
import 'package:ecomm_368/data/remote/repository/product_repo.dart';
import 'package:ecomm_368/ui/product_detail/bloc/product_event.dart';
import 'package:ecomm_368/ui/product_detail/bloc/product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState>{
  ProductRepository productRepository;
  ProductBloc({required this.productRepository}) : super(ProductInitialState()){

    on<GetAllProductEvent>((event, emit) async{
      emit(ProductLoadingState());
      try{
        List<ProductModel> allProducts = await productRepository.getAllProducts();
        emit(ProductLoadedState(mProducts: allProducts));
      } catch (e){
        emit(ProductErrorState(errorMsg: e.toString()));
      }

    });

  }

}