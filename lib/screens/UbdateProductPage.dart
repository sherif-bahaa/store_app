import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/models/product_models.dart';
import 'package:store_app/screens/Home_page.dart';
import 'package:store_app/services/update_product.dart';
import 'package:store_app/widgets/custome_pottum.dart';
import 'package:store_app/widgets/custome_text_filed.dart';

class Ubdateproductpage extends StatefulWidget {
  Ubdateproductpage({super.key});
  static String id = 'update product';

  @override
  State<Ubdateproductpage> createState() => _UbdateproductpageState();
}

class _UbdateproductpageState extends State<Ubdateproductpage> {
  String? name, image, desc;

  String? price;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    ProductModels product =
        ModalRoute.of(context)!.settings.arguments as ProductModels;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Update Product')),
        ),
        body: SingleChildScrollView(
          // بتقدر تعمل   scroll  من غير ما تغير الويدجيت
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 100,
              ),
              CustomeTextFiled(
                hintText: "name",
                onChanged: (data) {
                  name = data;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              CustomeTextFiled(
                hintText: "price",
                onChanged: (data) {
                  price = data;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              CustomeTextFiled(
                hintText: "image",
                onChanged: (data) {
                  image = data;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              CustomeTextFiled(
                hintText: "desc",
                onChanged: (data) {
                  desc = data;
                },
              ),
              const SizedBox(
                height: 50,
              ),
              CustomePottum(
                text: "ub date",
                onTap: () async {
                  isLoading = true;
                  setState(() {});

                  try {
                    await UbdateProduct(product);
                    Navigator.pushNamed(context, HomePage.id);
                  } catch (e) {
                    print(e.toString());
                  }
                  isLoading = false;
                  setState(() {});
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> UbdateProduct(ProductModels product) async {
    await UpdateProduct().updateproduct(
        id: product.id,
        title: name == null ? product.title : name!,
        price: price == null ? product.price.toString() : price!,
        description: desc == null ? product.description : desc!,
        category: product.category,
        image: image == null ? product.image : image!);
  }
}
