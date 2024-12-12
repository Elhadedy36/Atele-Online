import 'package:atele_online/core/functions/custom_appbar.dart';
import 'package:atele_online/core/functions/navigation.dart';
import 'package:atele_online/feature/store/data/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ItemView extends StatelessWidget {
  const ItemView({super.key});
 

  @override
  Widget build(BuildContext context) {
final extraData = GoRouter.of(context).state!.extra as ProductModel;

    return Scaffold(
      endDrawer: const Drawer(),
      appBar: customAppBar(title: 'Dress Details'),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
            child: Container(
              child: Image(image: NetworkImage(extraData.images),)),
          ),
          Center(
              child: Text(
            extraData.categoryName,
            style: const TextStyle(
                color: Colors.blueGrey,
                fontWeight: FontWeight.bold,
                fontSize: 18),
          )),
          Center(
              child: Text(
            extraData.categoryName,
            style: const TextStyle(
                color: Colors.orange,
                fontWeight: FontWeight.bold,
                fontSize: 18),
          )),
          Center(
              child: Text(
            extraData.categoryName,
            style: const TextStyle(
                color: Colors.blueGrey,
                fontWeight: FontWeight.bold,
                fontSize: 18),
          )),
          Center(
              child: Text(
            extraData.categoryName,
            style: const TextStyle(
                color: Colors.blueGrey,
                fontWeight: FontWeight.bold,
                fontSize: 18),
          )),
          Center(
              child: Text(
            extraData.categoryName,
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
          )),
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 110,
            ),
            child: MaterialButton(
                color: Colors.black,
                onPressed: () {},
                child: const Text(
                  'Add To Cart',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                )),
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
                )),
          ),
        ],
      ),
    );
  }
}
