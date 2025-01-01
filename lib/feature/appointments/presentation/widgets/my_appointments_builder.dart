import 'package:atele_online/feature/appointments/presentation/cubit/appointments_cubit.dart';
import 'package:atele_online/feature/appointments/presentation/widgets/my_appoinments_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyAppointmentsBuilder extends StatelessWidget {
  const MyAppointmentsBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppointmentsCubit, AppointmentsState>(
      builder: (context, state) {
       
       if(state is GetAppointmentsDataSuccess){
        
        return ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: state.appointmentsModel.length,
          itemBuilder: (context, index) {
            return  MyAppoinmentsItem(model:  state.appointmentsModel[index]);
          },
        );}
        else if(state is GetAppointmentsDataLoading){
          return const Center(child: CircularProgressIndicator(color: Colors.black,));
        }
        else if(state is GetAppointmentsDataError){
          return const Center(child: Text('Error'));
        }
        else{
          return const Center(child: Text('Error'));
        }
      },
    );
  }
}
