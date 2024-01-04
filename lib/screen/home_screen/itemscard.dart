import 'package:flutter/material.dart';
import '../../color.dart';
class ItemsCard extends StatelessWidget {
  final String? imageUrl;
  final String? name;
  final String? offer;
  const ItemsCard({super.key, this.imageUrl, this.offer, this.name, });

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Column(
        children: [
          Padding(
            padding:  EdgeInsets.all(screenWidth/50,),
            child: Card(
              elevation: 1,
              child: Container(
                height: screenHeight/5.5,
                width: screenWidth/3,
                decoration: BoxDecoration(
                  color: Colors.white,//fromARGB(255, 76, 175, 167),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                  child: GestureDetector(
                    child: Column(
                      children: [
                         Padding(
                           padding: EdgeInsets.all(screenWidth/30),
                           child: Container(
                              height: screenHeight/10,
                              width: screenWidth/4,
                                decoration: BoxDecoration(
                                    color: color.blue1,
                                  borderRadius: BorderRadius.circular(5.0)
                                ),
                                        child: Image.asset(imageUrl??'assets/images1/laptops2.png',),
                            ),
                         ),
                        Text(name??'Laptops',),
                        Padding(
                          padding:  EdgeInsets.only(top: screenHeight/250),
                          child: Text(offer??'Up to 20% Off',style: TextStyle(color: Colors.greenAccent,fontWeight: FontWeight.w500),),
                        )
                        // Container(
                        //   height: screenHeight/20,
                        //   width: 100,
                        //   child: Center(child: Text(name??'Laptops')),
                        // ),
                        // Padding(
                        //   padding: const EdgeInsets.all(4.0),
                        //   child: Container(
                        //     height: 20,
                        //     width: 100,
                        //     child: Center(child: Text(offer??'Up to 20% Off',
                        //       style: TextStyle(color: Colors.greenAccent,fontWeight: FontWeight.w500),)),
                        //   ),
                        // )
                      ],
                    ),
                    onTap: (){
                      if(imageUrl== 'assets/images1/laptops2.png' ) {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ComputerPage()));
                      }else if(imageUrl== 'assets/images/watch3.png'){
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => WatchPage()));
                      }else if(imageUrl== 'assets/images/mobile5.png'){
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => PhonePage()));
                      }
                    },
                  ),
                ),
            ),
            ),
        ],
    );
  }
}

class ComputerPage extends StatelessWidget {
  const ComputerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: BackButton(color: Colors.black,),
      ),
    );
  }
}
class WatchPage extends StatelessWidget {
  const WatchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       title: Text('Watch',style: TextStyle(color: Colors.white),),
      ),
    );
  }
}
class PhonePage extends StatelessWidget {
  const PhonePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
