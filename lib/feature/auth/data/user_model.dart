class UserModel 
{
final String fristname;
final String lastname;
final String email;
final String phone;
final String uId;

  UserModel({required this.fristname,required this.lastname, required this.email, required this.phone, required this.uId});

factory UserModel.fromJson(Map<String,dynamic>json)
{
  return UserModel(
    fristname: json['fristname'],
    lastname: json['lastname'],
    email: json['email'],
    phone: json['phone'],
    uId: json['uId'],
  );}
}