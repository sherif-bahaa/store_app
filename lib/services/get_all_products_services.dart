
import 'package:store_app/helper/api.dart';
import 'package:store_app/models/product_models.dart';

class AllProductsServices {
  Future<List<ProductModels>> GetALLProducts() async {
    List<dynamic> data = await Api().get(
      url: 'https://fakestoreapi.com/products',
      token: null,
    );
    List<ProductModels> productlist = [];
    for (int i = 0; i < data.length; i++) {
      productlist.add(ProductModels.fromJson(data[i]));
    }
    return productlist;
    
  }
}
