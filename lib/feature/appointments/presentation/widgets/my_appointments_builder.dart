import 'package:atele_online/feature/appointments/data/appointments_model.dart';
import 'package:atele_online/feature/appointments/presentation/cubit/appointments_cubit.dart';
import 'package:atele_online/feature/appointments/presentation/widgets/my_appoinments_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyAppointmentsBuilder extends StatelessWidget {
  const MyAppointmentsBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AppointmentsCubit>();

    return StreamBuilder<List<AppointmentsModel>>(
      stream: cubit.getAppointmentsStream(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(color: Colors.black),
          );
        } else if (snapshot.hasError) {
          return const Center(child: Text('Error loading appointments'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No Appointments Found'));
        } else {
          final appointments = snapshot.data!;
          return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: appointments.length,
            itemBuilder: (context, index) {
              return MyAppoinmentsItem(model: appointments[index]);
            },
          );
        }
      },
    );
  }
}
