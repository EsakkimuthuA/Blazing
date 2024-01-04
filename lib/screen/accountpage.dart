
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ovantica/login/phonelogin.dart';
import 'package:ovantica/sheet.dart';
import 'package:ovantica/user/current_user.dart';
import 'package:ovantica/user/user_preference.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../login/emaillogin.dart';

class AccountPage extends StatefulWidget {
   AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final CurrentUser _currentUser = Get.put(CurrentUser());

  signOutUser() async
  {
   var resultResponse = await Get.dialog(
      AlertDialog(
      backgroundColor: Colors.grey,
        title: Text('logout'),
        actions: [
          TextButton(onPressed: (){
            Get.back();
          },
              child: Text("no",style: TextStyle(color: Colors.black),)),
          TextButton(onPressed: (){
            Get.back(result: 'loggedOut');
          },
              child: Text("yes",style: TextStyle(color: Colors.black),))
        ],
      )
    );
    if (resultResponse == "loggedOut")
    {
//delete-remove the user data from phone local storage
      RememberUserPrefs.removeUserInfo()
          .then((value)
      {
        Get.off (EmailPage());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
     // backgroundColor: Color.fromARGB(100, 255, 255, 255),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      // bottomSheet: BottomSheetContainer(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
              Card(
                elevation: 5,
                child: Container(
                  height: screenHeight/6,
                  width: screenWidth/1.0,
                  color: Colors.white,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(width: 10,),
                          Image.asset('assets/icons/profile1.png',height: screenHeight/8,width: screenWidth/4.0,),
                          SizedBox(width: 20,),
                          // Column(
                          //   mainAxisAlignment: MainAxisAlignment.center,
                          //   crossAxisAlignment: CrossAxisAlignment.start,
                          //   children: [
                          //     Text(''),
                          //     Text('',style: TextStyle(fontSize: 10),),
                          //     Text('',style: TextStyle(fontSize: 10),),
                          //   ],
                          // ),
                          // SizedBox(width: screenWidth/7,),
                          // Text('Edit'),

                          OutlinedButton( onPressed: () {
                               Navigator.push(context, MaterialPageRoute(builder: (context)=>EmailPage()));
                             },
                               child: Text('Login',style: TextStyle(color: Colors.black),),
                               style: OutlinedButton.styleFrom(
                                   backgroundColor: Colors.pinkAccent,
                                   side: BorderSide(color:Colors.pinkAccent,width: 1.0)),),
                        ],
                      ),
                      Text(_currentUser.users.email),
                    ],
                  ),
                ),
              ),
            Card(
              elevation: 5,
              child: Container(
                height: screenHeight/6,
                width: screenWidth/1.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height:screenHeight/20,
                          width: screenWidth/2.3,
                          child: OutlinedButton(
                            onPressed: (){},
                            child: Row(
                              children: [
                                Image.asset('assets/icons/box.png',color: Colors.blue,height: screenHeight/25,width: screenWidth/18,),
                                SizedBox(width:screenWidth/30,),
                                Text('orders',style: TextStyle(color: Colors.black,fontSize: 13,fontWeight: FontWeight.w500),)
                              ],
                            ),
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(color: Colors.grey,width: 1.0),
                            ),
                          ),
                        ),

                        Container(
                          height:screenHeight/20,
                          width: screenWidth/2.3,
                          child: OutlinedButton(
                            onPressed: (){},
                            child: Row(
                              children: [
                                Icon(Icons.favorite_border,size: screenWidth/18,),
                                SizedBox(width:screenWidth/30,),
                                Text('Wishlist',style: TextStyle(color: Colors.black,fontSize: 13,fontWeight: FontWeight.w500),)
                              ],
                            ),
                            style: OutlinedButton.styleFrom(
                                side: BorderSide(color: Colors.grey,width: 1.0)
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height:screenHeight/20,
                          width: screenWidth/2.3,
                          child: OutlinedButton(
                            onPressed: (){},
                            child: Row(
                              children: [
                                Icon(Icons.card_giftcard_outlined,size: screenWidth/18,),
                                SizedBox(width:screenWidth/30,),
                                Text('Coupons',style: TextStyle(color: Colors.black,fontSize: 13,fontWeight: FontWeight.w500),)
                              ],
                            ),
                            style: OutlinedButton.styleFrom(
                                side: BorderSide(color: Colors.grey,width: 1.0)
                            ),
                          ),
                        ),
                        Container(
                          height:screenHeight/20,
                          width: screenWidth/2.3,
                          child: OutlinedButton(
                            onPressed: (){},
                            child: Row(
                              children: [
                                Icon(Icons.phone_in_talk_outlined,size: screenWidth/18,),
                                SizedBox(width:screenWidth/30,),
                                Text('Help Center',style: TextStyle(color: Colors.black,fontSize: 13,fontWeight: FontWeight.w500),)
                              ],
                            ),
                            style: OutlinedButton.styleFrom(
                                side: BorderSide(color: Colors.grey,width: 1.0)
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(top: screenHeight/60,left: screenWidth/30),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Text('Account Settings',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)),
            ),
            Card(
              elevation: 1,
              child: Ink(
                color: Colors.white,
                child: ListTile(
                  leading: Icon(Icons.person_2_outlined,color: Colors.blue,),
                  trailing: Icon(Icons.chevron_right_outlined,color: Colors.black,),
                  title: Text('Edit Profile',style: TextStyle(fontSize: 12),),
                  splashColor: Colors.greenAccent,
                  onTap: (){},
                ),
              ),
            ),
            Card(
              elevation: 1,
              child: Ink(
                color: Colors.white,
                child: ListTile(
                  leading: Icon(Icons.location_on_outlined,color: Colors.blue,),
                  trailing: Icon(Icons.chevron_right_outlined,color: Colors.black,),
                  title: Text('Address',style: TextStyle(fontSize: 12),),
                  splashColor: Colors.greenAccent,onTap: (){},
                ),
              ),
            ),

            Card(
              elevation: 1,
              child: Ink(
                color: Colors.white,
                child: ListTile(
                  leading: Icon(Icons.notifications_none,color: Colors.blue,),
                  trailing: Icon(Icons.chevron_right_outlined,color: Colors.black,),
                  title: Text('Notification',style: TextStyle(fontSize: 12),),
                  splashColor: Colors.greenAccent,
                  onTap: (){},
                ),
              ),
            ),
            Card(
              elevation: 1,
              child: Ink(
                color: Colors.white,
                child: ListTile(
                  leading: Icon(Icons.emoji_events_outlined,color: Colors.blue,),
                  trailing: Icon(Icons.chevron_right_outlined,color: Colors.black,),
                  title: Text('My Rewards',style: TextStyle(fontSize: 12),),
                  splashColor: Colors.greenAccent,onTap: (){},
                ),
              ),
            ),
            Card(
              elevation: 1,
              child: Ink(
                color: Colors.white,
                child: ListTile(
                  leading: Icon(Icons.credit_card_outlined,color: Colors.blue,),
                  trailing: Icon(Icons.chevron_right_outlined,color: Colors.black,),
                  title: Text('Saved Cards',style: TextStyle(fontSize: 12),),
                  splashColor: Colors.greenAccent,onTap: (){},
                ),
              ),
            ),
            SizedBox(height: screenHeight/50,),
            Container(
              height: screenHeight/30,
              width: screenWidth/2,
              child: OutlinedButton(onPressed: () {
                signOutUser();
                //final prefs = await SharedPreferences.getInstance();
                //prefs.setBool('userLoggedIn', false);
                // Navigator.pushReplacement(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => EmailPage(),
                //   ),
                // );
              },
                child: Text('Logout',style: TextStyle(fontSize: 13,),),
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.white,
                  side: BorderSide(color: Colors.grey),
                  // fixedSize: MaterialStatePropertyAll(
                  //   Size(200,20),
                  // ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
