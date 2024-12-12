import 'package:atele_online/core/functions/custom_appbar.dart';
import 'package:atele_online/feature/reservations/presentation/widget/custom_chackout_builder.dart';
import 'package:atele_online/feature/reservations/presentation/widget/custom_slider.dart';
import 'package:flutter/material.dart';

class ChackoutView extends StatelessWidget {
  const ChackoutView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: 'Chackout', actions: []),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: CustomScrollView(
        
          slivers: [
          SliverToBoxAdapter(
            child: CustomSliderThem(
              indexTop: 1,
            ),
          ),
          const SliverToBoxAdapter(
            child: CustomChackOutCardBuilder(),
          ),
        ]),
      ),
    );
  }
}
