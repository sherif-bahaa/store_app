
import 'package:store_app/helper/api.dart';
import 'package:store_app/models/product_models.dart';


class CategoriesServices {
  Future<List<ProductModels>> getCategoriesProduct(
      {required String categoryName}) async {
    
      List<dynamic> data = await Api().get(url: 'https://fakestoreapi.com/products/category/$categoryName',token: null);
      List<ProductModels> productlist = [];
      for (int i = 0; i < data.length; i++) {
        productlist.add(ProductModels.fromJson(data[i]));
      }
      return productlist;
   
  }
}
//https://fakestoreapi.com/products/category/$categoryName
