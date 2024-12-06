import 'package:atele_online/core/utils/app_colors.dart';
import 'package:atele_online/feature/categories/data/model/item_detalis.dart';
import 'package:atele_online/feature/categories/presentation/views/items_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDressCard extends StatelessWidget {
  const CustomDressCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 16.h),
        SizedBox(
          height: 555.h,
          child: GridView.builder(
              
              itemCount: listItemDetalis.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 10,
                mainAxisExtent: 350,
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ItemView(),));
                  },
                  child: Column(
                    children: [
                      Card(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        elevation: 8,
                        color: Colors.grey[300],
                        child: Container(
                          height: 200.h,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: const Color.fromARGB(255, 243, 243, 123),
                                width: 2),
                            borderRadius: BorderRadius.circular(8.r),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                    listItemDetalis[index].imageItem),
                                scale: 5),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),


                      Text(
                        listItemDetalis[index].description,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blueGrey),
                      ),
                      Text(
                        listItemDetalis[index].price,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.orange),
                      ),
                      Text(
                        listItemDetalis[index].ateleName,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      Text(
                    listItemDetalis[index].address,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.orange),
                      ),
                    ],
                  ),
                );
              }),
        ),
      ],
    );
  }
}
