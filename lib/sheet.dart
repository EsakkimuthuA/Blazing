import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ovantica/bottomsheet.dart';
import 'package:ovantica/screen/cartscreen.dart';
import 'package:ovantica/screen/homepage.dart';
import 'package:ovantica/screen/categories_screen.dart';
import 'package:badges/badges.dart'as badges;
import 'package:ovantica/user/current_user.dart';
import 'package:provider/provider.dart';

import 'screen/accountpage.dart';
import 'cartprovider.dart';
class Sheet extends StatefulWidget {
  const Sheet({super.key});

  @override
  State<Sheet> createState() => _SheetState();
}

class _SheetState extends State<Sheet> {
  CurrentUser _rememberCurrentUser = Get.put(CurrentUser());//

  int currentIndex = 0;
  final screens =[
      Homepage(),
      CategoriesPage(),
      //MobilesPage(),
      AccountPage(),
      CartScreen(),
  ];
  @override
  Widget build(BuildContext context) {
   return GetBuilder(                  //
     init: CurrentUser(),              //
     initState: (currentState){              //
       _rememberCurrentUser.getUserInfo();   //
     },
     builder: (controller) {             //
       return Scaffold(
         backgroundColor: Color.fromARGB(200, 255, 255, 255),
         body: screens[currentIndex],
         bottomNavigationBar: BottomNavigationBar(
           // backgroundColor: Colors.white,
           iconSize: 20,
           selectedFontSize: 10,
           unselectedFontSize: 10,
           selectedItemColor: Colors.orange,
           unselectedItemColor: Colors.black,
           //showUnselectedLabels: false,
           currentIndex: currentIndex,
           onTap: (index) => setState(() => currentIndex = index),
           type: BottomNavigationBarType.fixed,
           items: [
             BottomNavigationBarItem(
               icon: Icon(Icons.home_outlined), label: 'Home',),
             BottomNavigationBarItem(
                 icon: Icon(Icons.grid_view), label: 'Categories'),
             // BottomNavigationBarItem(icon: Icon(Icons.notifications_none),label: 'Notification'),
             BottomNavigationBarItem(
                 icon: Icon(Icons.account_circle_outlined), label: 'Account'),
             BottomNavigationBarItem(icon: Center(
               child: badges.Badge(
                 badgeContent: Consumer<CartProvider>(
                   builder: (context, value, child) {
                     return Text(value.getCounter().toString(),
                       style: TextStyle(color: Colors.black, fontSize: 10),);
                   },
                 ),
                 badgeAnimation: badges.BadgeAnimation.rotation(
                     animationDuration: Duration(milliseconds: 300)
                 ),
                 child: Icon(CupertinoIcons.cart, size: 20,),
               ),
             ), label: 'Cart'),
           ],
         ),
       );
     }
   );

  }
}
