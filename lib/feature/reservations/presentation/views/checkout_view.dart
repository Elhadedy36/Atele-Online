import 'package:atele_online/core/cubits/cubit/shared_data_cubit.dart';
import 'package:atele_online/core/functions/custom_appbar.dart';
import 'package:atele_online/feature/reservations/presentation/widget/custom_chackout_builder.dart';
import 'package:atele_online/feature/reservations/presentation/widget/custom_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: 'Chackout', actions: [], context: context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: CustomSliderThem(indexTop: 1),
            ),
            SliverToBoxAdapter(
              child: CustomCheckOutCardWidget(
                product:
                    context.read<SharedDataCubit>().state["selectedProduct"],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
