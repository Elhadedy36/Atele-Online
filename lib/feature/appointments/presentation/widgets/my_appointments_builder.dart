import 'package:atele_online/feature/appointments/presentation/widgets/my_appoinments_item.dart';
import 'package:flutter/material.dart';



class MyAppointmentsBuilder extends StatelessWidget {
  const MyAppointmentsBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 5,
      itemBuilder: (context, index) {
        return const MyAppoinmentsItem();
      },
    );
  }
}

