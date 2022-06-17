class Login{
  final String email;
  final String password;

  Login({
    required this.email, required this.password
  });
  //toJSON, or toDataClass Firebase
  Map<String, dynamic> toJson(){ //json 
    return {
      "email" : email,
      "password" : password
    };
  }
  //form TambahData
  //fromJSON
  factory Login.fromJSON(Map<String, dynamic> json){
    return Login(
      email: json['email'],
      password: json['password']
    );
  }
}