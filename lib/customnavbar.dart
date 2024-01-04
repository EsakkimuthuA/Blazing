import 'package:flutter/material.dart';


class CustomNavBar extends StatelessWidget {
  const CustomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      // backgroundColor: Colors.white,
      iconSize: 20,
      selectedFontSize: 10,
      unselectedFontSize: 10,
      selectedItemColor: Colors.orange,
      unselectedItemColor: Colors.black,
      //showUnselectedLabels: false,
      // currentIndex: currentIndex,
      //  onTap: (index)=>setState(()=>currentIndex= index),
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(icon: IconButton(
            onPressed: (){
              Navigator.pushNamed(context, '/');
            },
            icon:  Icon(Icons.home_outlined)),label: 'Home',),
        BottomNavigationBarItem(icon: IconButton(
            onPressed: (){
              Navigator.pushNamed(context, '/Categories');
            },
            icon: Icon(Icons.grid_view)),label: 'Categories'),
        // BottomNavigationBarItem(icon: Icon(Icons.notifications_none),label: 'Notification'),
        /*  BottomNavigationBarItem(icon: Icon(Icons.account_circle_outlined),label: 'Account'),
            BottomNavigationBarItem(icon:Center(
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
            ), label: 'Cart'),*/
      ],
    );
  }
}
