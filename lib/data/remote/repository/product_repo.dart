import 'package:ecomm_368/data/remote/helper/api_helper.dart';
import 'package:ecomm_368/utils/constants/app_urls.dart';

import '../models/product_model.dart';

class ProductRepository {
  ApiHelper apiHelper;
  ProductRepository({required this.apiHelper});

  Future<List<ProductModel>> getAllProducts() async{
    try{

      dynamic mData = await apiHelper.postApi(url: AppUrls.getProducts);
      return ProductDataModel.fromJson(mData).data;

    } catch(e){
      rethrow;
    }
  }

}