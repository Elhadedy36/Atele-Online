
import 'package:atele_online/feature/appointments/data/appointments_model.dart';
import 'package:flutter/material.dart';

@immutable
sealed class AppointmentsState {}

final class AppointmentsInitial extends AppointmentsState {}
final class GetAppointmentsDataSuccess extends AppointmentsState 
{
  final List<AppointmentsModel> appointmentsModel;
  GetAppointmentsDataSuccess({required this.appointmentsModel});
}
final class GetAppointmentsDataLoading extends AppointmentsState {}
final class GetAppointmentsDataError extends AppointmentsState 
{
  final String message;
  GetAppointmentsDataError({required this.message});
}
