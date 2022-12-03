class User {

  late String userName;
  late String password;
  late String email;
  late String phoneNamber;


  User({required this.userName, required this.password,required this.email,required this.phoneNamber});

  User.fromJson(Map<String, dynamic> json)
      : userName  = json['userName'],
        email = json['email'],
        phoneNamber = json['phoneNamber'],
        password  =json['passwor'];

  Map<String, dynamic> toJson() => {
    'userName' : userName,
    'email': email,
    'passwor' : password,
    'phoneNamber': phoneNamber,
  };
}