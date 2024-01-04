

import 'dart:convert';
import 'package:email_otp/email_otp.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:ovantica/color.dart';
import 'package:http/http.dart' as http;
import 'package:ovantica/login/phonelogin.dart';
import 'package:ovantica/login/signup.dart';
import 'package:ovantica/sheet.dart';
import 'package:ovantica/user/user_preference.dart';
import '../user/user.dart';
import 'otpscreen.dart';
import 'package:get/get.dart';
class EmailPage extends StatefulWidget {
  const EmailPage({super.key});

  @override
  State<EmailPage> createState() => _EmailPageState();
}

class _EmailPageState extends State<EmailPage> {
  TextEditingController emailController = new TextEditingController();
  TextEditingController otp = new TextEditingController();
  EmailOTP myauth = EmailOTP();
  final _formKey = GlobalKey<FormState>();

  late DateTime otpGenerationTime;
 // int otpExpirationDurationInSeconds = 60;

  Future<Map<String, dynamic>?> loginUser(String email) async {

      final url = Uri.parse("https://leadproduct.000webhostapp.com/api/login.php");
      try {
        final response = await http.post(
          url,
          body: {
            "email": email,
            // You can add a flag to indicate login action
          },
        );
        if (response.statusCode == 200) {
          // If the server returns a 200 OK response, parse the JSON
          final Map<String, dynamic> responseData = json.decode(response.body);

          if (responseData['success'] == true) {
            // User data retrieval was successful
            final userData = responseData['userData'];

            Users userInfo = Users.fromJson(responseData["userData"]);
            await RememberUserPrefs.storeUserInfo(userInfo);
           // Future.delayed(Duration(milliseconds: 2000), (){
           // Get.to(Sheet());
           // });
            myauth.setConfig(
              appEmail: 'esakkimuthu2369@gmail.com',
              //'your_app_email@example.com',
              appName: 'BLAZING OTP',
              userEmail: emailController.text,
              otpLength: 6,
              otpType: OTPType.digitsOnly,

            );
            myauth.setSMTP(
                host: "smtp.gmail.com",
                auth: true,
                username: "asban.sijo@gmail.com",
                password: "xbjm fcqf mmrh felc",
                //nevq djsk mkfz uaob
                secure: "TLS",
                port: 587,
                //576,

            );
            if (await myauth.sendOTP()) {
              otpGenerationTime = DateTime.now();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => OTPPage( myauth: myauth,),
                  settings: RouteSettings(
                    arguments: myauth,
                  ),
                ),
              );
            }

            else {
              Fluttertoast.showToast(
                  msg: "'Oops, OTP send failed'",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.deepOrange,
                  textColor: Colors.white,
                  fontSize: 16.0
              );
              // ScaffoldMessenger.of(context).showSnackBar(
              //   SnackBar(
              //     backgroundColor: Colors.deepOrange,
              //     content: Text('Oops, OTP send failed'),
              //   ),
              // );
            }
            // Now you can use 'userData' in your Flutter app
            print('User Data: $userData');
          } else {
            Fluttertoast.showToast(
                msg: "you don't have a account",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.deepOrange,
                textColor: Colors.white,
                fontSize: 16.0
            );
            // ScaffoldMessenger.of(context).showSnackBar(
            //   SnackBar(
            //     backgroundColor: Colors.deepOrange,
            //     content: Text("you don't have a account"),
            //   ),
            // );
            // User not found, handle accordingly
            print('User not found.');
          }
        } else {
          // If the server did not return a 200 OK response,
          // throw an exception or handle the error as needed.
          throw Exception('Failed to load user data');
        }
      } catch (e) {
        // Handle any exceptions or errors that occur during the HTTP request.
        print('Error: Email Error : $e');
      }
    }


  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Blazing'),
          backgroundColor: color.blue,
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding:  EdgeInsets.only(top:screenHeight/20),
                child: Container(
                  height: screenHeight/20,
                  width: screenWidth/4,
                  // color: Colors.pink,
                  child: Text('Login',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                ),
              ),
              Padding(
                padding:  EdgeInsets.only(left: screenWidth/15,top: screenHeight/40,bottom: screenHeight/50),
                child: Container(
                  alignment: Alignment.topLeft,
                  child: Text('Enter your Email-ID'),),),
              Form(
                key: _formKey,
                child: Padding(
                    padding: EdgeInsets.only(right: screenWidth/15,left: screenWidth/15),
                    child: TextFormField(
                        controller: emailController,
                        validator: MultiValidator([
                          RequiredValidator(
                              errorText: 'Enter email address'),
                          EmailValidator(
                              errorText:
                              'Please correct email filled'),
                        ]),
                        decoration: InputDecoration(
                            hintText: 'Email',
                            labelText: 'Email',
                            labelStyle: TextStyle(
                                color: color.blue
                            ),
                            prefixIcon: Icon(
                              Icons.email,
                              color: Colors.grey,
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: color.blue)
                            ),
                            errorStyle: TextStyle(fontSize: 18.0),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
                                borderRadius: BorderRadius.all(
                                    Radius.circular(9.0)))))),
              ),
              SizedBox(height: screenHeight/50,),
              Text('OR'),
              SizedBox(height: screenHeight/70,),
              GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>PhoneLoginPage()));
                  },
                  child: Text('Use Phone Number',style: TextStyle(color: color.blue),)),
              SizedBox(height: screenHeight/20,),
              Container(
                height: screenHeight/20,
                width: screenWidth/1.3,
                child: ElevatedButton(
                  onPressed: ()
                  async {
                    if (_formKey.currentState!.validate()) {
                      await loginUser(emailController.text);
                    }
                  },
                  child: Text('Continue'),
                  style: ElevatedButton.styleFrom(
                      primary: color.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      )
                  ),
                ),
              ),
              SizedBox(height: screenHeight/20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("New user ? "),
                  GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> SignUp()));
                      },
                      child: Text('Create Account',
                        style: TextStyle(color: color.blue,fontWeight: FontWeight.bold),
                      ))
                ],
              ),
            ])
    );
  }
}
