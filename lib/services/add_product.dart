import 'package:store_app/helper/api.dart';
import 'package:store_app/models/product_models.dart';

class AddProduct {
  Future<ProductModels> addProduct({
    required String title,
    required String price,
    required String description,
    required String category,
    required String image,
  }) async {
    Map<String, dynamic> data = await Api().post(
        url: "https://fakestoreapi.com/products",
        body: {
          "title": title,
          "price": price,
          "category": category,
          "description": description,
          "image": image,
        },
        token: null);
    return ProductModels.fromJson(data);
  }
}
