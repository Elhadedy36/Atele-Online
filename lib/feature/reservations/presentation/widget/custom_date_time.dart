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
  List<String> availableTimes = [];
  String? selectedTime;

  void generateAvailableTimes() {
    availableTimes.clear();
    TimeOfDay startTime = const TimeOfDay(hour: 0, minute: 0); // Starting time
    TimeOfDay endTime = const TimeOfDay(hour: 24, minute: 30); // Ending time

    while (startTime.hour < endTime.hour ||
        (startTime.hour == endTime.hour && startTime.minute < endTime.minute)) {
      availableTimes.add(startTime.format(context));
      final timeInMinutes = startTime.hour * 60 + startTime.minute + 30;
      startTime = TimeOfDay(//update the start time to get next slot
        hour: timeInMinutes ~/ 60,//int devision to get the hour
        minute: timeInMinutes % 60,//remaining dev to get the minute
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Form(
        key: context.read<ReserveCubit>().dateFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextFormField(
              controller: context.read<ReserveCubit>().dateController,
              labelText: 'Pick Your Date',
              onTap: () async {
                final dateTime = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2027),//cant select any date after 2027
                );
                if (dateTime != null) {
                  final formattedDate = DateFormat('yyyy-MM-dd').format(dateTime);
                  setState(() {
                    context.read<ReserveCubit>().dateController.text = formattedDate;
                    generateAvailableTimes();
                    selectedTime = null; // Reset selected time
                  });
                }
              },
            ),
            SizedBox(height: 20.h),
            if (availableTimes.isNotEmpty) ...[
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Text(
                  'Select a Time',
                  style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
                ),
              ),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // Number of items in a row
                  crossAxisSpacing: 12.w,
                  mainAxisSpacing: 12.h,
                  childAspectRatio: 2.5,
                ),
                itemCount: availableTimes.length,
                itemBuilder: (context, index) {
                  final time = availableTimes[index];
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedTime = time;
                        context.read<ReserveCubit>().timeController.text = time;
                      });
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: selectedTime == time
                            ? Theme.of(context).primaryColor
                            : Colors.grey[200],
                        borderRadius: BorderRadius.circular(12.r),
                        boxShadow: selectedTime == time
                            ? [
                                BoxShadow(
                                  color: Theme.of(context).primaryColor.withOpacity(0.4),
                                  blurRadius: 6,
                                  offset: const Offset(0, 3),
                                ),
                              ]
                            : null,
                        border: Border.all(
                          color: selectedTime == time
                              ? Theme.of(context).primaryColor
                              : Colors.grey.shade400,
                          width: 1.5,
                        ),
                      ),
                      child: Text(
                        time,
                        style: TextStyle(
                          color: selectedTime == time ? Colors.white : Colors.black87,
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ],
        ),
      ),
    );
  }
}
