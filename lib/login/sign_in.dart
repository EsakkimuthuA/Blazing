import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:ovantica/user/user.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  var _isObscured;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _isObscured = true;
  }
  Map userData = {};
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.height;
    return  Scaffold(
      body: SingleChildScrollView(
        child:  Center(
          child: Container(
            height: screenHeight/1,
            width: screenWidth/1,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.pink.shade200,Colors.white],
                  begin: Alignment.topRight,
                  end: Alignment.bottomRight,
                  // stops: [0.0,1.0],
                  // tileMode: TileMode.repeated,
                )
            ),
            child: Column(
              children: <Widget>[
                Padding(
                  padding:  EdgeInsets.only(top: screenHeight/8.0),
                  child: Center(
                    child: ClipOval(
                      child: Container(
                        height: screenHeight/9.1,
                        width: screenWidth/10.0,
                        child: Image.asset('assets/icons/aks.png'),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Form(
                        key: _formkey,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: TextFormField(
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
                                padding: const EdgeInsets.all(12.0),
                                child: TextFormField(
                                  obscureText: _isObscured,
                                  validator: MultiValidator([
                                    RequiredValidator(
                                        errorText: 'Please enter Password'),
                                    MinLengthValidator(8,
                                        errorText:
                                        'Password must be at least 8 digit'),
                                    PatternValidator(r'(?=.*?[#!@$%^&*-])',
                                        errorText:
                                        'Password must be at least one special character')
                                  ]),
                                  decoration: InputDecoration(
                                    hintText: 'Password',
                                    labelText: 'Password',
                                    prefixIcon: Icon(
                                      Icons.lock,
                                     // color: Colors.grey,
                                    ),
                                    suffixIcon: IconButton(
                                      icon: _isObscured ? const Icon(Icons.visibility_off) : const Icon(Icons.visibility),
                                      onPressed: () {
                                        setState(() {
                                          _isObscured =! _isObscured;
                                        });
                                      },
                                    ),
                                    errorStyle: TextStyle(fontSize: 18.0),
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.red),
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(9.0))),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                child: GestureDetector(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgetPassword()));
                                  },
                                    child: Text('Forget Password!',style: TextStyle(color: Colors.blue),)),
                              ),
                              Padding(
                                padding:  EdgeInsets.all(28.0),
                                child: Container(
                                  child: ElevatedButton(
                                    child: Text(
                                      'Login',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 22),
                                    ),
                                    onPressed: () {
                                      if (_formkey.currentState!.validate()) {
                                        print('form submitted');
                                      }
                                    },
                                  ),
                                  width: MediaQuery.of(context).size.width,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.blue
                                  ),
                                ),
                              ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Don't have a account ? "),
                            GestureDetector(
                              onTap: (){
                            //  Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp()));
                              },
                                child: Text('Sign Up',
                                  style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),
                                ))
                          ],
                        ),
                            ]),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  Map userData = {};
  final _formkey = GlobalKey<FormState>();
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
                colors: [Colors.white,Colors.green.shade200 ],
                begin: FractionalOffset(0.0,1.0),
                end: FractionalOffset(0.0,0.0),
                stops: [0.0,1.0],
                tileMode: TileMode.repeated,
              )
          ),
          child: Column(
            children: [
              Padding(
                padding:  EdgeInsets.only(top: screenHeight/5,left: screenWidth/4),
                child: Container(
                  height: screenHeight/10,
                  width: screenWidth/1,
                  child: Text('Forget Password',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Form(
                      key: _formkey,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: TextFormField(
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
                                        prefixIcon: Icon(
                                          Icons.email,
                                          //color: Colors.green,
                                        ),
                                        errorStyle: TextStyle(fontSize: 18.0),
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide(color: Colors.red),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(9.0)))))),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: TextFormField(
                                validator: MultiValidator([
                                  RequiredValidator(
                                      errorText: 'Please enter Password'),
                                  MinLengthValidator(8,
                                      errorText:
                                      'Password must be at least 8 digit'),
                                  PatternValidator(r'(?=.*?[#!@$%^&*-])',
                                      errorText:
                                      'Password must be at least one special character')
                                ]),
                                decoration: InputDecoration(
                                  hintText: 'New Password',
                                  labelText: 'New Password',
                                  prefixIcon: Icon(
                                    Icons.lock,
                                    color: Colors.grey,
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
                              padding: const EdgeInsets.all(12.0),
                              child: TextFormField(
                                validator: MultiValidator([
                                  RequiredValidator(
                                      errorText: 'Please enter New Password'),
                                  MinLengthValidator(8,
                                      errorText:
                                      'Password must be at least 8 digit'),
                                  PatternValidator(r'(?=.*?[#!@$%^&*-])',
                                      errorText:
                                      'Password must be at least one special character')
                                ]),
                                decoration: InputDecoration(
                                  hintText: 'Confirm Password',
                                  labelText: 'Confirm Password',
                                  prefixIcon: Icon(
                                    Icons.lock,
                                    color: Colors.grey,
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
                              padding:  EdgeInsets.all(28.0),
                              child: Container(
                                child: ElevatedButton(
                                  child: Text(
                                    'Reset',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 22),
                                  ),
                                  onPressed: () {
                                    if (_formkey.currentState!.validate()) {
                                      print('form submitted');
                                    }
                                  },
                                ),
                                width: MediaQuery.of(context).size.width,
                                height: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.blue
                                ),
                              ),
                            ),
                          ]),
                    )),
              ),
            ],
          ),
        ),
      ) ,
    );
  }
 }

// class SignUp extends StatefulWidget {
//   const SignUp({super.key});
//
//   @override
//   State<SignUp> createState() => _SignUpState();
// }
//
// class _SignUpState extends State<SignUp> {
//   Map userData = {};
//   final _formkey = GlobalKey<FormState>();
//   var nameController = TextEditingController();
//   var emailController = TextEditingController();
//   var passwordController = TextEditingController();
//
//
//   Future<void> registerUser(String name, String email, String password) async {
//     final url = Uri.parse('https://leadproduct.000webhostapp.com/public_html/api/connection.php'); // Replace with your API endpoint URL
//     final response = await http.post(
//       url,
//       body: {
//         'name': name,
//         'email': email,
//         'password': password,
//       },
//     );
//
//     if (response.statusCode == 200) {
//       // Registration successful, handle the response here
//       print('Registration successful');
//       print(response.body); // This will contain the response message from your PHP script
//     } else {
//       // Registration failed, handle errors here
//       print('Registration failed');
//       print(response.body); // This will contain the error message from your PHP script
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     double screenHeight = MediaQuery.of(context).size.height;
//     double screenWidth = MediaQuery.of(context).size.width;
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Container(
//           height: screenHeight/1,
//           width: screenWidth/1,
//           decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 colors: [Colors.white,Colors.green.shade200 ],
//                 begin: FractionalOffset(0.0,1.0),
//                 end: FractionalOffset(0.0,0.0),
//                 stops: [0.0,1.0],
//                 tileMode: TileMode.repeated,
//               )
//           ),
//           child: Column(
//             children: [
//               Padding(
//                 padding:  EdgeInsets.only(top: screenHeight/5,),
//                   child: Container(
//                     height: screenHeight/15,
//                     width: screenWidth/1,
//                     //color: Colors.blue,
//                     child: Center(child: Text('Sign Up',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),)),
//                   ),
//               ),
//              Form(
//                       key: _formkey,
//                       child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: <Widget>[
//                             Padding(
//                                 padding:  EdgeInsets.only(left: screenWidth/12,right: screenWidth/12,bottom: screenHeight/35),
//                                 child: TextFormField(
//                                   controller: nameController,
//                                     validator: MultiValidator([
//                                       RequiredValidator(
//                                           errorText: 'Enter Your Name'),
//                                       EmailValidator(
//                                           errorText:
//                                           'Please correct Name filled'),
//                                     ]),
//                                     decoration: InputDecoration(
//                                         hintText: 'Name',
//                                         labelText: 'Name',
//                                         prefixIcon: Icon(
//                                           Icons.person,
//                                           //color: Colors.green,
//                                         ),
//                                         errorStyle: TextStyle(fontSize: 18.0),
//                                         border: OutlineInputBorder(
//                                             borderSide:
//                                             BorderSide(color: Colors.red),
//                                             borderRadius: BorderRadius.all(
//                                                 Radius.circular(9.0)))))),
//                             Padding(
//                                 padding: EdgeInsets.only(left: screenWidth/12,right: screenWidth/12,bottom: screenHeight/35),
//                                 child: TextFormField(
//                                   controller: emailController,
//                                     validator: MultiValidator([
//                                       RequiredValidator(
//                                           errorText: 'Enter email address'),
//                                       EmailValidator(
//                                           errorText:
//                                           'Please correct email filled'),
//                                     ]),
//                                     decoration: InputDecoration(
//                                         hintText: 'Email',
//                                         labelText: 'Email',
//                                         prefixIcon: Icon(
//                                           Icons.email,
//                                           //color: Colors.green,
//                                         ),
//                                         errorStyle: TextStyle(fontSize: 18.0),
//                                         border: OutlineInputBorder(
//                                             borderSide:
//                                             BorderSide(color: Colors.red),
//                                             borderRadius: BorderRadius.all(
//                                                 Radius.circular(9.0)))))),
//                             Padding(
//                               padding: EdgeInsets.only(left: screenWidth/12,right: screenWidth/12,bottom: screenHeight/35),
//                               child: TextFormField(
//                                 controller: passwordController,
//                                 validator: MultiValidator([
//                                   RequiredValidator(
//                                       errorText: 'Please enter Password'),
//                                   MinLengthValidator(8,
//                                       errorText:
//                                       'Password must be at least 8 digit'),
//                                   PatternValidator(r'(?=.*?[#!@$%^&*-])',
//                                       errorText:
//                                       'Password must be at least one special character')
//                                 ]),
//                                 decoration: InputDecoration(
//                                   hintText: 'Password',
//                                   labelText: 'Password',
//                                   prefixIcon: Icon(
//                                     Icons.lock,
//                                     color: Colors.grey,
//                                   ),
//                                   errorStyle: TextStyle(fontSize: 18.0),
//                                   border: OutlineInputBorder(
//                                       borderSide: BorderSide(color: Colors.red),
//                                       borderRadius:
//                                       BorderRadius.all(Radius.circular(9.0))),
//                                 ),
//                               ),
//                             ),
//                             // Padding(
//                             //   padding:  EdgeInsets.only(left: screenWidth/12,right: screenWidth/12,bottom: screenHeight/35),
//                             //   child: TextFormField(
//                             //     validator: MultiValidator([
//                             //       RequiredValidator(
//                             //           errorText: 'Please enter Password'),
//                             //       MinLengthValidator(8,
//                             //           errorText:
//                             //           'Password must be at least 8 digit'),
//                             //       PatternValidator(r'(?=.*?[#!@$%^&*-])',
//                             //           errorText:
//                             //           'Password must be at least one special character')
//                             //     ]),
//                             //     decoration: InputDecoration(
//                             //       hintText: 'Confirm Password',
//                             //       labelText: 'Confirm Password',
//                             //       prefixIcon: Icon(
//                             //         Icons.lock,
//                             //         color: Colors.grey,
//                             //       ),
//                             //       errorStyle: TextStyle(fontSize: 18.0),
//                             //       border: OutlineInputBorder(
//                             //           borderSide: BorderSide(color: Colors.red),
//                             //           borderRadius:
//                             //           BorderRadius.all(Radius.circular(9.0))),
//                             //     ),
//                             //   ),
//                             // ),
//                             Padding(
//                               padding:  EdgeInsets.only(left: screenWidth/6,top: 10),
//                               child: Container(
//                                   child: ElevatedButton(
//                                     child: Text(
//                                       'Reset',
//                                       style: TextStyle(
//                                           color: Colors.white, fontSize: 22),
//                                     ),
//                                     onPressed: () {
//                                       if (_formkey.currentState!.validate()) {
//                                         print('form submitted');
//                                       }
//                                     },
//                                   ),
//                                   width: screenWidth/1.5,
//                                   height: screenHeight/20,
//                                   decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(20),
//                                       color: Colors.blue
//                                   ),
//                                 ),
//                             ),
//                           ]),
//                     )
//             ],
//           ),
//         ),
//       ) ,
//     );
//   }
// }
