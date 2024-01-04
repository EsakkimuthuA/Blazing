import 'package:flutter/material.dart';
import 'package:ovantica/login/emaillogin.dart';
import 'package:ovantica/sheet.dart';
import 'package:ovantica/user/user_preference.dart';
import 'screen/homepage.dart';
class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    navigateToHome();
  }

  navigateToHome() async {
    await Future.delayed(Duration(milliseconds: 2000), () {});

    final userPrefs = await RememberUserPrefs.readUserInfo();
    Widget initialRoute;
    if (userPrefs == null) {
      initialRoute = EmailPage();
    } else {
      initialRoute = Sheet();
    }

    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => initialRoute));
  }
  //   FutureBuilder(
  //       future: RememberUserPrefs.readUserInfo(),
  //       builder: (context, dataSnapShot){
  //         if(dataSnapShot.data == null){
  //           return EmailPage();
  //   }else{
  //           return Sheet();
  //   }
  //       }
  //   );
  //  // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Sheet()));
  // }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body:  Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            Center(
                child: Image.asset('assets/icons/aks1.png',
                  height: screenHeight/2.5,width:screenWidth/1.5,fit: BoxFit.cover,)),
            // SizedBox(width: 5,),
            // Center(child: Text('Product',
            //     style:TextStyle(fontSize: 30,fontWeight: FontWeight.bold, color: Colors.black))),
          ]),
    );
  }
}