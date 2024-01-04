
import 'package:flutter/cupertino.dart';
import 'package:flutter_animated_icons/icons8.dart';
import 'package:flutter_animated_icons/lottiefiles.dart';
import 'package:flutter_animated_icons/useanimations.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:ovantica/productlistscreen.dart';
import 'package:ovantica/sheet.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart'as badges;
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io'as io;
import 'package:shared_preferences/shared_preferences.dart';
import 'bottomsheet.dart';
import 'cartmodel.dart';
import 'cartprovider.dart';
import 'screen/cartscreen.dart';

class PhoneItems extends StatefulWidget {
  final String? imageUrl;
  final String? name1;
  final String? name2;
  final String? name3;
  final String? name4;
  final String? name5;
  final String? name6;
  final String? name7;
  final String? name8;
  const PhoneItems({super.key,  this.name1, this.name2, this.imageUrl, this.name3, this.name4, this.name5, this.name6, this.name7, this.name8, });

  @override
  State<PhoneItems> createState() => _PhoneItemsState();
}

class _PhoneItemsState extends State<PhoneItems>with TickerProviderStateMixin {
  late AnimationController _favoriteController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _favoriteController = AnimationController(vsync: this,duration: Duration(seconds: 1));
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _favoriteController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
           padding: const EdgeInsets.all(5.0),
           child: Container(
              height:screenHeight/2.2,
              width: screenWidth/2.12,
              color: Colors.white,
              child: GestureDetector(
                child: Column(
                  children: [
                Align(
                       alignment: Alignment.topRight,
                    child: IconButton(
                          //splashColor: Colors.red,
                          //splashRadius: 50,
                          iconSize: 10,
                          onPressed: (){
                            if(_favoriteController.status == AnimationStatus.dismissed){
                              _favoriteController.reset();
                              _favoriteController.animateTo(0.6);
                            }else {
                              _favoriteController.reverse();
                            }
                          },
                          icon: Lottie.asset(Icons8.heart_color,controller: _favoriteController,width: 25,height: 25),
                        ),
                        // child: InkWell(
                        //   child: Icon(Icons.favorite_border),
                        //   onTap: (){},
                        // ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: screenHeight/4.8,
                      width: screenWidth/2.8,
                      color: Colors.white,
                      child: Image.asset(widget.imageUrl??'assets/images3/1.png',
                        height: screenHeight/4.8,width: screenWidth/2.9,fit: BoxFit.cover,),
                    ),
                    Container(
                      height: screenHeight/6.0,
                      width: screenWidth/2.2,
                      child: Column(
                        children: [
                          Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding:  EdgeInsets.only(left: screenWidth/80,top: screenHeight/200),
                                child: Container(
                                  height: screenHeight/50,
                                    width: screenWidth/2.2,
                                    child: Text(widget.name1??'realme 7 (128 GB Storage)',style: TextStyle(fontSize: 12),)),
                              )),
                          Align(
                            alignment: Alignment.topLeft,
                            child: RatingBar.builder(
                              unratedColor: Color.fromARGB(255, 223, 221, 221),
                              itemSize: 20,
                              initialRating: 3.5,
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemPadding: EdgeInsets.symmetric(horizontal: 4),
                              onRatingUpdate: (rating){},
                              itemBuilder: (context,_)=>Icon(Icons.star,color: Colors.amber,),
                            ),
                          ),
                          Row(
                            children: [
                              Align(
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                    padding: EdgeInsets.only(left: screenWidth/80,top: screenHeight/200),
                                    child: Text(widget.name2??'35% Off',style: TextStyle(color: Colors.green),),
                                  )),
                              Align(
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                    padding: EdgeInsets.only(left: screenWidth/80,top: screenHeight/200),
                                    child: Text(widget.name3??'₹12999'),
                                  )),
                            ],
                          ),
                          Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: EdgeInsets.only(left: screenWidth/80,top: screenHeight/200),
                                child: Container(
                                    height: screenHeight/50,
                                    width: screenWidth/2.2,
                                    child: Text(widget.name4??'free  delivery by Tomorrow',style: TextStyle(fontSize: 12),)),
                              )),
                          SizedBox(height: screenHeight/150,),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding:  EdgeInsets.only(left: screenWidth/80,),
                              child: Container(
                                height: screenHeight/40,
                                width: screenWidth/2.7,
                                decoration: BoxDecoration(
                                  border: Border.all(width: 1,color: Colors.grey),
                                ),
                                child: Row(
                                  children: [
                                    Text(widget.name5??' 8 GB RAM',style: TextStyle(fontSize: 12),),
                                    Text(widget.name6??' | '),
                                    Text(widget.name7??'5000 mAh',style: TextStyle(fontSize: 12),)
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: screenHeight/150,),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding:  EdgeInsets.only(left: screenWidth/80,),
                              child: Container(
                                height: screenHeight/40,
                                width: screenWidth/2.7,
                                decoration: BoxDecoration(
                                  border: Border.all(width: 1,color: Colors.grey),
                                ),
                                child: Row(
                                  children: [
                                    Text(widget.name8??'16MP Front Camera',style: TextStyle(fontSize: 12),),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                onTap: (){
                  if(widget.imageUrl == 'assets/images3/1.png'){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>
                        ChangeNotifierProvider(create: (_)=>CartProvider(),
                            child: Builder(builder: (BuildContext context){
                              return  ProductListScreen();}))));
                  }else if(widget.imageUrl == 'assets/images3/2.png'){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>
                        ChangeNotifierProvider(create: (_)=>CartProvider(),
                            child: Builder(builder: (BuildContext context){
                              return  ProductListScreen(imageUrl: 'assets/images3/2.png',name1: 'POCO',name2: '12 GG RAM',name3: 'off 3%',);
                            }))));
                  }else if (widget.imageUrl == 'assets/images3/3.png'){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ChangeNotifierProvider(create: (_)=>CartProvider(),
                    child: Builder(builder: (BuildContext context){
                      return ProductListScreen(imageUrl: 'assets/images3/3.png',name1: 'realme 10 Pro 5G',name2: '12GB RAM',name3: 'off 4%',);
                    },),)));
                  }else if (widget.imageUrl == 'assets/images3/4.png'){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ChangeNotifierProvider(create: (_)=>CartProvider(),
                    child: Builder(builder: (BuildContext context){
                      return ProductListScreen(imageUrl: 'assets/images3/4.png',name1: 'Realme c30',name2: '12 GB RAM',);
                    },),)));
                  }
                },
              ),
            ),
    );
  }
}