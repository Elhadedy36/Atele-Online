import 'package:atele_online/core/cubits/cubit/shared_data_cubit.dart';
import 'package:atele_online/core/functions/custom_appbar.dart';
import 'package:atele_online/core/functions/navigation.dart';
import 'package:atele_online/feature/store/data/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemView extends StatelessWidget {
  const ItemView({super.key});

  @override
  Widget build(BuildContext context) {
    // Using BlocBuilder to listen to StoreCubit and get selected product
    return BlocBuilder<SharedDataCubit, Map<String, dynamic>>(
      builder: (context, state) {
        final product = state['selectedProduct'] as ProductModel?;

        if (product == null) {
          return Scaffold(
            body: Center(
              child: Text('No product data available'),
            ),
          );
        }

        return Scaffold(
          endDrawer: const Drawer(),
          appBar: customAppBar(title: 'Dress Details'),
          body: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
                child: Container(
                  child: Image(image: NetworkImage(product.productImages)),
                ),
              ),
              Center(
                child: Text(
                  product.categoryName,
                  style: const TextStyle(
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ),
              Center(
                child: Text(
                  product.productDescription,
                  style: const TextStyle(
                      color: Colors.orange,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ),
              Center(
                child: Text(
                  '\$${product.depositeAmount}',
                  style: const TextStyle(
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ),
              Center(
                child: Text(
                  product.productName,
                  style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 110,
                ),
                child: MaterialButton(
                  color: Colors.black,
                  onPressed: () {
                    // Handle Add to Cart
                  },
                  child: const Text(
                    'Add To Cart',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 110,
                ),
                child: MaterialButton(
                  color: Colors.black,
                  onPressed: () {
                    customNavigate(context, path: '/DataAndTimeView');
                  },
                  child: const Text(
                    'Buy Now',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}