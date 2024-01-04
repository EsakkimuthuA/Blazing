import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ovantica/screen/accountpage.dart';
import 'package:ovantica/screen/cartscreen.dart';
import 'package:ovantica/screen/homepage.dart';
import 'package:ovantica/login/emaillogin.dart';
import 'package:ovantica/login/phonelogin.dart';
import 'package:ovantica/phoneitem.dart';
import 'package:ovantica/productlistscreen.dart';
import 'package:ovantica/sheet.dart';
import 'package:ovantica/splash.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'bottomsheet.dart';
import 'cartprovider.dart';
import 'screen/categories_screen.dart';


void main(){
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (_)=>CartProvider(),
        child: Builder(builder: (BuildContext context){
          return  GestureDetector(
            onTap: ()=>FocusManager.instance.primaryFocus?.unfocus(),
            child: GetMaterialApp(
             debugShowCheckedModeBanner: false,
             title: 'flutter demo',
              home: const Splash(),
              // getPages: [
              //   GetPage(name: "phoneitem", page: () => ProductListScreen()),
              //   GetPage(name: "/mobiles", page: () => MobilesPage()),
              //   GetPage(name: "Sheet", page: ()=>Sheet()),
              //   // Define your other routes
              // ],
            routes: {
             "phoneitem": (context)=> ProductListScreen(),
              "/mobiles": (context)=>MobilesPage(),
              "/laptops": (context)=>LaptopsPage(),
              "/accessories":(context)=>Accessories(),
              "/fashion":(context)=>FashionPage(),
              "/appliances":(context)=>AppliancesPage(),
              "/toys":(context)=>ToysPage(),
              "/furniture":(context)=>FurniturePage(),
            //  "/categories":(context)=>MobilesPage()
              //"/accounts": (context)=>AccountPage(),
              // "/notifications":(context)=>NotificationPage(),
              // "/cart":(context)=>CartScreen()
              "Sheet":(context)=>Sheet(),
            },
    ),
          );
    }));
  }
}
