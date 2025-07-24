import 'package:ecomm_368/data/remote/helper/api_helper.dart';
import 'package:ecomm_368/utils/constants/app_urls.dart';

class CartRepository {
  ApiHelper apiHelper;
  CartRepository({required this.apiHelper});

  Future<dynamic> addToCart({required int productId, required int qty}) async{

    try{
      return await apiHelper.postApi(url: AppUrls.addToCart, mBodyParams: {
        "product_id":productId,
        "quantity":qty
      });

    } catch(e){
      rethrow;
    }

  }

  Future<dynamic> fetchAllCartItems() async{
    try{
      return await apiHelper.getApi(url: AppUrls.viewCart);
    } catch(e){
      rethrow;
    }


  }

}