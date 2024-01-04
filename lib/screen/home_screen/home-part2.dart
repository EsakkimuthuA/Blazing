import 'package:flutter/material.dart';
import 'package:ovantica/screen/home_screen/itemscard.dart';
import 'package:ovantica/screen/categories_screen.dart';

class Discounts extends StatelessWidget {
  final String? imageUrl;
  final String? name;
  final String? offers;
  const Discounts({super.key, this.imageUrl, this.name, this.offers});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Column(
      children: [
             GestureDetector(
              child: Container(
              height: h/4.0,
              width: w/2.2,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0)
              ),
               child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: h/5.6,
                      width: w/2.6,
                      child: Image.asset(imageUrl??'assets/images/watch.jpg'),
                    ),
                  ),
                  Text(name??'Smart Watches'),
                  Text(offers??'Min.40%',style: TextStyle(color: Colors.green),)
                ],
              ),
            ),
            onTap: (){
              if(imageUrl == 'assets/images/watch.jpg'){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>WatchPage()));
              }else if(imageUrl == 'assets/images1/toys1.png'){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ToysPage()));
              }else if(imageUrl == 'assets/images1/t-shirts1.jpg'){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>FashionPage()));
              }else if(imageUrl == 'assets/images1/headset1.png'){
               // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Accessories()));
              }
            },
          ),

      ],
    );
  }
}
