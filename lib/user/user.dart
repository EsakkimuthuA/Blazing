import 'dart:convert';

List<Users> welcomeFromJson(String str) =>
    List<Users>.from(json.decode(str).map((x) => Users.fromJson(x)));

String welcomeToJson(List<Users> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Users {
  //int user_id;
  String username;
  String mobile;
  String email;
  //String otp;

  Users({
    required this.username,
    required this.mobile,
    required this.email,
    //required this.user_id,
   // required this.otp,
  });

  factory Users.fromJson(Map<String, dynamic> json) => Users(
    //user_id: json["user_id"],
    username: json["username"],
    mobile: json["mobile"],
    email: json["email"],
   // otp : json["otp"],
  );

  Map<String, dynamic> toJson() => {
    //"user_id": user_id,
    "username": username,
    "mobile": mobile,
    "email": email,
    //"otp": otp,
  };
}
