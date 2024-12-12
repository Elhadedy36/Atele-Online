
import 'package:atele_online/core/utils/app_strings.dart';

class AccountDetailsModel 
{
final String fristname;
final String lastname;
final String email;
final String phone;
final String location;

  AccountDetailsModel({required this.fristname,required this.lastname, required this.email, required this.phone, required this.location});
  factory AccountDetailsModel.fromJson(json) => AccountDetailsModel( 
  fristname: json[FirebaseStrings.fristname],
  lastname: json[FirebaseStrings.lastname],
  email: json[FirebaseStrings.email],
  phone: json[FirebaseStrings.phoneNumber], 
  location: json[FirebaseStrings.location]  
  );
}

