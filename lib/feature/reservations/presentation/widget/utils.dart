import 'package:flutter/material.dart';

// class Utils{
//   static List<Widget> modelBuilder<M>(
//     List<M>models,Widget Function(int index,M model)
  
//   models.asMap().map<int,Widget>(
//     (index,model)=>MapEntry(index,builder(index,lable))
//   )
//   ).values.toList();
// }


class Utils {
  static List<Widget> modelBuilder<M>(
          List<M> models, Widget Function(int index, M model) builder) =>
      models
          .asMap()
          .map<int, Widget>(
              (index, model) => MapEntry(index, builder(index, model)))
          .values
          .toList();
}