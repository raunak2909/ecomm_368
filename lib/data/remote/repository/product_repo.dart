import 'package:ecomm_368/data/remote/helper/api_helper.dart';
import 'package:ecomm_368/utils/constants/app_urls.dart';

class ProductRepository {
  ApiHelper apiHelper;
  ProductRepository({required this.apiHelper});

  getAllProducts() async{
    try{

      dynamic mData = await apiHelper.postApi(url: AppUrls.getProducts);
      return mData;

    } catch(e){
      rethrow;
    }
  }

}