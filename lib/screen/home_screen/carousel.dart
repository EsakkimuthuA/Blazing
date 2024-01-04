import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../color.dart';

class Carousel extends StatefulWidget {
  const Carousel({super.key});

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(right: 4.0,left: 4.0),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children:[
          CarouselSlider(
            items: [
            GestureDetector(
            child: Container(
              // height: screenHeight/4,
              // width:screenWidth/1,
              decoration: BoxDecoration(
                color: color.green,
              ),
              child: Stack(
                  children: [
                       Align(
                         alignment: Alignment.topRight,
                         child: SizedBox(
                          height: screenHeight/4,
                          width: screenWidth/2.5,
                            child:  Image.asset('assets/images1/fashion6.png'),
                      ),
                       ),
                    Padding(padding: EdgeInsets.only(left: screenWidth/20,top: screenHeight/20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('FASHIONS TOP RATED',
                            style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 20),),
                          Padding(
                            padding: EdgeInsets.only(top: screenHeight/100,bottom: screenHeight/100),
                            child: Container(
                              height: screenHeight/50,
                              width: screenWidth/5,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                  color: Colors.white
                              ),
                              child: Center(child: Text('30-75% OFF',
                                style: TextStyle(fontWeight: FontWeight.w500,fontSize: 10),)),
                            ),
                          ),
                          Padding(
                            padding:  EdgeInsets.only(bottom: screenHeight/100),
                            child: Text('12,00,000 STYLES+ | 5000+ BRANDS',
                              style: TextStyle(fontSize: 10,fontWeight: FontWeight.w500),),
                          ),
                          SizedBox(height: screenHeight/40,),
                          Container(
                            height: screenHeight/50,
                            width: screenWidth/5,
                            color: Colors.black,
                              child: Center(child: Text('WISHLIST NOW',
                                style: TextStyle(fontWeight: FontWeight.w500,fontSize: 8, color: Colors.white),)),
                            ),
                        ],
                      ),),
                  ]),
            ),
            onTap:(){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>OfferPage()));
            },
          ),
          GestureDetector(
            child: Container(
              color: color.green,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          height: screenHeight/4,
                          width: screenWidth/2.5,
                          margin: EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              image: DecorationImage(
                                image: AssetImage('assets/images1/tv1.png'),
                              )
                          )
                      ),
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(left: screenWidth/20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: screenHeight/20,),
                        Text('4k Smart TVs',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 10),),
                        SizedBox(height: screenHeight/80,),
                        Text('From ₹19,999*',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20)),
                        SizedBox(height: screenHeight/80,),
                        Text('LG, Samsung, Sony & more',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 10)),
                        SizedBox(height: screenHeight/80,),
                        Text('No Cost EMI | Exchange Offers',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 10))
                      ],
                    ),
                  ),
                ],
              ),
            ),
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (cotext)=>TVsPage()));
            },
          ),
          GestureDetector(
            child: Container(
              color: color.green,
              child: Stack(
                children:[
                 Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    height: screenHeight/4,
                    width: screenWidth/2.5,
                    margin: EdgeInsets.all(6.0),
                    child: Image.asset('assets/images1/iphone.png'),
                  ),
                ),
                  Padding(
                    padding:  EdgeInsets.only(left: screenWidth/20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: screenHeight/20,),
                        Text('IPHONE 14 PRO',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 10),),
                        SizedBox(height: screenHeight/80,),
                        Text('From ₹49,999*',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20)),
                        SizedBox(height: screenHeight/80,),
                        Text('12MP camera',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 10)),
                        SizedBox(height: screenHeight/80,),
                        Text('No Cost EMI | Exchange Offers',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 10))
                      ],
                    ),
                  ),
             ]
              ),
            ),
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>IphonePage()));
            },
          ),

          GestureDetector(
            child: Container(
              color: color.green,
              child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                          height: screenHeight/4,
                          width: screenWidth/2.5,
                          margin: EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              image: DecorationImage(
                                image: AssetImage('assets/images1/laptop6.png',),
                                //fit: BoxFit.cover,
                              ),
                          )
                      ),),
                    Padding(
                      padding:  EdgeInsets.only(left: screenWidth/20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: screenHeight/20,),
                          Text('HP 15s Intel Core i5 12th Gen',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 10),),
                          SizedBox(height: screenHeight/80,),
                          Text('From ₹42,999*',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20)),
                          SizedBox(height: screenHeight/80,),
                          Text('8GB RAM',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 10)),
                          SizedBox(height: screenHeight/20,),
                          Text('No Cost EMI | Exchange Offers',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 10))
                        ],
                      ),
                    ),
                  ]
              ),
            ),
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LaptopPage()));
            },
          ),
        ],
          options:  CarouselOptions( // Set the desired options for the carousel
            onPageChanged: (index, reason){
              setState((){
                activeIndex=index;
              });
            },
            initialPage: 0,
           // height: 300, // Set the height of the carousel
            enlargeCenterPage: true,
            autoPlay: true, // Enable auto-play
            autoPlayCurve: Curves.easeInOut, // Set the auto-play curve
            enableInfiniteScroll: true,
            autoPlayAnimationDuration: Duration(milliseconds: 300), // Set the auto-play animation duration
            aspectRatio: 16/9, // Set the aspect ratio of each item
            viewportFraction: 1.0, // You can also customize other options such as enlargeCenterPage, enableInfiniteScroll, etc.
          ),
        ),
          Padding(padding: EdgeInsets.all(10.0),
            child: AnimatedSmoothIndicator(
                activeIndex: activeIndex,
                count: 4,
              effect: WormEffect(
                dotHeight: 10,dotWidth: 10,
                activeDotColor: Colors.blue,
                dotColor: Colors.grey
              ),

            ),
          )
    ]
      ),
    );
  }
}


class OfferPage extends StatelessWidget {
  const OfferPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
class TVsPage extends StatelessWidget {
  const TVsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class IphonePage extends StatelessWidget {
  const IphonePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
class LaptopPage extends StatelessWidget {
  const LaptopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
