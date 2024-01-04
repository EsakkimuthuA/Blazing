
import 'package:flutter/cupertino.dart';
import 'package:flutter_animated_icons/icons8.dart';
import 'package:flutter_animated_icons/lottiefiles.dart';
import 'package:flutter_animated_icons/useanimations.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:ovantica/payment.dart';
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
import 'color.dart';

class ProductListScreen extends StatefulWidget {
  final String? imageUrl;
  final String? name1;
  final String? name2;
  final String? name3;
  final String? name4;
  final String? name5;
  final String? name6;

  const ProductListScreen({super.key, this.imageUrl, this.name1, this.name2, this.name3, this.name4, this.name5, this.name6,});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen>with TickerProviderStateMixin {
  late AnimationController _favoriteController; //An animation controller for a heart-shaped icon animation

  get productData => null;


  @override
  void initState() {
    super.initState();

    _favoriteController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
  }
//initState() and dispose(): These methods are part of the State lifecycle. initState is used to initialize the _favoriteController, and dispose is used to clean up resources when the widget is disposed.
  @override
  void dispose() {
    _favoriteController.dispose();
    super.dispose();
  }
  List<String> productName = ['Realme 7 (128 GB Storage)',];
  List<String> productUnit = ['8 GM RAM'];
  List<int> productPrice = [12999,];// store information about the products to be displayed on the screen.
  List<String> productImage = [
    'assets/images3/1.png',
  ];
  DBHelper? dbHelper = DBHelper();//An instance of a database helper class (DBHelper) used to interact with the SQLite database. This class is responsible for database operations related to the cart.
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Product List'),
        centerTitle: true,
        actions: [
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> CartScreen()));
            },
            child: Center(
              child:badges.Badge (
                badgeContent: Consumer<CartProvider>(
                  builder:(context, value, child){
                    return Text(value.getCounter().toString(),style: TextStyle(color: Colors.black),);
                  },
                ),
                badgeAnimation: badges.BadgeAnimation.rotation(
                    animationDuration: Duration(milliseconds: 300)
                ),
                child: Icon(CupertinoIcons.cart),
              ),
            ),
          ),
          SizedBox(width: 20,)
        ],
      ),
      //  bottomSheet: BottomSheetContainer(),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                  itemCount: productName.length,
                  itemBuilder: (context, index){
                    return Card(
                      child: Column(
                        children: [
                          Container(
                            height:screenHeight/1.0,
                            width: screenWidth/1.1,
                            color: Colors.white,
                            child: GestureDetector(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10,left: 10,top: 10),
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
                                    height: screenHeight/2.5,
                                    width: screenWidth/1.2,
                                    color: Colors.white,
                                    child: Image.asset(widget.imageUrl??productImage[index].toString(),
                                      height: screenHeight/2.6,width: screenWidth/1.3,fit: BoxFit.cover,),
                                  ),
                                  Align(
                                      alignment: Alignment.topLeft,
                                      child: Padding(
                                        padding:  EdgeInsets.only(top:screenHeight /40),
                                        child: Text(widget.name1??productName[index].toString()),
                                      )),
                                  Align(
                                      alignment: Alignment.topLeft,
                                      child: Padding(
                                        padding: EdgeInsets.only(top:screenHeight /60),
                                        child: Text(widget.name2??productUnit[index].toString()),
                                      )),
                                  Padding(
                                    padding: EdgeInsets.only(top:screenHeight /60),
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
                                  Row(
                                    children: [
                                      Padding(
                                        padding:  EdgeInsets.only(top: screenHeight/60,bottom: screenHeight/60),
                                        child: Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(widget.name3??'Off 3%  ',style: TextStyle(color: Colors.green),),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(widget.name4??"₹"+productPrice[index].toString()),
                                      ),
                                    ],
                                  ),

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        height:screenHeight/ 20,
                                        width: screenWidth/2.5,
                                        // decoration: BoxDecoration(
                                        //   border: Border.all(width: 1,color: Colors.grey),
                                        //   color: Colors.greenAccent
                                        // ),
                                        child: OutlinedButton(
                                          onPressed: (){
                                            ScaffoldMessenger.of(context).showSnackBar(
                                                SnackBar(
                                                  content: Container(
                                                    padding: EdgeInsets.all(16),
                                                    height: screenHeight/15,
                                                    decoration: BoxDecoration(
                                                        color: Colors.black,
                                                        borderRadius: BorderRadius.circular(10)
                                                    ),
                                                    child: Column(
                                                      children: [
                                                        Text('Successfully Add To Cart')
                                                      ],
                                                    ),
                                                  ),
                                                  behavior: SnackBarBehavior.floating,
                                                  backgroundColor: Colors.white,
                                                  elevation: 0,
                                                )
                                            );
                                            print(index);
                                            print(index);
                                            print(productName[index].toString());
                                            print(productPrice[index].toString());
                                            print(productPrice[index]);
                                            print('1');
                                            print(productUnit[index].toString());
                                            print(productImage[index].toString());
                                            dbHelper!.insert(
                                                Cart(
                                                  id: index,
                                                  productId: index.toString(),
                                                  productName: productName[index].toString(),
                                                  initialPrice: productPrice[index],
                                                  productPrice: productPrice[index],
                                                  quantity: 1,
                                                  unitTag: productUnit[index].toString(),
                                                  image: productImage[index].toString(),)
                                            ).then((value) {
                                              cart.addTotalPrice(double.parse(productPrice[index].toString()));
                                              cart.addCounter();
                                            }).onError((error, stackTrace) {
                                              print("error"+error.toString());
                                            });
                                          },
                                          child: Center(child: Text(widget.name5??'Add to cart',style: TextStyle(fontSize: 15,color: Colors.black),)),
                                          style: OutlinedButton.styleFrom(
                                            backgroundColor: color.green,
                                            side: BorderSide(color: color.green),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: screenHeight/20,
                                        width: screenWidth/2.5,
                                        // decoration: BoxDecoration(
                                        //  border: Border.all(width: 1,color: Colors.grey),
                                        // ),
                                        child: OutlinedButton(
                                          onPressed: (){
                                            Navigator.push(context, MaterialPageRoute(builder: (context)=>PaymentScreen()));
                                            // showModalBottomSheet(context: context, builder: (context){
                                            //   return CustomBottomSheet();
                                            // });
                                          },
                                          child: Center(child: Text(widget.name6??'Buy Now',style: TextStyle(fontSize: 15,color: Colors.black),)),
                                          style: OutlinedButton.styleFrom(
                                            backgroundColor: color.yellow1,
                                            side: BorderSide(color: color.yellow1),

                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          //  Text(productName[index].toString())

                        ],
                      ),
                    );
                  })
          )
        ],
      ),
    );
  }
}



class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}


class DBHelper{ //This class manages interactions with an SQLite database. It is responsible for tasks such as initializing the database, inserting, updating, and querying data related to the cart.
  static Database? _db ;

  Future<Database?> get db async{
    if(_db != null){
      return _db!;
    }
    _db = await initDatabase();

  }
  initDatabase()async{//Initializes the SQLite database by opening or creating it.
    io.Directory documentDirectory = await getApplicationCacheDirectory();
    String path = join(documentDirectory.path, 'cart.db');
    var db = await openDatabase(path, version: 1,onCreate: _onCreate,);
    return db ;
  }
  _onCreate(Database db , int version)async{  // Creates the cart table in the database when it's first initialized.
    await db
        .execute('CREATE TABLE cart(id INTEGER PRIMARY KEY AUTOINCREMENT,productId VARCHAR UNIQUE, productName TEXT,initialPrice INTEGER,productPrice INTEGER,quantity INTEGER,unitTag TEXT,image TEXT)');
  }
  Future<Cart>insert(Cart cart) async{  //Inserts a Cart object (representing a product in the cart) into the cart table.
    var dbClient = await db;
    await dbClient!.insert('cart', cart.toMap());
    return cart;
  }
  Future<List<Cart>>getCartList() async { //Retrieves a list of Cart objects from the cart table.
    var dbClient = await db;
    final List<Map<String,Object?>> queryResult = await dbClient!.query('cart');
    return queryResult.map((e) => Cart.fromMap(e)).toList();
  }
  Future<int> delete (int id) async { //Deletes a specific item from the cart table based on its ID.
    var dbClient = await db;
    return await dbClient!.delete('cart',where: 'id=?',whereArgs: [id]);
  }
  Future<int> updateQuantity (Cart cart) async {  // Updates the quantity of a specific item in the cart table.
    var dbClient = await db;
    return await dbClient!.update('cart',cart.toMap(),where: 'id = ?',whereArgs: [cart.id] );
  }
}
