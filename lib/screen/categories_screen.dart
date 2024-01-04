import 'package:flutter/material.dart';
import 'package:ovantica/screen/homepage.dart';
import 'package:ovantica/sheet.dart';
import 'accountpage.dart';
import '../bottomsheet.dart';
import '../color.dart';
// class MenuItems extends StatelessWidget {
//   final String? imageUrl;
//   final String? name;
//  const MenuItems({super.key, this.imageUrl, this.name});
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//           padding: const EdgeInsets.only(left: 20),
//           child: GestureDetector(
//             child: Container(
//                 height: 80,
//                 width: 70,
//                 decoration: BoxDecoration(
//                   color: Color.fromARGB(255 , 255, 255, 255),
//                   borderRadius: BorderRadius.circular(5),
//                 ),
//                   child: Column(
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.all(4.0),
//                         child: Container(
//                           height: 55,
//                           width:55,
//                           child: Image.asset(imageUrl??'assets/images/phone8.png',),
//                         ),
//                       ),
//                       Container(
//                         height: 15,
//                         width: 50,
//                         child: Center(child: Text(name??'Mobiles',
//                           style: TextStyle(fontSize: 8,fontWeight: FontWeight.w500),)),
//                       )
//                     ],
//                   ),
//               ),
//             onTap: (){
//              if(imageUrl == 'assets/images/phone8.png'){
//                 Navigator.of(context).push(MaterialPageRoute(builder: (context)=> MobilesPage()));
//               } else if(imageUrl == 'assets/images/laptop1.png'){
//                 Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LaptopsPage()));
//               }else if(imageUrl== 'assets/images/accessories.png'){
//                 Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Accessories()));
//               }else if(imageUrl== 'assets/images/fashion.png'){
//                 Navigator.of(context).push(MaterialPageRoute(builder: (context)=> FashionPage()));
//               }else if(imageUrl== 'assets/images/tvs.png'){
//                 Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AppliancesPage()));
//               }else if(imageUrl== 'assets/images/toys2.png'){
//                 Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ToysPage()));
//               }else if(imageUrl== 'assets/images/furniture1.png'){
//                 Navigator.of(context).push(MaterialPageRoute(builder: (context)=> FurniturePage()));
//               };
//             },
//           ),
//     );
//   }
// }

class CartItems extends StatefulWidget {
  final String? imageUrl;
  final String? name;
  final String routeName; // Add routeName to identify the destination route.

  CartItems({super.key, this.imageUrl, this.name, required this.routeName, });

  @override
  State<CartItems> createState() => _CartItemsState();
}

class _CartItemsState extends State<CartItems> {

  List<bool> isSelected = [false];

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(left: screenWidth/30),
      child: Card(
        elevation: 2,
        child:  ToggleButtons(
          onPressed: (int newIndex){
            setState(() {
              // looping through the list of booleans values
              for (int index = 0; index < isSelected.length; index++) {
                // checking for the index value
                if (index == newIndex) {
                  // one button is always set to true
                  isSelected[index] = true;
                } else {
                  // other two will be set to false and not selected
                  isSelected[index] = false;
                }
              }
            });
            // setState(() {
            //   isSelected[index] = !isSelected[index];
            // });
            // Get the current route name
            final currentRoute = ModalRoute.of(context)?.settings.name;
            // Check if the current route is not the same as the destination page route
            if (currentRoute != widget.routeName) {
              Navigator.of(context).pushReplacementNamed(widget.routeName);
            }
          },
         // selectedBorderColor: Colors.red[700],

          selectedColor: Colors.transparent,
          fillColor: Colors.transparent,
          color: Colors.transparent,
          isSelected: isSelected,

          children: [
            Container(
                height: screenHeight/10,
                width: screenWidth/5.0,
                color: Colors.transparent,
                child: Column(
                        children: [
                          SizedBox(height:screenHeight/200,),
                          SizedBox.fromSize(
                            size: Size(60,60),
                            child: ClipOval(
                              child: Material(
                                color: Color.fromARGB(40, 60, 255, 255),
                                child: Center(
                                  child: Image(
                                    image: AssetImage(widget.imageUrl ?? 'assets/images/phone8.png',),
                                    height: screenHeight/20,
                                    width: screenWidth/9,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                              height: screenHeight/80,
                              width: screenWidth/6,
                             // color: color.blue,
                              child: Center(
                                  child: Text(widget.name ?? 'Mobiles',
                                    style: TextStyle(color: Colors.blue,fontSize: screenHeight/90,fontWeight: FontWeight.w500),)))
                        ],
                      ),
                  // style: OutlinedButton.styleFrom(
                  //     backgroundColor: Colors.white,
                  //     side: BorderSide(color: Colors.white),
                  // ),
                ),

          ],
        ),
      ),
    );
  }
}
class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  int currentIndex = 0;
  final pages = [
    MobilesPage(),
    LaptopsPage(),
   Accessories(),
    FashionPage(),
    AppliancesPage(),
    ToysPage(),
    FurniturePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color.fromARGB(150, 255, 255, 255),
      body: pages[currentIndex],
    );
  }
}

class MobilesPage extends StatelessWidget {
  const MobilesPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(150.0),
        child: AppBar(
          elevation: 4,
          backgroundColor: Colors.white,
          title: Text('All Categories', style: TextStyle(color: Colors.black),),
         // automaticallyImplyLeading: false,
          leading: BackButton(color: Colors.black,
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Sheet()));
            },),
          flexibleSpace: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Row(
                children: [
                  CartItems(imageUrl: 'assets/images/phone8.png',name: 'Mobiles', routeName: '/mobiles',),
                  CartItems(imageUrl: 'assets/images/laptop1.png',name: 'Laptops',  routeName: '/laptops',),
                  CartItems(imageUrl: 'assets/images/accessories.png',name: 'Accessories',  routeName: '/accessories',),
                  CartItems (imageUrl: 'assets/images/fashion.png',name: 'Fashion',  routeName: '/fashion',),
                  CartItems (imageUrl: 'assets/images/tvs.png',name: 'Appliances',  routeName: '/appliances',),
                  CartItems (imageUrl: 'assets/images1/toys2.png',name: 'Toys & Baby', routeName: '/toys',),
                  CartItems (imageUrl: 'assets/images/furniture1.png',name: 'Furniture',  routeName: '/furniture',),
                ],
              ),
            ),
          ),
        ),
      ),
     // bottomSheet: BottomSheetContainer(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                                Colors.white,
                                color.blue1
                              ],
                              stops: [0.0,0.8],
                              begin: FractionalOffset.topLeft,
                              end: FractionalOffset.topRight,
                              tileMode: TileMode.repeated
                          )
                      ),
                      height: screenHeight/9,
                      width: screenWidth/1.0,
                      child: Center(
                        child: Text('Smartphones >',
                          style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 30),),
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.only(left: screenWidth/30,top: screenHeight/60,bottom: screenHeight/60),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text('Shop By Brand',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
                      ),
                    ),
                    Row(
                      children: [
                        Brand(brandName: 'assets/icons/realme1.png',name: 'Shop Now',),
                        Brand(brandName: 'assets/icons/poco.png',name: 'Shop Now',),
                        Brand(brandName: 'assets/icons/samsung.png',name: 'Shop Now',),
                      ],
                    ),
                    Row(
                      children: [
                        Brand(brandName: 'assets/icons/vivo1.png',name: 'Shop Now',),
                        Brand(brandName: 'assets/icons/motorola.png',name: 'Shop Now',),
                        Brand(brandName: 'assets/icons/mi.png',name: 'Shop Now',),
                      ],
                    ),
                    Row(
                      children: [
                        Brand(brandName: 'assets/icons/iphonelogo.png',name: 'Shop Now',),
                        Brand(brandName: 'assets/icons/infinix.png',name: 'Shop Now',),
                        Brand(brandName: 'assets/icons/oneplus.png',name: 'Shop Now',),
                      ],
                    ),
                    Padding(
                      padding:  EdgeInsets.only(left: screenWidth/30,top: screenHeight/60,bottom: screenHeight/60),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text('Trending Now',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20),),
                      ),
                    ),
                    Row(
                      children: [
                        Brand(brandName: 'assets/icons/5g.png',name: '5G Mobiles',),
                        Brand(brandName: 'assets/icons/percentile.png',name: 'Best Deal',),
                      ],
                    ),
                    Container(
                      height: 50,
                    )
                  ],
                ),
          ),
    );
  }
}

class LaptopsPage extends StatelessWidget {
  const LaptopsPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(150.0),
        child: AppBar(
          backgroundColor: Colors.white,
          title: Text('All Categories', style: TextStyle(color: Colors.black),),
        //  automaticallyImplyLeading: false,
          leading: BackButton(color: Colors.black,
            onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>CategoriesPage()));
            },),
          flexibleSpace: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Row(
                children: [
                  CartItems(imageUrl: 'assets/images/phone8.png',name: 'Mobiles', routeName: '/mobiles',),
                  CartItems(imageUrl: 'assets/images/laptop1.png',name: 'Laptops',  routeName: '/laptops',),
                  CartItems(imageUrl: 'assets/images/accessories.png',name: 'Accessories',  routeName: '/accessories',),
                  CartItems (imageUrl: 'assets/images/fashion.png',name: 'Fashion',  routeName: '/fashion',),
                  CartItems (imageUrl: 'assets/images/tvs.png',name: 'Appliances',  routeName: '/appliances',),
                  CartItems (imageUrl: 'assets/images1/toys2.png',name: 'Toys & Baby', routeName: '/toys',),
                  CartItems (imageUrl: 'assets/images/furniture1.png',name: 'Furniture',  routeName: '/furniture',),
                ],
              ),
            ),
          ),
        ),
      ),
    //  bottomSheet: BottomSheetContainer(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.white,
                    color.blue1
                  ],
                  stops: [0.0,0.8],
                  begin: FractionalOffset.topLeft,
                  end: FractionalOffset.topRight,
                  tileMode: TileMode.repeated
                )
              ),
              height: screenHeight/9,
              width: screenWidth/1.0,
             // color: color.blue1,
              child: Center(child: Text('Laptops >',
                style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 30),)),
            ),
            Padding(
              padding:  EdgeInsets.only(left: screenWidth/30,top: screenHeight/60,bottom: screenHeight/60),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Text('Laptops',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20),)),
            ),
            Row(
              children: [
                Brand(brandName: 'assets/images1/laptops1.png',name: 'Gaming \nLaptops',),
                Brand(brandName: 'assets/images1/laptops2.png',name: 'Thin & Light\nLaptops',),
                Brand(brandName: 'assets/images1/laptops3.png',name: 'Latest\nLaunched',),
              ],
            ),
            Row(
              children: [
                Brand(brandName: 'assets/images1/pc.png',name: 'All in One PC',),
                Brand(brandName: 'assets/images1/laptop5.png',name: 'ChromeBook',),
                Brand(brandName: 'assets/images1/laptops2in1.png',name: '2-in-1 Laptops',)
              ],
            ),
            Padding(
                padding:  EdgeInsets.only(left: screenWidth/30,top: screenHeight/60,bottom: screenHeight/60),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text('Tablets',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20),),
                )),
            Row(
              children: [
                Brand(brandName: 'assets/images1/tablet-min.png',name: 'Tablet with \n Calling',),
                Brand(brandName: 'assets/images1/tablet3-min.png',name: 'Wi-fi Only',),
                Brand(brandName: 'assets/images1/tablet1-min.png',name: 'Premium \n Tablets',),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Accessories extends StatelessWidget {
  const Accessories({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(150.0),
        child: AppBar(
          backgroundColor: Colors.white,
          title: Text('All Categories', style: TextStyle(color: Colors.black),),
         // automaticallyImplyLeading: false,
          leading: BackButton(color: Colors.black,
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>CategoriesPage()));
            },),
          flexibleSpace: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Row(
                children: [
                  CartItems(imageUrl: 'assets/images/phone8.png',name: 'Mobiles', routeName: '/mobiles',),
                  CartItems(imageUrl: 'assets/images/laptop1.png',name: 'Laptops',  routeName: '/laptops',),
                  CartItems(imageUrl: 'assets/images/accessories.png',name: 'Accessories',  routeName: '/accessories',),
                  CartItems (imageUrl: 'assets/images/fashion.png',name: 'Fashion',  routeName: '/fashion',),
                  CartItems (imageUrl: 'assets/images/tvs.png',name: 'Appliances',  routeName: '/appliances',),
                  CartItems (imageUrl: 'assets/images1/toys2.png',name: 'Toys & Baby', routeName: '/toys',),
                  CartItems (imageUrl: 'assets/images/furniture1.png',name: 'Furniture',  routeName: '/furniture',),
                ],
              ),
            ),
          ),
        ),
      ),
     // bottomSheet: BottomSheetContainer(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              height: screenHeight/9,
              width: screenWidth/1.0,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        Colors.white,
                        color.blue1
                      ],
                      stops: [0.0,0.8],
                      begin: FractionalOffset.topLeft,
                      end: FractionalOffset.topRight,
                      tileMode: TileMode.repeated
                  )
              ),
              child: Center(child: Text('Accessories >',
                style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 30),)),
            ),
            Padding(
              padding:  EdgeInsets.only(left: screenWidth/30,top: screenHeight/60,bottom: screenHeight/60),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Text('Computer Accessories',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20),)),
            ),
            Row(
              children: [
                Brand(brandName: 'assets/images1/ups.png',name: 'UPS',),
                Brand(brandName: 'assets/images1/webcam.png',name: 'Webcam',),
                Brand(brandName: 'assets/images1/keyboard.png',name: 'Keyboards',),
              ],
            ),
            Row(
              children: [
                Brand(brandName: 'assets/images1/mouse.png',name: 'Mouse',),
                Brand(brandName: 'assets/images1/router.png',name: 'Routers',),
              ],
            ),
            Padding(
                padding: EdgeInsets.only(left: screenWidth/30,top: screenHeight/60,bottom: screenHeight/60),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text('Mobile Accessories',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20),),
                )),
            Row(
              children: [
                Brand(brandName: 'assets/images1/phonecover.png',name: 'Mobile Covers',),
                Brand(brandName: 'assets/images1/charger.png',name: 'Chargers &\n Cables',),
                Brand(brandName: 'assets/images1/selfiestick.png',name: 'Vlogging',)
              ],
            ),
            Padding(
              padding:  EdgeInsets.only(left: screenWidth/30,top: screenHeight/60,bottom: screenHeight/60),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text('Gaming',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20),),
              ),
            ),
            Row(
              children: [
                Brand(brandName: 'assets/images1/gaming.png',name: 'Gaming\nConsoles',),
                Brand(brandName: 'assets/images1/gamepad.png',name: 'Gamepads &\nController',),
              ],
            ),
            Container(
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}
class AppliancesPage extends StatelessWidget {
  const AppliancesPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(150.0),
        child: AppBar(
          backgroundColor: Colors.white,
          title: Text('All Categories', style: TextStyle(color: Colors.black),),
          automaticallyImplyLeading: false,
          flexibleSpace: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Row(
                children: [
                  CartItems(imageUrl: 'assets/images/phone8.png',name: 'Mobiles', routeName: '/mobiles',),
                  CartItems(imageUrl: 'assets/images/laptop1.png',name: 'Laptops',  routeName: '/laptops',),
                  CartItems(imageUrl: 'assets/images/accessories.png',name: 'Accessories',  routeName: '/accessories',),
                  CartItems (imageUrl: 'assets/images/fashion.png',name: 'Fashion',  routeName: '/fashion',),
                  CartItems (imageUrl: 'assets/images/tvs.png',name: 'Appliances',  routeName: '/appliances',),
                  CartItems (imageUrl: 'assets/images1/toys2.png',name: 'Toys & Baby', routeName: '/toys',),
                  CartItems (imageUrl: 'assets/images/furniture1.png',name: 'Furniture',  routeName: '/furniture',),
                ],
              ),
            ),
          ),
        ),
      ),
     // bottomSheet: BottomSheetContainer(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              height: screenHeight/9,
              width: screenWidth/1.0,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        Colors.white,
                        color.blue1
                      ],
                      stops: [0.0,0.8],
                      begin: FractionalOffset.topLeft,
                      end: FractionalOffset.topRight,
                      tileMode: TileMode.repeated
                  )
              ),
              child: Center(child: Text('TVs & Appliances >',
                style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 30),)),
            ),
            Padding(
              padding: EdgeInsets.only(left: screenWidth/30,top: screenHeight/60,bottom: screenHeight/60),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Text('Televisions',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20),)),
            ),
            Row(
              children: [
                Brand(brandName: 'assets/images1/tvs1.png',name: 'Ultra HD 4K\n Smart TVs',),
                Brand(brandName: 'assets/images1/tvs2.png',name: 'Crystal Vision',),
                Brand(brandName: 'assets/images1/tvs3.png',name: 'Big Screen\n Smart TVs',),
              ],
            ),
            Padding(
                padding:  EdgeInsets.only(left: screenWidth/30,top: screenHeight/60,bottom: screenHeight/60),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text('Kitchen Appliances',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20),),
                )),
            Row(
              children: [
                Brand(brandName: 'assets/images1/cooker.png',name: 'Cookers',),
                Brand(brandName: 'assets/images1/mixer.png',name: 'Mixer',),
                Brand(brandName: 'assets/images1/induction.png',name: 'Induction\n Stoves',),
              ],
            ),
            Row(
              children: [
                Brand(brandName: 'assets/images1/gasstove.png',name: 'Gas Stoves',)
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: screenWidth/30,top: screenHeight/60,bottom: screenHeight/60),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text('Home Appliances',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20),),
              ),
            ),
            Row(
              children: [
                Brand(brandName: 'assets/images1/washing.png',name: 'Washing\nMachines',),
                Brand(brandName: 'assets/images1/vacuum.png',name: 'Vacuum\nCleaners',),
                Brand(brandName: 'assets/images1/refrigerator.png',name: 'Refrigerators',),
              ],
            ),
            Row(
              children: [
                Brand(brandName: 'assets/images1/water.png',name: 'Water\nPurifiers',),
                Brand(brandName: 'assets/images1/inverter.png',name: 'Inverters',),
                Brand(brandName: 'assets/images1/ironbox.png',name: 'Try Irons',),
              ],
            ),
            Row(
              children: [
                Brand(brandName: 'assets/images1/airconditioner.png',name: 'Air Conditioners',),
                Brand(brandName: 'assets/images1/fan.png',name: 'Fans',)
              ],
            ),
            Container(
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}

class FashionPage extends StatelessWidget {
  const FashionPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(150.0),
        child: AppBar(
          backgroundColor: Colors.white,
          title: Text('All Categories', style: TextStyle(color: Colors.black),),
          automaticallyImplyLeading: false,
          flexibleSpace: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Row(
                children: [
                  CartItems(imageUrl: 'assets/images/phone8.png',name: 'Mobiles', routeName: '/mobiles',),
                  CartItems(imageUrl: 'assets/images/laptop1.png',name: 'Laptops',  routeName: '/laptops',),
                  CartItems(imageUrl: 'assets/images/accessories.png',name: 'Accessories',  routeName: '/accessories',),
                  CartItems (imageUrl: 'assets/images/fashion.png',name: 'Fashion',  routeName: '/fashion',),
                  CartItems (imageUrl: 'assets/images/tvs.png',name: 'Appliances',  routeName: '/appliances',),
                  CartItems (imageUrl: 'assets/images1/toys2.png',name: 'Toys & Baby', routeName: '/toys',),
                  CartItems (imageUrl: 'assets/images/furniture1.png',name: 'Furniture',  routeName: '/furniture',),
                ],
              ),
            ),
          ),
        ),
      ),
     // bottomSheet: BottomSheetContainer(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              height: screenHeight/9,
              width: screenWidth/1.0,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        Colors.white,
                        color.blue1
                      ],
                      stops: [0.0,0.8],
                      begin: FractionalOffset.topLeft,
                      end: FractionalOffset.topRight,
                      tileMode: TileMode.repeated
                  )
              ),
              child: Center(child: Text('Fashion >',
                style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 30),)),
            ),
            Padding(
              padding: EdgeInsets.only(left: screenWidth/30,top: screenHeight/60,bottom: screenHeight/60),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Text("Men's Clothing",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20),)),
            ),
            Row(
              children: [
                Brand(brandName: 'assets/images1/laptops1.png',name: 'Gaming \nLaptops',),
                Brand(brandName: 'assets/images1/laptops2.png',name: 'Thin & Light\nLaptops',),
                Brand(brandName: 'assets/images1/laptops3.png',name: 'Latest\nLaunched',),
              ],
            ),
            Row(
              children: [
                Brand(brandName: 'assets/images1/pc.png',name: 'All in One PC',),
                Brand(brandName: 'assets/images1/laptop5.png',name: 'ChromeBook',),
                Brand(brandName: 'assets/images1/laptops2in1.png',name: '2-in-1 Laptops',)
              ],
            ),
            Padding(
                padding: EdgeInsets.only(left: screenWidth/30,top: screenHeight/60,bottom: screenHeight/60),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text("Women's Clothing",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20),),
                )),
            Row(
              children: [
                Brand(brandName: 'assets/images1/tablet-min.png',name: 'Tablet with \n Calling',),
                Brand(brandName: 'assets/images1/tablet3-min.png',name: 'Wi-fi Only',),
                Brand(brandName: 'assets/images1/tablet1-min.png',name: 'Premium \n Tablets',),
              ],
            ),
            Padding(
                padding:  EdgeInsets.only(left: screenWidth/30,top: screenHeight/60,bottom: screenHeight/60),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text("Casual and Sports Footwear",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20),),
                )),
            Row(
              children: [
                Brand(brandName: 'assets/images1/tablet-min.png',name: 'Tablet with \n Calling',),
                Brand(brandName: 'assets/images1/tablet3-min.png',name: 'Wi-fi Only',),
                Brand(brandName: 'assets/images1/tablet1-min.png',name: 'Premium \n Tablets',),
              ],
            ),
            Padding(
                padding:  EdgeInsets.only(left: screenWidth/30,top: screenHeight/60,bottom: screenHeight/60),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text("Travel Fashions",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20),),
                )),
            Row(
              children: [
                Brand(brandName: 'assets/images1/tablet-min.png',name: 'Tablet with \n Calling',),
                Brand(brandName: 'assets/images1/tablet3-min.png',name: 'Wi-fi Only',),
                Brand(brandName: 'assets/images1/tablet1-min.png',name: 'Premium \n Tablets',),
              ],
            ),
            Padding(
                padding: EdgeInsets.only(left: screenWidth/30,top: screenHeight/60,bottom: screenHeight/60),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text("Kids Fashion",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20),),
                )),
            Row(
              children: [
                Brand(brandName: 'assets/images1/tablet-min.png',name: 'Tablet with \n Calling',),
                Brand(brandName: 'assets/images1/tablet3-min.png',name: 'Wi-fi Only',),
                Brand(brandName: 'assets/images1/tablet1-min.png',name: 'Premium \n Tablets',),
              ],
            ),
            Container(
              height: 50,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}

class ToysPage extends StatelessWidget {
  const ToysPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(150.0),
        child: AppBar(
          backgroundColor: Colors.white,
          title: Text('All Categories', style: TextStyle(color: Colors.black),),
          automaticallyImplyLeading: false,
          flexibleSpace: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Row(
                children: [
                  CartItems(imageUrl: 'assets/images/phone8.png',name: 'Mobiles', routeName: '/mobiles',),
                  CartItems(imageUrl: 'assets/images/laptop1.png',name: 'Laptops',  routeName: '/laptops',),
                  CartItems(imageUrl: 'assets/images/accessories.png',name: 'Accessories',  routeName: '/accessories',),
                  CartItems (imageUrl: 'assets/images/fashion.png',name: 'Fashion',  routeName: '/fashion',),
                  CartItems (imageUrl: 'assets/images/tvs.png',name: 'Appliances',  routeName: '/appliances',),
                  CartItems (imageUrl: 'assets/images1/toys2.png',name: 'Toys & Baby', routeName: '/toys',),
                  CartItems (imageUrl: 'assets/images/furniture1.png',name: 'Furniture',  routeName: '/furniture',),
                ],
              ),
            ),
          ),
        ),
      ),
      //bottomSheet: BottomSheetContainer(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              height: screenHeight/9,
              width: screenWidth/1.0,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        Colors.white,
                        color.blue1
                      ],
                      stops: [0.0,0.8],
                      begin: FractionalOffset.topLeft,
                      end: FractionalOffset.topRight,
                      tileMode: TileMode.repeated
                  )
              ),
              child: Center(child: Text('Toys & Baby >',
                style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 30),)),
            ),
            Padding(
              padding: EdgeInsets.only(left: screenWidth/30,top: screenHeight/60,bottom: screenHeight/60),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Text('Toys',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20),)),
            ),
            Row(
              children: [
                Brand(brandName: 'assets/images1/laptops1.png',name: 'Gaming \nLaptops',),
                Brand(brandName: 'assets/images1/laptops2.png',name: 'Thin & Light\nLaptops',),
                Brand(brandName: 'assets/images1/laptops3.png',name: 'Latest\nLaunched',),
              ],
            ),
            Row(
              children: [
                Brand(brandName: 'assets/images1/pc.png',name: 'All in One PC',),
                Brand(brandName: 'assets/images1/laptop5.png',name: 'ChromeBook',),
                Brand(brandName: 'assets/images1/laptops2in1.png',name: '2-in-1 Laptops',)
              ],
            ),
            Padding(
                padding: EdgeInsets.only(left: screenWidth/30,top: screenHeight/60,bottom: screenHeight/60),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text('Baby Care',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20),),
                )),
            Row(
              children: [
                Brand(brandName: 'assets/images1/tablet-min.png',name: 'Tablet with \n Calling',),
                Brand(brandName: 'assets/images1/tablet3-min.png',name: 'Wi-fi Only',),
                Brand(brandName: 'assets/images1/tablet1-min.png',name: 'Premium \n Tablets',),
              ],
            ),
            Container(
              height: 50,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}

class FurniturePage extends StatelessWidget {
  const FurniturePage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(150.0),
        child: AppBar(
          backgroundColor: Colors.white,
          title: Text('All Categories', style: TextStyle(color: Colors.black),),
          automaticallyImplyLeading: false,
          flexibleSpace: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Row(
                children: [
                  CartItems(imageUrl: 'assets/images/phone8.png',name: 'Mobiles', routeName: '/mobiles',),
                  CartItems(imageUrl: 'assets/images/laptop1.png',name: 'Laptops',  routeName: '/laptops',),
                  CartItems(imageUrl: 'assets/images/accessories.png',name: 'Accessories',  routeName: '/accessories',),
                  CartItems (imageUrl: 'assets/images/fashion.png',name: 'Fashion',  routeName: '/fashion',),
                  CartItems (imageUrl: 'assets/images/tvs.png',name: 'Appliances',  routeName: '/appliances',),
                  CartItems (imageUrl: 'assets/images1/toys2.png',name: 'Toys & Baby', routeName: '/toys',),
                  CartItems (imageUrl: 'assets/images/furniture1.png',name: 'Furniture',  routeName: '/furniture',),
                ],
              ),
            ),
          ),
        ),
      ),
    //  bottomSheet: BottomSheetContainer(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              height: screenHeight/9,
              width: screenWidth/1.0,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        Colors.white,
                        color.blue1
                      ],
                      stops: [0.0,0.8],
                      begin: FractionalOffset.topLeft,
                      end: FractionalOffset.topRight,
                      tileMode: TileMode.repeated
                  )
              ),
              child: Center(child: Text('Furniture >',
                style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 30),)),
            ),
            Padding(
              padding: EdgeInsets.only(left: screenWidth/30,top: screenHeight/60,bottom: screenHeight/60),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Text('Home Furniture',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20),)),
            ),
            Row(
              children: [
                Brand(brandName: 'assets/images1/laptops1.png',name: 'Gaming \nLaptops',),
                Brand(brandName: 'assets/images1/laptops2.png',name: 'Thin & Light\nLaptops',),
                Brand(brandName: 'assets/images1/laptops3.png',name: 'Latest\nLaunched',),
              ],
            ),
            Row(
              children: [
                Brand(brandName: 'assets/images1/pc.png',name: 'All in One PC',),
                Brand(brandName: 'assets/images1/laptop5.png',name: 'ChromeBook',),
                Brand(brandName: 'assets/images1/laptops2in1.png',name: '2-in-1 Laptops',)
              ],
            ),
            Padding(
                padding:  EdgeInsets.only(left: screenWidth/30,top: screenHeight/60,bottom: screenHeight/60),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text('Office Furniture',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20),),
                )),
            Row(
              children: [
                Brand(brandName: 'assets/images1/tablet-min.png',name: 'Tablet with \n Calling',),
                Brand(brandName: 'assets/images1/tablet3-min.png',name: 'Wi-fi Only',),
                Brand(brandName: 'assets/images1/tablet1-min.png',name: 'Premium \n Tablets',),
              ],
            ),
            Container(
              height: 50,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}


