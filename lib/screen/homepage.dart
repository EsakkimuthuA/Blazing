import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ovantica/color.dart';
import 'package:ovantica/customnavbar.dart';
import 'package:ovantica/sheet.dart';
import '../Drawer.dart';
import 'home_screen/SearchBar.dart';
import '../cartprovider.dart';
import 'home_screen/home-part2.dart';
import 'home_screen/itemscard.dart';
import 'categories_screen.dart';
import 'home_screen/carousel.dart';
import 'package:badges/badges.dart'as badges;
import 'package:provider/provider.dart';
class Homepage extends StatefulWidget {
  const Homepage({super.key,});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery
        .of(context)
        .size
        .height;
    var screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    return SafeArea(
      child: Scaffold(
      //  backgroundColor: Color.fromARGB(200, 255, 255, 255),
       // backgroundColor: Color.fromARGB(115, 255, 255, 255),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/icons/aks.png', fit: BoxFit.cover, height: 32,),
                SizedBox(width: screenWidth/50,),
                Text('BLAZING', style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.black)),
              ]),
          actions: [
            IconButton(onPressed: () {},
                icon: Icon(Icons.favorite_border, color: Colors.black,)),
            // IconButton(onPressed: () {},
            //     icon: Icon(CupertinoIcons.cart, color: Colors.black,)),
          ],
        ),
        drawer: Drawer(child: DrawerPage()),
        // bottomSheet: BottomSheetContainer(),

        body: SingleChildScrollView(scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Search(),
              SingleChildScrollView(scrollDirection: Axis.horizontal,
                child: Container(
                  //color: Colors.white,
                  child: Row(
                      children: [
                        CartItems(imageUrl: 'assets/images/phone8.png',name: 'Mobiles', routeName: '/mobiles',),
                        CartItems(imageUrl: 'assets/images/laptop1.png',name: 'Laptops',  routeName: '/laptops',),
                        CartItems(imageUrl: 'assets/images/accessories.png',name: 'Accessories',  routeName: '/accessories',),
                        CartItems (imageUrl: 'assets/images/fashion.png',name: 'Fashion',  routeName: '/fashion',),
                        CartItems (imageUrl: 'assets/images/tvs.png',name: 'Appliances',  routeName: '/appliances',),
                        CartItems (imageUrl: 'assets/images1/toys2.png',name: 'Toys & Baby', routeName: '/toys',),
                        CartItems (imageUrl: 'assets/images/furniture1.png',name: 'Furniture',  routeName: '/furniture',),
                        // MenuItems(imageUrl: 'assets/images/phone8.png',
                        //   name: 'Mobiles',),
                        // MenuItems(imageUrl: 'assets/images/laptop1.png',
                        //   name: 'Laptops',),
                        // MenuItems(imageUrl: 'assets/images/accessories.png',
                        //   name: 'Accessories',),
                        // MenuItems(imageUrl: 'assets/images/fashion.png',
                        //   name: 'Fashion',),
                        // MenuItems(imageUrl: 'assets/images/tvs.png',
                        //   name: 'Appliances',),
                        // MenuItems(imageUrl: 'assets/images1/toys2.png',
                        //   name: 'Toys & Baby',),
                        // MenuItems(imageUrl: 'assets/images/furniture1.png',
                        //   name: 'Furniture',),
                      ]),
                ),
              ),
              SizedBox(height: screenHeight/150,),
              Carousel(),
              SingleChildScrollView(scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ItemsCard(imageUrl: 'assets/images1/laptops2.png',
                      offer: 'Up to 20% Off',
                      name: 'Laptops',),
                    ItemsCard(imageUrl: 'assets/images/watch3.png',
                      offer: 'Under ₹199',
                      name: 'Watches',),
                    ItemsCard(imageUrl: 'assets/images/mobile5.png',
                      offer: 'Up to 20% Off ',
                      name: 'Phone',),
                  ],
                ),
              ),
              Container(
                height:screenHeight/7,
                width: screenWidth/0.9,
                  decoration: BoxDecoration(
                   // color: Colors.amberAccent
                  ),
              child: Image.asset('assets/images1/offer2.png',
                height: screenHeight/9,width: screenWidth/0.9,fit: BoxFit.cover,
              )),
              SizedBox(height: screenHeight/150,),
              Container(
                  height: screenHeight / 1.75,
                  //width: w/0.6,
                  // width: double.infinity,
                  color: color.yellow1,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Discounts for You', style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 20),),
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Discounts(imageUrl: 'assets/images/watch.jpg',
                                name: 'Smart Watches',
                                offers: 'Min 40% Off',),
                              Discounts(imageUrl: 'assets/images1/toys1.png',
                                name: 'Toys',
                                offers: 'Min.50% Off',),
                            ]
                        ),
                        SizedBox(height: screenHeight/100,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Discounts(imageUrl: 'assets/images1/t-shirts1.jpg',
                              name: "Men's T-shirts",
                              offers: 'Min.50% Off',),
                            Discounts(imageUrl: 'assets/images1/headset1.png',
                              name: 'Audio & Video',
                              offers: 'Min.50% Off',),
                          ],
                        ),
                      ]
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}

