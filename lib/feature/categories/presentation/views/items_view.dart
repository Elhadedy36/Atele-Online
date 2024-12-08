import 'package:atele_online/core/functions/custom_appbar.dart';
import 'package:atele_online/core/functions/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemView extends StatelessWidget {
  const ItemView({super.key, this.data});
  final data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const Drawer(),
      appBar: customAppBar(title: 'Dress Details'),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
            child: Container(
                child: Image(
              image: AssetImage(data.imageItem),
            )),
          ),
          Center(
              child: Text(
            data.description,
            style: const TextStyle(
                color: Colors.blueGrey,
                fontWeight: FontWeight.bold,
                fontSize: 18),
          )),
          Center(
              child: Text(
            data.price,
            style: const TextStyle(
                color: Colors.orange,
                fontWeight: FontWeight.bold,
                fontSize: 18),
          )),
          Center(
              child: Text(
            data.ateleName,
            style: const TextStyle(
                color: Colors.blueGrey,
                fontWeight: FontWeight.bold,
                fontSize: 18),
          )),
          Center(
              child: Text(
            data.phone,
            style: const TextStyle(
                color: Colors.blueGrey,
                fontWeight: FontWeight.bold,
                fontSize: 18),
          )),
          Center(
              child: Text(
            data.address,
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
