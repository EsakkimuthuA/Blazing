

import 'package:flutter/material.dart';
import 'package:ovantica/color.dart';
import '../api/api_connection.dart';


class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  Map userData = {};

  final _formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var mobileController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: screenHeight/1,
          width: screenWidth/1,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.white,color.blue ],
                begin: FractionalOffset(0.0,1.0),
                end: FractionalOffset(0.0,0.0),
                stops: [0.0,1.0],
                tileMode: TileMode.repeated,
              )
          ),
          child: Column(
            children: [
              Padding(
                padding:  EdgeInsets.only(top: screenHeight/5,),
                child: Container(
                  height: screenHeight/15,
                  width: screenWidth/1,
                  //color: Colors.blue,
                  child: Center(child: Text('Sign Up',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),)),
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                          padding:  EdgeInsets.only(left: screenWidth/12,right: screenWidth/12,bottom: screenHeight/35),
                          child: TextFormField(
                              controller: nameController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Enter Your Name';
                                }
                                return null;
                              },
                              // validator: MultiValidator([
                              //   RequiredValidator(
                              //       errorText: 'Enter Your Name'),
                              // ]),
                              decoration: InputDecoration(
                                  hintText: 'Name',
                                  labelText: 'Name',
                                  prefixIcon: Icon(
                                    Icons.person,
                                    //color: Colors.green,
                                  ),
                                  errorStyle: TextStyle(fontSize: 18.0),
                                  border: OutlineInputBorder(
                                      borderSide:
                                      BorderSide(color: Colors.red),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(9.0)))))),
                      Padding(
                          padding: EdgeInsets.only(left: screenWidth/12,right: screenWidth/12,bottom: screenHeight/35),
                          child: TextFormField(
                              controller: emailController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Enter email address';
                                } else if (!value.contains('@')) {
                                  return 'Please enter a valid email address';
                                }
                                return null;
                              },
                              // validator: MultiValidator([
                              //   RequiredValidator(
                              //       errorText: 'Enter email address'),
                              //   EmailValidator(
                              //       errorText:
                              //       'Please correct email filled'),
                              // ]),
                              decoration: InputDecoration(
                                  hintText: 'Email',
                                  labelText: 'Email',
                                  prefixIcon: Icon(
                                    Icons.email,
                                    //color: Colors.green,
                                  ),
                                  errorStyle: TextStyle(fontSize: 18.0),
                                  border: OutlineInputBorder(
                                      borderSide:
                                      BorderSide(color: Colors.red),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(9.0)))))),
                      Padding(
                        padding: EdgeInsets.only(left: screenWidth/12,right: screenWidth/12,bottom: screenHeight/35),
                        child: TextFormField(
                          controller: mobileController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter phone number';
                            } else if (!RegExp(r'^\s*(?:\+?(\d{1,3}))?[-. (]*(\d{3})[-. )]*(\d{3})[-. ]*(\d{4})(?: *x(\d+))?\s*$').hasMatch(value)) {
                              return 'Please enter a valid phone number';
                            }
                            return null;
                          },
                          // validator: MultiValidator([
                          //   RequiredValidator(
                          //       errorText: 'Please enter phone number'),
                          //   // MinLengthValidator(8,
                          //   //     errorText:
                          //   //     'Password must be at least 8 digit'),
                          //   PatternValidator((r'^\s*(?:\+?(\d{1,3}))?[-. (]*(\d{3})[-. )]*(\d{3})[-. ]*(\d{4})(?: *x(\d+))?\s*$'),
                          //       errorText:
                          //       'Password must be at least one special character')
                          // ]),
                          decoration: InputDecoration(
                            hintText: 'mobile',
                            labelText: 'mobile',
                            prefixIcon: Icon(
                              Icons.mobile_friendly,
                              // color: Colors.grey,
                            ),
                            errorStyle: TextStyle(fontSize: 18.0),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
                                borderRadius:
                                BorderRadius.all(Radius.circular(9.0))),
                          ),
                        ),
                      ),

                      Padding(
                        padding:  EdgeInsets.only(left: screenWidth/6,top: 10),
                        child: Container(
                          child: ElevatedButton(

                            child: Text(
                              'Register',
                              style: TextStyle(
                                  color: Colors.purple, fontSize: 22),
                            ),
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                final username = nameController.text;
                                final email = emailController.text;
                                final mobile = mobileController.text;

                                //final result =
                                await validate(context,username, mobile, email,);
                                // if (result != null) {
                                //   // Registration was successful, show toast and navigate.
                                //   showRegistrationSuccessMessage(context);
                                // }
                              }
                            },
                          ),
                          width: screenWidth/1.5,
                          height: screenHeight/20,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.blue
                          ),
                        ),
                      ),

                    ]),
              )
            ],
          ),
        ),
      ) ,
    );
  }
}
