import 'package:atele_online/core/utils/app_strings.dart';

class AppointmentsModel 
{
  final String appointmentsId;
  final String appointmentsDateTime;
  final String productName;
  final String sellerId;
  final String ateleName;
  final double depositePaid;
  final String address;
  final String phoneNumber;
  final String userId;

  AppointmentsModel({ required this.appointmentsId, required this.appointmentsDateTime, required this.productName, required this.sellerId, required this.ateleName, required this.depositePaid, required this.address, required this.phoneNumber, required this.userId});


  factory AppointmentsModel.fromJson(Map<String, dynamic> json) {
    return AppointmentsModel(
      appointmentsId: json[FirebaseStrings.appointmentId],
      appointmentsDateTime: json[FirebaseStrings.appointmentDate],
      productName: json[FirebaseStrings.productName],
      sellerId: json[FirebaseStrings.sellerId],
      ateleName: json[FirebaseStrings.ateleName],
      depositePaid: json[FirebaseStrings.depositPaid],
      address: json[FirebaseStrings.address],
      phoneNumber: json[FirebaseStrings.phoneNumber],
      userId: json[FirebaseStrings.userId],
    );
  }
}