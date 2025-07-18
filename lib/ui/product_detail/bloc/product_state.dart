abstract class ProductState{}

class ProductInitialState extends ProductState{}
class ProductLoadingState extends ProductState{}
class ProductLoadedState extends ProductState{
  List<Map<String, dynamic>> mProducts;
  ProductLoadedState({required this.mProducts});
}
class ProductErrorState extends ProductState{
  String errorMsg;
  ProductErrorState({required this.errorMsg});
}