
import 'package:flutter/material.dart';
import 'login/emaillogin.dart';


class DrawerPage extends StatelessWidget {
  const DrawerPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.height;
    return  ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
          child: Column(
            children: <Widget>[
              Padding(
                padding:  EdgeInsets.only(left: screenWidth/25),
                child: Row(
                  children: [
                    ClipOval(
                        child: SizedBox.fromSize(
                            size: Size(45,45),
                            child: Image.asset('assets/icons/aks.png',height: screenHeight/15,width: screenWidth/8,))),
                    SizedBox(width: screenWidth/150,),
                    Text('BLAZING',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)
                  ],
                ),
              ),
              // ListTile(
              //   title: Text('BLAZING',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
              //   leading: SizedBox(
              //     height: screenHeight/30,
              //     width: screenWidth/30,
              //     child: Image.asset('assets/icons/aks.png'),
              //   ),
              // ),
              SizedBox(height: screenHeight/80,),
              Container(
                height: screenHeight/30,
                width: screenWidth/12,
                child: OutlinedButton( onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>EmailPage()));
                },
                  child: Text('Login',style: TextStyle(color: Colors.black),),
                  style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.white,
                      side: BorderSide(color: Colors.black,width: 1.0)),),
              )
            ],
          ),
        ),
        Divider(height: 0.1,color: Colors.black,),
        ListTile(
          title: Text('Profile'),
          leading:  Padding(
            padding:  EdgeInsets.only(left: screenWidth/100),
            child: SizedBox(
                height: screenHeight/30,
                width: screenWidth/30,
                child: Image.asset('assets/icons/profile1.png')),
          ),
          onTap: (){},
        ),
        Divider(height: 0.1,color: Colors.black,),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Contact Us'),
        ),
        ListTile(
          title: Text('Facebook'),
          leading: Padding(
            padding:  EdgeInsets.only(left: screenWidth/100),
            child: SizedBox(
                height: screenHeight/40,
                width: screenWidth/30,
                child: Image.asset('assets/icons/facebook1.png')),
          ),
          onTap: (){},
        ),
        ListTile(
          title: Text('Instagram'),
          leading: Padding(
            padding:  EdgeInsets.only(left: screenWidth/100),
            child: SizedBox(
                height: screenHeight/40,
                width: screenWidth/30,
                child: Image.asset('assets/icons/instagram1.png',)),
          ),
          onTap: (){},
        ),
        ListTile(
          title: Text('X'),
          leading: Padding(
            padding:  EdgeInsets.only(left: screenWidth/100),
            child: SizedBox(
                height: screenHeight/40,
                width: screenWidth/30,
                child: Image.asset('assets/icons/x.png',)),
          ),
          onTap: (){},
        ),
        ListTile(
          title: Text('Youtube'),
          leading: Padding(
            padding:  EdgeInsets.only(left: screenWidth/100),
            child: SizedBox(
                height: screenHeight/30,
                width: screenWidth/40,
                child: Image.asset('assets/icons/youtube1.png',)),
          ),
          onTap: (){},
        ),
        ListTile(
          title: Text('Gmail'),
          leading: Padding(
            padding:  EdgeInsets.only(left: screenWidth/100),
            child: SizedBox(
                height: screenHeight/40,
                width: screenWidth/30,
                child: Image.asset('assets/icons/gmail1.png',)),
          ),
          onTap: (){},
        ),
        ListTile(
          title: Text('Whatsapp'),
          leading: Padding(
            padding:  EdgeInsets.only(left: screenWidth/100),
            child: SizedBox(
                height: screenHeight/40,
                width: screenWidth/30,
                child: Image.asset('assets/icons/whatsapp2.png',)),
          ),
          onTap: (){},
        ),
        ListTile(
          title: Text('Phone'),
          leading: Padding(
            padding:  EdgeInsets.only(left: screenWidth/100),
            child: SizedBox(
                height: screenHeight/40,
                width: screenWidth/30,
                child: Image.asset('assets/icons/phone-icon.png',color: Colors.blue,)),
          ),
          onTap: (){},
        ),
        ListTile(
          title: Text('About us'),
          leading: Padding(
            padding:  EdgeInsets.only(left: screenWidth/100),
            child: SizedBox(
                height: screenHeight/40,
                width: screenWidth/30,
                child: Image.asset('assets/icons/about1.png',)),
          ),
          onTap: (){},
        ),
      ],
    );
  }
}


//
// void showToast(BuildContext context, String message, Color backgroundColor) {
//   ScaffoldMessenger.of(context).showSnackBar(
//     SnackBar(
//       dismissDirection: DismissDirection.startToEnd,
//       shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(15)
//       ),
//       content: Text(message,style: TextStyle(color: Colors.white),textAlign: TextAlign.center,),
//       backgroundColor: backgroundColor,
//     ),
//   );
// }
