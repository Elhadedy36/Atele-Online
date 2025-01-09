import 'package:atele_online/core/utils/app_strings.dart';

class AppointmentsModel {
  final String categoryName;
  final String appointmentsDate;
  final String appointmentsTime;
  final String productName;
  final String ateleName;
  final double depositeAmount;
  final double price;
  final double rest;
  final List<dynamic> productImg;
  final String address;
  final String phoneNumber;
  final String userId;
  final bool isForRent;
  final String productId;
  final String status;
  final String appointmentId;

  AppointmentsModel(
      {required this.isForRent,
      required this.categoryName,
      required this.appointmentsTime,
      required this.price,
      required this.rest,
      required this.productImg,
      required this.appointmentsDate,
      required this.productName,
      required this.ateleName,
      required this.depositeAmount,
      required this.address,
      required this.phoneNumber,
      required this.userId,
      required this.productId,
      required this.status,
      required this.appointmentId});

  factory AppointmentsModel.fromJson(Map<String, dynamic> json) {
    return AppointmentsModel(
      categoryName: json[FirebaseStrings.categoryName],
      appointmentsTime: json[FirebaseStrings.appointmentTime],
      price: json[FirebaseStrings.price],
      rest: json[FirebaseStrings.rest],
      productImg: json[FirebaseStrings.productsImages],
      appointmentsDate: json[FirebaseStrings.appointmentDate],
      productName: json[FirebaseStrings.productName],
      ateleName: json[FirebaseStrings.ateleName],
      depositeAmount: json[FirebaseStrings.depositeAmount],
      address: json[FirebaseStrings.address],
      phoneNumber: json[FirebaseStrings.phoneNumber],
      userId: json[FirebaseStrings.userId],
      isForRent: json[FirebaseStrings.isForRent],
      productId: json[FirebaseStrings.productId],
      status: json[FirebaseStrings.status],
      appointmentId: json[FirebaseStrings.appointmentId],
    );
  }
}
