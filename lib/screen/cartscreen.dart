import 'package:flutter/material.dart';
import 'package:ovantica/payment.dart';
import 'package:ovantica/phoneitem.dart';
import 'package:ovantica/productlistscreen.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart'as badges;
import '../color.dart';
import '../bottomsheet.dart';
import '../cartmodel.dart';
import '../cartprovider.dart';


class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen>{

  DBHelper? dbHelper = DBHelper();
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    final cart = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('My Product ',style: TextStyle(color: Colors.black),),
        leading: BackButton(color: Colors.black,),
        //centerTitle: true,
      ),
      body: Column(
        children: [
          FutureBuilder(  //This widget is used to asynchronously fetch cart data from the database.
              future: cart.getData(), // It waits for the cart.getData() method to complete and then builds the appropriate UI based on whether there are items in the cart or if it's empty.
              builder: (context, AsyncSnapshot<List<Cart>> snapshot){
                if(snapshot.hasData){
                  if(snapshot.data!.isEmpty){  //If the cart is empty, it displays a message and an empty cart image.
                    return Column(
                      children: [
                        SizedBox(height: screenHeight/5,),
                        Align(alignment: Alignment.center,
                          child: Container(
                            height: screenHeight/8,
                              width: screenWidth/5,
                              child: Image.asset('assets/images1/emptybox.png',)),
                        ),
                        Text('Cart is empty'),
                      ],
                    );
                  }else{//If there are items in the cart, it displays a list of product cards with details such as name, price, quantity, and buttons to remove items or adjust quantities.
                    return Expanded(
                        child: ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index){
                              return Card(
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: Container(
                                        height:screenHeight/3.0,
                                        width: screenWidth/1.1,
                                        color: Colors.white,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                              //  crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    alignment: Alignment.topLeft,
                                                    height: screenHeight/5.0,
                                                    width: screenWidth/3.0,
                                                    color: Colors.white,
                                                    child: Image.asset(snapshot.data![index].image.toString(),
                                                      height: screenHeight/5.2,width: screenWidth/3.2,fit: BoxFit.cover,),
                                                  ),
                                                  Column(crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Align(
                                                          alignment: Alignment.topLeft,
                                                          child: Container(
                                                              height: 20,
                                                              width: screenWidth/2.0,
                                                              child: Text(snapshot.data![index].productName.toString())),
                                                        ),
                                                        Container(
                                                            alignment: Alignment.topLeft,
                                                            height: 20,
                                                            width: screenWidth/2.0,
                                                            child: Text(snapshot.data![index].unitTag.toString())),
                                                        Row(
                                                          children: [
                                                            Text('off 3%  ',style: TextStyle(color: Colors.green),),
                                                            Container(
                                                              alignment: Alignment.topLeft,
                                                              height: 20,
                                                              width: screenWidth/3.0,
                                                              child: Text('₹'+snapshot.data![index].productPrice.toString()),
                                                            ),
                                                          ],
                                                        ),
                                                      ]),
                                                ]),
                                                Container(
                                                  height: screenHeight/25,
                                                  width: screenWidth/3.5,
                                                  // color: color.green,
                                                  decoration: BoxDecoration(
                                                    color:color.green ,
                                                    border: Border.all(color: Colors.grey,width: 1),
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      InkWell(
                                                          onTap: (){
                                                            int quantity = snapshot.data![index].quantity!;
                                                            int price = snapshot.data![index].initialPrice!;
                                                            quantity--;
                                                            int? newPrice = price * quantity;
                                                            if(quantity > 0){
                                                              dbHelper!.updateQuantity(
                                                                  Cart(
                                                                    id: snapshot.data![index].id,
                                                                    productId:snapshot.data![index].id!.toString(),
                                                                    productName: snapshot.data![index].productName!,
                                                                    initialPrice: snapshot.data![index].initialPrice!,
                                                                    productPrice:newPrice,
                                                                    quantity: quantity,
                                                                    unitTag: snapshot.data![index].unitTag!.toString(),
                                                                    image: snapshot.data![index].image!.toString(),
                                                                  )
                                                              ).then((value){
                                                                newPrice = 0;
                                                                quantity = 0;
                                                                cart.removerTotalPrice(double.parse(
                                                                    snapshot.data![index].initialPrice!.toString()));
                                                              }).onError((error, stackTrace){
                                                                print(error.toString());
                                                              });
                                                            }

                                                          },
                                                          child: Icon(Icons.remove,color: Colors.grey,)),
                                                      Text(snapshot.data![index].quantity.toString()),
                                                      InkWell(
                                                          onTap: (){
                                                            int quantity = snapshot.data![index].quantity!;
                                                            int price = snapshot.data![index].initialPrice!;
                                                            quantity++;
                                                            int? newPrice = price * quantity;
                                                            dbHelper!.updateQuantity(
                                                                Cart(
                                                                  id: snapshot.data![index].id,
                                                                  productId:snapshot.data![index].id!.toString(),
                                                                  productName: snapshot.data![index].productName!,
                                                                  initialPrice: snapshot.data![index].initialPrice!,
                                                                  productPrice:newPrice,
                                                                  quantity: quantity,
                                                                  unitTag: snapshot.data![index].unitTag!.toString(),
                                                                  image: snapshot.data![index].image!.toString(),
                                                                )
                                                            ).then((value){
                                                              newPrice = 0;
                                                              quantity = 0;
                                                              cart.addTotalPrice(double.parse(
                                                                  snapshot.data![index].initialPrice!.toString()));
                                                            }).onError((error, stackTrace){
                                                              print(error.toString());
                                                            });
                                                          },
                                                          child: Icon(Icons.add, color: Colors.grey,))
                                                    ],
                                                  ),
                                                ),
                                            SizedBox(height: screenHeight/50,),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                    height: screenHeight/25,
                                                    width: screenWidth/3.3,
                                                     //color: color.green,
                                                    decoration: BoxDecoration(
                                                      border: Border(
                                                          top: BorderSide(width: 0.5,color: Colors.grey),
                                                        bottom: BorderSide(width: 0.5,color:Colors.grey),
                                                        left: BorderSide(width: 0.5,color: Colors.grey)

                                                      )
                                                     ),
                                                     child: OutlinedButton(
                                                    onPressed: (){
                                                      ScaffoldMessenger.of(context).showSnackBar(
                                                          SnackBar(
                                                            content: Container(
                                                              height: screenHeight/15,
                                                              decoration: BoxDecoration(
                                                                  color: Colors.black,
                                                                  borderRadius: BorderRadius.circular(12)
                                                              ),
                                                              child: Center(child: Text('Successfully Removed \n from your cart')),
                                                            ),
                                                            behavior: SnackBarBehavior.floating,
                                                            backgroundColor: Colors.white,
                                                            elevation: 0,
                                                          ));

                                                      dbHelper!.delete(snapshot.data![index].id!);
                                                      cart.removeCounter();
                                                      cart.removerTotalPrice(double.parse(snapshot.data![index].productPrice.toString()));
                                                      },
                                                      child: Row(
                                                      children: [
                                                        Icon(Icons.delete_outline,size: screenWidth/20,color: Colors.grey,),
                                                        Text('Remove',style: TextStyle(color: Colors.grey),),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  height: screenHeight/25,
                                                  width: screenWidth/3.3,
                                                  //color: color.green,
                                                  decoration: BoxDecoration(
                                                    border: Border.all(width: 0.5,color: Colors.grey)
                                                  ),
                                                  child:Row(
                                                    children: [
                                                      Icon(Icons.save_as_outlined,size: screenWidth/22,color: Colors.grey,),
                                                      Text(' Save for later',style: TextStyle(color: Colors.grey),)
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  height: screenHeight/25,
                                                  width: screenWidth/3.3,
                                                  //color: color.green,
                                                  decoration: BoxDecoration(
                                                      border: Border(
                                                          top: BorderSide(width: 0.5,color: Colors.grey),
                                                          bottom: BorderSide(width: 0.5,color:Colors.grey),
                                                          right: BorderSide(width: 0.5,color: Colors.grey)

                                                      )
                                                  ),
                                                  child:InkWell(
                                                    child: Row(
                                                      children: [
                                                        Icon(Icons.attach_money_rounded,size:screenWidth/ 20,color: Colors.grey),
                                                        Text('Buy This Now',style: TextStyle(color: Colors.grey))
                                                      ],
                                                    ),
                                                    onTap: (){
                                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>PaymentScreen()));
                                                    },
                                                  ),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    //  Text(productName[index].toString())
                                  ],
                                ),
                              );
                            }));
                    }
                }
                return Text('');
              }),
          //This widget listens to changes in the cart's state using the Consumer widget. It displays the subtotal, discount, and total price of the items in the cart.
          Consumer<CartProvider>(builder: (context, value, child){
            return Visibility(// The visibility of this section depends on whether there are items in the cart.
              visible: value.getTotalPrice().toStringAsFixed(2) == "0.00" ? false: true,
              child: Column(
                children: [
                  //This is a custom widget that simplifies the creation of rows with a title and a corresponding value, such as "Sub total" and "$50.00". It is used to display the subtotal, discount, and total price.
                  ReusableWidget(title: 'Sub total', value: r'$'+value.getTotalPrice().toStringAsFixed(2),),
                  ReusableWidget(title: 'Discount 5%', value: r'$'+'200',),
                  ReusableWidget(title: 'Total', value: r'$'+value.getTotalPrice().toStringAsFixed(2),)
                ],
              ),
            );
          })
        ],
      ),
    );
  }
}

class ReusableWidget extends StatelessWidget {
  final String title, value;
  const ReusableWidget({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return  Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Container(
              height: 30,
                width: 100,
                //color: color.blue1,
                child: Center(child: Text(title, style: Theme.of(context).textTheme.subtitle1,))),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Container(
              height: 30,
                width: 100,
                //color: color.blue1,
                child: Center(child: Text(value.toString(), style: Theme.of(context).textTheme.subtitle2,))),
          )
        ],
    );
  }
}
