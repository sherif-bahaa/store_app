import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_app/models/product_models.dart';
import 'package:store_app/screens/UbdateProductPage.dart';

class CustomeCard extends StatelessWidget {
  CustomeCard({required this.product, super.key});
  ProductModels product;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, Ubdateproductpage.id, arguments: product);
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: const EdgeInsets.all(7),
            child: Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.title.substring(0, 6),
                      style: const TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(r'$' '${product.price.toString()}'),
                          const Icon(
                            FontAwesomeIcons.solidHeart,
                            color: Colors.red,
                          )
                        ])
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            right: 25,
            top: -30,
            child: Image.network(
              product.image,
              height: 80,
              width: 70,
            ),
          )
        ],
      ),
    );
  }
}
