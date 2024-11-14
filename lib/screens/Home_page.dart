import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_app/models/product_models.dart';
import 'package:store_app/services/get_all_products_services.dart';
import 'package:store_app/widgets/custome_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static String id = 'HomePage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF2D3E50),
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(FontAwesomeIcons.cartShopping))
          ],
          backgroundColor: Color(0xFFF0F0F0),
          elevation: 0,
          centerTitle: true,
          title: const Text('New Trend'),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 40),
          child: FutureBuilder<List<ProductModels>>(
              future: AllProductsServices().GetALLProducts(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (snapshot.hasData) {
                  List<ProductModels> product = snapshot.data!;
                  return GridView.builder(
                    itemCount: product.length,
                    clipBehavior: Clip.none,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.5,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 35,
                    ),
                    itemBuilder: (context, index) {
                      return CustomeCard(
                        product: product[index],
                      );
                    },
                  );
                } else {
                  return const Center(child: Text('No data available'));
                }
              }),
        ));
  }
}
