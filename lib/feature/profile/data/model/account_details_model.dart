
class AccountDetailsModel 
{
final String fristname;
final String lastname;
final String email;
final String phone;
final String uId;

  AccountDetailsModel({required this.fristname,required this.lastname, required this.email, required this.phone, required this.uId});
  factory AccountDetailsModel.fromJson(json) => AccountDetailsModel( 
  fristname: json['fristname'],
  lastname: json['lastname'],
  email: json['email'],
  phone: json['phone'], 
  uId: json['uId']
  );
}

