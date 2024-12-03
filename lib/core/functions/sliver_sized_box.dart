
import 'package:flutter/material.dart';

SliverToBoxAdapter SliverSizedBox(double height) {
  return SliverToBoxAdapter(
    child: SizedBox(
      height: height,
    ),
  );
}
