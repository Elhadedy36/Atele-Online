import 'package:atele_online/core/functions/custom_appbar.dart';
import 'package:atele_online/core/widgets/custom_drawer.dart';
import 'package:atele_online/feature/appointments/presentation/widgets/my_appointments_builder.dart';
import 'package:flutter/material.dart';


class MyAppointmentsView extends StatelessWidget {
  const MyAppointmentsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerEnableOpenDragGesture: true,
      drawer: const CustomDrawerProfile(),
      appBar: customAppBar(title: 'My Appointments'),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: CustomScrollView(slivers: [
          SliverToBoxAdapter(
            child: MyAppointmentsBuilder(),
          )
        ]),
      ),
    );
  }
}

