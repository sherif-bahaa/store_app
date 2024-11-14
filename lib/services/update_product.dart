import 'package:store_app/helper/api.dart';
import 'package:store_app/models/product_models.dart';

class UpdateProduct {
  Future<ProductModels> updateproduct({
    required String title,
    required String price,
    required String description,
    required String category,
    required String image,
    required int id,
  }) async {
    print('id=$id');
    Map<String, dynamic> data = await Api().put(
        url: "https://fakestoreapi.com/products/$id",
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
