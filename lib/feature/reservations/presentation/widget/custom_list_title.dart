import 'package:atele_online/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CustomListTitle extends StatelessWidget {
  const CustomListTitle(
      {super.key,
      required this.image,
      required this.title,
      required this.trallingText,
      required this.subtitle});
  final ImageProvider<Object> image;
  final String title;
  final String trallingText;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80.h,
      child: ListView.builder(
      
        itemCount:1,
        itemBuilder: (context, index) {
          return
        Padding(
          padding:  EdgeInsets.only(top: 6.h, right: 30.w, left: 30.w, bottom: 0),
          child: ListTile(
            enabled: true,
            leading: Container(
              decoration: BoxDecoration(
                // border: Border.all(color: AppColors.primaryColor,width: 2),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Image(
                image: image,
                fit: BoxFit.cover,
              ),
            ),
            title: Text(
              title,
              style: const TextStyle(color: Colors.black),
            ),
            subtitle: Text(
              subtitle,
              style: const TextStyle(color: Colors.orange),
            ),
            trailing: Text(
              trallingText,
              style: const TextStyle(color: AppColors.primaryColor, fontSize: 14),
            ),
          ),
        );
      }),
    );
  }
}
