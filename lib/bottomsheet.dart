import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:ovantica/screen/cartscreen.dart';
import 'package:ovantica/color.dart';
import 'package:ovantica/screen/homepage.dart';
import 'package:ovantica/screen/categories_screen.dart';
import 'package:flutter_animated_icons/icons8.dart';
import 'package:flutter_animated_icons/lottiefiles.dart';
import 'package:flutter_animated_icons/useanimations.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:ovantica/phoneitem.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart'as badges;
import 'Drawer.dart';
import 'cartprovider.dart';

/*
class BottomSheetContainer extends StatefulWidget {

  const BottomSheetContainer({Key? key}) : super(key: key);

  @override
  State<BottomSheetContainer> createState() => _BottomSheetContainerState();
}

class _BottomSheetContainerState extends State<BottomSheetContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                SizedBox.fromSize(
                  size: Size(55,40),
                  child: ClipRect(
                    child: Material(
                      color: Colors.white,
                      child: InkWell(
                        onTap: (){
                        setState((){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Homepage()));
                        });

                          //  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Homepage()));
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(Icons.home_outlined,size: 20,),
                            Text('Home',style: TextStyle(fontSize: 13),)
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Column(
              children: [
                SizedBox.fromSize(
                  size: Size(90,40),
                  child: ClipRect(
                    child: Material(
                      color: Colors.white,
                      child: InkWell(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MobilesPage()));
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(Icons.grid_view,size: 20,),
                            Text('Categories',style: TextStyle(fontSize: 13),)
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Column(
              children: [
                SizedBox.fromSize(
                    size: Size(70,40),
                    child: ClipRect(
                        child: Material(
                            color: Colors.white,
                            child: InkWell(
                                onTap: (){
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AccountPage()));
                                },
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children:[
                                      Icon(Icons.account_circle_outlined,size: 20,),
                                      Text('Account',style: TextStyle(fontSize: 13),)
                                    ]
                                )
                            )
                        )
                    )
                )
              ],
            ),
            Column(
              children: [
                SizedBox.fromSize(
                  size: Size(100,40),
                  child: ClipRect(
                      child:Material(
                          color:Colors.white,
                          child:InkWell(
                              onTap:(){
                                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>NotificationPage()));
                              },
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children:[
                                    Icon(Icons.notifications_none,size:20),
                                    Text('Notifications',style: TextStyle(fontSize: 13),)
                                  ]
                              )
                          )
                      )
                  ),
                )
              ],
            ),
            Column(
              children: [
                   SizedBox.fromSize(
                       size: Size(50,40),
                        child: ClipRect(
                                  child: Material(
                                    color: Colors.white,
                                    child: InkWell(
                                        onTap: (){
                                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CartScreen()));
                                        },
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                            children:[
                                                 Center(
                                                    child:badges.Badge (
                                                      badgeContent: Consumer<CartProvider>(
                                                        builder:(context, value, child){
                                                          return Text(value.getCounter().toString(),
                                                            style: TextStyle(color: Colors.black,fontSize: 10),);
                                                        },
                                                      ),
                                                      badgeAnimation: badges.BadgeAnimation.rotation(
                                                          animationDuration: Duration(milliseconds: 300)
                                                      ),
                                                      child: Icon(CupertinoIcons.cart,size: 20,),

                                                    ),
                                                  ),
                                              Text('Cart',style: TextStyle(fontSize: 13),)
                                            ]
                                        )
                                    ),
                                  )
                              ),
                            )
              ],
            )
          ],
        ),
      ),
    );
  }
}*/
class Brand extends StatelessWidget {
  final String? brandName;
  final String? name;
  const Brand({super.key, this.brandName, this.name});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return  Column(
      children: [
        GestureDetector(
          child: Padding(
            padding: EdgeInsets.only(left: screenWidth/10,bottom: screenHeight/50),
            child: Container(
              height:screenHeight/8.2,
              width: screenWidth/5.0,
              //color: Colors.pinkAccent,
              child: Column(
                children: [
                  SizedBox(
                    height: screenHeight/13,
                    width: screenWidth/6.0,
                    //size: Size(75,75),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Material(
                         color: Color.fromARGB(40, 60, 255, 255),
                          child: Center(
                              child: Image.asset(brandName??'assets/icons/realme1.png',height: screenHeight/10,width:screenWidth/ 8,)
                  )),
                    ),
                  ),
                  SizedBox(height: screenHeight/200,),
                  Center(child: Text(name??'Shop Now',style: TextStyle(fontSize:screenHeight/ 80),))
                ],
              ),
            ),
          ),
          onTap: (){
            if(brandName == 'assets/icons/realme1.png'){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Realme()));
            }else if(brandName == 'assets/icons/poco.png'){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>POCO()));
            }else if(brandName == 'assets/icons/samsung.png'){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Samsung()));
            }else if(brandName == 'assets/icons/vivo1.png'){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>POCO()));
            }else if(brandName == 'assets/icons/motorola.png'){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>POCO()));
            }else if(brandName == 'assets/icons/mi.png'){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>POCO()));
            }else if(brandName == 'assets/icons/iphonelogo.png'){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>POCO()));
            }else if(brandName == 'assets/icons/infinix.png'){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>POCO()));
            }else if(brandName == 'assets/icons/oneplus.png'){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>POCO()));
            }
          },
        ),
      ],
    );
  }
}
class Samsung extends StatefulWidget {
  const Samsung({super.key});

  @override
  State<Samsung> createState() => _SamsungState();
}

class _SamsungState extends State<Samsung> {
  Icon customIcon = const Icon(Icons.search);
  Widget customSearchBar = const Text('Samsung');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(239, 255, 255, 255),
        appBar: AppBar(
          title: customSearchBar,
          actions: [
            IconButton(onPressed: (){
              setState((){
                if(customIcon.icon == Icons.search){
                  customIcon = const Icon(Icons.cancel);
                  customSearchBar = const ListTile(
                    leading: Icon(
                      Icons.search,
                      color: Colors.white,
                      size: 28,
                    ),
                    title: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search...',
                        hintStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontStyle: FontStyle.italic,
                        ),
                        border: InputBorder.none,
                      ),
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  );
                }else{
                  customIcon = Icon(Icons.search);
                  customSearchBar = const Text('Samsung');
                }
              });
            },
                icon: customIcon)
          ],
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Row(
                children: [
                  PhoneItems(imageUrl: 'assets/images3/1.png',),
                  PhoneItems(imageUrl: 'assets/images3/2.png',name1: 'realme 10',),
                ],
              ),
              Row(
                children: [
                  PhoneItems(imageUrl: 'assets/images3/3.png',name1: 'realme 10 Pro 5G',),
                  PhoneItems(imageUrl: 'assets/images3/4.png',name1: 'realme c30',),
                ],
              ),
            ],
          ),
        )
    );
  }
}


class POCO extends StatefulWidget {
  const POCO({super.key});

  @override
  State<POCO> createState() => _POCOState();
}

class _POCOState extends State<POCO> {
  Icon customIcon = const Icon(Icons.search);
  Widget customSearchBar = const Text('POCO');
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(239, 255, 255, 255),
        appBar: AppBar(
          title: customSearchBar,
          actions: [
            IconButton(onPressed: (){
              setState((){
                if(customIcon.icon == Icons.search){
                  customIcon = const Icon(Icons.cancel);
                  customSearchBar = const ListTile(
                    leading: Icon(
                      Icons.search,
                      color: Colors.white,
                      size: 28,
                    ),
                    title: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search...',
                        hintStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontStyle: FontStyle.italic,
                        ),
                        border: InputBorder.none,
                      ),
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  );
                }else{
                  customIcon = Icon(Icons.search);
                  customSearchBar = const Text('POCO');
                }
              });
            },
                icon: customIcon)
          ],
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Row(
                children: [
                  PhoneItems(imageUrl: 'assets/images3/1.png',),
                  PhoneItems(imageUrl: 'assets/images3/2.png',name1: 'realme 10',),
                ],
              ),
              Row(
                children: [
                  PhoneItems(imageUrl: 'assets/images3/3.png',name1: 'realme 10 Pro 5G',),
                  PhoneItems(imageUrl: 'assets/images3/4.png',name1: 'realme c30',),
                ],
              ),
            ],
          ),
        )
    );
  }
}


class Realme extends StatefulWidget {
   Realme({super.key,});

  @override
  State<Realme> createState() => _RealmeState();
}

class _RealmeState extends State<Realme> {
  Icon customIcon = const Icon(Icons.search);
  Widget customSearchBar = const Text('Realme');
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color.fromARGB(239, 255, 255, 255),
      appBar: AppBar(
        title: customSearchBar,
        actions: [
          IconButton(onPressed: (){
            setState((){
              if(customIcon.icon == Icons.search){
                customIcon = const Icon(Icons.cancel);
                customSearchBar = const ListTile(
                  leading: Icon(
                    Icons.search,
                    color: Colors.white,
                    size: 28,
                  ),
                  title: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search...',
                      hintStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontStyle: FontStyle.italic,
                      ),
                      border: InputBorder.none,
                    ),
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                );
              }else{
                customIcon = Icon(Icons.search);
                customSearchBar = const Text('Realme');
              }
            });
            },
              icon: customIcon)
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Row(
              children: [
                PhoneItems(imageUrl: 'assets/images3/1.png',),
                PhoneItems(imageUrl: 'assets/images3/2.png',name1: 'realme 10',),
              ],
            ),
            Row(
              children: [
                PhoneItems(imageUrl: 'assets/images3/3.png',name1: 'realme 10 Pro 5G',),
                PhoneItems(imageUrl: 'assets/images3/4.png',name1: 'realme c30',),
              ],
            ),

               /* InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, "itemPage");
                  },
                  child: GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: 0.55,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: [
                      for(int i=1;i<7;i++)
                        Container(
                          padding: EdgeInsets.only(right: 10,left: 10,top: 10),
                          margin: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 5,
                                spreadRadius: 1,
                              )
                            ]
                          ),
                          child: Column(
                            children: [
                              Container(
                                alignment: Alignment.topRight,
                                child: IconButton(onPressed: () {},
                                  icon: Icon(Icons.favorite_border),
                                ),

                              ),
                              InkWell(
                                onTap: (){
                                  Navigator.pushNamed(context, "itemPage");
                                },
                                child: Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Image.asset("assets/images3/$i.png",height: 130,width: 130,fit: BoxFit.cover,),
                                )
                              ),
                              Padding(
                                  padding: EdgeInsets.only(bottom: 8),
                                child: Container(
                                  alignment: Alignment.topLeft,
                                    child: Text('Realme 7 Pro',style: TextStyle(fontWeight: FontWeight.bold,),)),
                              ),

                            ],
                          ),
                        )
                    ],
                  ),
                ),*/
              ],
        ),
      )
    );
  }
}

/*class Realme7 extends StatefulWidget {
  const Realme7({super.key});

  @override
  State<Realme7> createState() => _Realme7State();
}

class _Realme7State extends State<Realme7>with TickerProviderStateMixin {
  late AnimationController _favoriteController;
  @override
  void initState() {
    super.initState();

    _favoriteController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
  }

  @override
  void dispose() {
    _favoriteController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
      backgroundColor: Colors.white,
        leading: BackButton(color: Colors.black,),
      ),
      bottomSheet: Row(
        children: [
          Container(
            height:60,
            width: screenWidth/2,
            color: color.blue1,
            child: Center(child: Text('Buy Now',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)),
          ),
          InkWell(
            child: Container(
              height: 60,
              width:screenWidth/ 2,
              color: Colors.greenAccent,
              child: Center(child: Text('Add To Cart',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20))),
            ),
            onTap: (){
              showModalBottomSheet(context: context, builder: (context){
                return CustomBottomSheet();
              });
            },
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10,top: 20),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text('realme 10 (Clash White, 64GB)(4 GB RAM)',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10,top: 20),
            child: Align(
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
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20,),
            child: Align(
              alignment: Alignment.topRight,
              child: IconButton(
                splashRadius: 50,
                iconSize: 30,
                onPressed:  (){
                  if (_favoriteController.status ==
                      AnimationStatus.dismissed) {
                    _favoriteController.reset();
                    _favoriteController.animateTo(0.6);
                  } else {
                    _favoriteController.reverse();
                  }
                },  icon: Lottie.asset(Icons8.heart_color,
                  controller: _favoriteController),
              ),
            ),
          ),
              Container(
                alignment: Alignment.center,
                height: screenHeight/2.0,
                width: screenWidth/1.2,
                color: Colors.white,
                child: Image.asset('assets/images3/1.png',
                  height: screenHeight/2.0,width: screenWidth/1.2,fit: BoxFit.cover,),
              ),
        ],
      ),
    );
  }
}*/


class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('All Categories'),
        backgroundColor: Colors.white,
      ),
    //  bottomSheet: BottomSheetContainer(),
    );
  }
}