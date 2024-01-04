

import 'package:flutter/material.dart';
import 'package:ovantica/login/signup.dart';
import 'package:phone_text_field/phone_text_field.dart';
import 'package:ovantica/color.dart';
import 'emaillogin.dart';
import 'otpscreen.dart';


class PhoneLoginPage extends StatefulWidget {
  const PhoneLoginPage({super.key});

  @override
  State<PhoneLoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<PhoneLoginPage> {
  final _formKey = GlobalKey<FormState>();
  // TextEditingController text1 = TextEditingController();
  TextEditingController countryCode = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    countryCode.text='+91 ';
    super.initState();
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
              child: Text('Enter your phone number'),
            ),
          ),
          Padding(
            padding:  EdgeInsets.only(right: screenWidth/15,left: screenWidth/15,),
            child: Form(
              key: _formKey,
              child: Container(
                height: screenHeight/16,
                width: screenWidth/1.2,
                child: PhoneTextField(
                  initialCountryCode: '+91',
                  countryViewOptions: CountryViewOptions.countryCodeOnly,
                  showCountryCodeAsIcon: true,
                  onChanged: (value) {},

                  // controller: countryCode,
                  // keyboardType: TextInputType.phone,
                  // onChanged: (value){
                  //   formKey.currentState?.validate();
                  //   },
                  // validator: (value){
                  //   if(value!.isEmpty){
                  //     return "Please Enter a Phone Number";
                  //   }else if(!RegExp(r'^\s*(?:\+?(\d{1,3}))?[-. (]*(\d{3})[-. )]*(\d{3})[-. ]*(\d{4})(?: *x(\d+))?\s*$').hasMatch(value)){
                  //     return "Please Enter a Valid Phone Number";
                  //   }
                  // return null;
                  // if(value!.isEmpty || !RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$').hasMatch(value)){
                  //   //  r'^[0-9]{10}$' pattern plain match number with length 10
                  //   return "Enter Correct Phone Number";
                  // }else{
                  //   return null;
                  // }
                  // },
                  decoration: InputDecoration(
                    labelText: 'phone Number',
                    labelStyle: TextStyle(
                        color: color.blue
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: color.blue),
                        borderRadius: BorderRadius.all(Radius.circular(9.0))
                    ),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: color.blue),
                        borderRadius:
                        BorderRadius.all(Radius.circular(9.0))),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: screenHeight/50,),
          Text('OR'),
          SizedBox(height: screenHeight/70,),
          GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>EmailPage()));
              },
              child: Text('Use Email-ID',style: TextStyle(color: color.blue),)),
          SizedBox(height: screenHeight/20,),
          Container(
            height: screenHeight/20,
            width: screenWidth/1.3,
            child: ElevatedButton(onPressed: () {
              if(_formKey.currentState!.validate()) {
                //Navigator.push(context, MaterialPageRoute(builder: (context) => OTPPage()));
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
                  child: Text('Create Account     ',
                    style: TextStyle(color: color.blue,fontWeight: FontWeight.bold),
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
