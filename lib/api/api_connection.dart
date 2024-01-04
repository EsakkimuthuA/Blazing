


import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../Drawer.dart';
import '../login/emaillogin.dart';
import '../user/user.dart';

Future<Users?>validate(
    BuildContext context,
    String username,
    String mobile,
    String email,
    ) async {
  try {
    var uri = Uri.parse('https://leadproduct.000webhostapp.com/api/validate.php');
    var response = await http.post(uri, body: {
      "email": email,
    });
    if (response.statusCode == 200) {
      print('error code');
      var userJson = json.decode(response.body);
      if(userJson['emailFound'] == true){
        Fluttertoast.showToast(
            msg: 'Email already exist',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.deepOrange,
            textColor: Colors.white,
            fontSize: 16.0
        );
      }else{
          var uri = Uri.parse('https://leadproduct.000webhostapp.com/api/signup.php');
          var response = await http.post(uri, body: {
            "username": username,
            "mobile": mobile,
            "email": email,
          });

          if (response.statusCode == 201) {
            print('error');
            var userJson = json.decode(response.body);

            try {
              var user = Users.fromJson(userJson);
              print(user);
              showRegistrationSuccessMessage(context);
              return user;
            } catch (e) {
              print(response.body);
              print(response.statusCode);
              throw Exception('Failed to add user');
            }
        }else{
          showRegistrationSuccessMessage(context);
        }
      }

    }
    else{
      var uri = Uri.parse('https://leadproduct.000webhostapp.com/api/signup.php');
      var response = await http.post(uri, body: {
        "username": username,
        "mobile": mobile,
        "email": email,
      });

      if (response.statusCode == 201) {
        print('error');
        var userJson = json.decode(response.body);

        try {
          var user = Users.fromJson(userJson);
          print(user);
          showRegistrationSuccessMessage(context);
          return user;
        } catch (e) {
          print(response.body);
          print(response.statusCode);
          throw Exception('Failed to add user');
        }
      }else{
        showRegistrationSuccessMessage(context);
      }
    }
      // else{
      //   Fluttertoast.showToast(
      //     msg: 'An error occurred.',
      //     toastLength: Toast.LENGTH_SHORT,
      //     gravity: ToastGravity.BOTTOM,
      //     backgroundColor: Colors.red,
      //     textColor: Colors.white,
      //   );
      // }

  }catch(e){
   print(e);
   print(e.toString());
   Fluttertoast.showToast(
     msg: 'An error occurred. Please try again later.',
     toastLength: Toast.LENGTH_SHORT,
     gravity: ToastGravity.BOTTOM,
     backgroundColor: Colors.red,
     textColor: Colors.white,
   );
  }
}
void showRegistrationSuccessMessage(BuildContext context) {
  Fluttertoast.showToast(
    msg: 'Registration Successful',
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    backgroundColor: Colors.green,
    textColor: Colors.white,
  );
  Navigator.push(context, MaterialPageRoute(builder: (context) => EmailPage()));
}


//

//
// Future<Users?>addusers1(
//     String username,
//     String mobile,
//     String email,
//
//     ) async {
//   var uri = Uri.parse('https://leadproduct.000webhostapp.com/api/signup.php');
//   var response = await http.post(uri, body: {
//     "username": username,
//     "mobile": mobile,
//     "email": email,
//   });
//
//   if (response.statusCode == 201) {
//     var userJson = json.decode(response.body);
//     try {
//       var user = Users.fromJson(userJson);
//       print(user);
//       return user;
//     } catch (e) {
//       print(response.body);
//       print(response.statusCode);
//       throw Exception('Failed to add user');
//     }
//   }
// }
Future<Users?> addusers1(
    String username,
    String mobile,
    String email,
    ) async {
  var uri = Uri.parse('https://leadproduct.000webhostapp.com/api/signup.php');
  var response = await http.post(uri, body: {
    "username": username,
    "mobile": mobile,
    "email": email,
  });

  if (response.statusCode == 201) {
    var userJson = json.decode(response.body);
    try {
      var user = Users.fromJson(userJson);
      print(user);
      return user;
    } catch (e) {
      print('Failed to parse user data: $e');
      throw Exception('Failed to parse user data');
    }
  } else if (response.statusCode == 400) {
    print('Bad Request: ${response.body}');
    throw Exception('Bad Request: Failed to add user');
  } else if (response.statusCode == 500) {
    print('Internal Server Error: ${response.body}');
    throw Exception('Internal Server Error: Failed to add user');
  } else {
    print('Unknown Error: ${response.body}');
    throw Exception('Unknown Error: Failed to add user');
  }
}

