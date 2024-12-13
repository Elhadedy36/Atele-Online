import 'package:atele_online/app/atele_online.dart';
import 'package:atele_online/core/cubits/cubit/shared_data_cubit.dart';
import 'package:atele_online/core/functions/custom_appbar.dart';
import 'package:atele_online/core/functions/navigation.dart';
import 'package:atele_online/core/functions/sliver_sized_box.dart';
import 'package:atele_online/core/utils/app_strings.dart';
import 'package:atele_online/core/widgets/custom_button.dart';
import 'package:atele_online/feature/reservations/presentation/cubit/reserve_cubit.dart';
import 'package:atele_online/feature/reservations/presentation/widget/custom_date_time.dart';
import 'package:atele_online/feature/reservations/presentation/widget/custom_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Appointment extends StatelessWidget {
  const Appointment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: AppStrings.appointment, actions: []),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: CustomScrollView(slivers: [
          SliverToBoxAdapter(
            child: CustomSliderThem(
              indexTop: 0,
            ),
          ),
          SliverSizedBox(31.h),
          const SliverToBoxAdapter(
            child: CustomDateAndTime(),
          ),
          SliverSizedBox(280.h),
          SliverToBoxAdapter(
            child: CustomBtn(
              text: 'Next',
              textcolor: Colors.white,
              onPressed: () {
                if (context.read<ReserveCubit>().dateFormKey.currentState!.validate()) {
                  final time = context.read<ReserveCubit>().timeController.text;
                  final date = context.read<ReserveCubit>().dateController.text;
                  
                  context.read<SharedDataCubit>().setAppointmentTime(time, date);
                  final dateTime = context.read<SharedDataCubit>().state["appointmentTime"] ;
                  // print(' hereeeeee ${dateTime}');
                  customNavigate(context, path: '/ChackoutView');
                }
              },
            ),
          ),
        ]),
      ),
    );
  }
}