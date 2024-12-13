import 'package:atele_online/core/widgets/custom_text_form_field.dart';
import 'package:atele_online/feature/reservations/presentation/cubit/reserve_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class CustomDateAndTime extends StatefulWidget {
  const CustomDateAndTime({super.key});

  @override
  State<CustomDateAndTime> createState() => _CustomDateAndTimeState();
}

class _CustomDateAndTimeState extends State<CustomDateAndTime> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Form(
        key: context.read<ReserveCubit>().dateFormKey,
        child: Column(
          children: [
            CustomTextFormField(
              controller: context.read<ReserveCubit>().timeController,
              labelText: 'Pick your Time',
              onTap: () async {
                var time = await showTimePicker(context: context, initialTime: TimeOfDay.now());
                if (time != null) {
                  setState(() {
                    context.read<ReserveCubit>().timeController.text = time.format(context);
                  });
                }
              },
            ),
            SizedBox(height: 20.h),
            CustomTextFormField(
              controller: context.read<ReserveCubit>().dateController,
              labelText: 'Pick your Date',
              onTap: () async {
                DateTime? dateTime = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1990),
                    lastDate: DateTime(2100));
                if (dateTime != null) {
                  String formattedDate = DateFormat('yyyy-MM-dd').format(dateTime);
                  setState(() {
                    context.read<ReserveCubit>().dateController.text = formattedDate;
                  });
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
