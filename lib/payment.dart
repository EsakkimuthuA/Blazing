import 'package:flutter/material.dart';

class PaymentScreen extends StatefulWidget {


  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  int _type = 1;//This integer variable _type is used to track the selected payment method. It is initialized with a value of 1.
  void _handleRadio(Object? e)=> setState(() {
    _type = e as int;
  });// This is a function _handleRadio used as an event handler for radio buttons. It takes an Object? argument e, which is expected to be cast to an integer (e as int) and assigned to _type. Calling setState inside this function indicates that the widget's state should be updated when the radio button is clicked, causing a rebuild of the widget.
  @override
  void initState() {
    // TODO: implement initState
    super.initState();//initState(): This is an override of the initState method. It doesn't contain any custom logic beyond calling super.initState(). The initState method is typically used for initializing state variables when the widget is first created.
  }
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Method'),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        leading: BackButton(color: Colors.black,),
        elevation: 0,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(right: 20,left: 20),
          child: Center(
            child: Column(
              children: [
                SizedBox(height:screenHeight/20,),
                Container(
                  width: screenWidth/1.1,
                  height: screenHeight/17,
                  // margin: EdgeInsets.only(right: 15),
                  decoration: BoxDecoration(
                      border: _type == 1 ? Border.all(width: 1,color: Colors.redAccent)
                          : Border.all(width: 0.3,color: Colors.grey),
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.transparent
                  ),
                  child: Center(
                    child: Padding(
                      padding:  EdgeInsets.only(right: screenWidth/20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Radio(
                                value: 1,
                                groupValue: _type,
                                onChanged: _handleRadio,
                                activeColor: Colors.redAccent,),
                              Text('Google Pay',
                                  style: _type == 1
                                      ?TextStyle(fontSize: 15,color: Colors.black)
                                      :TextStyle(fontSize: 15,color: Colors.grey)
                              )
                            ],
                          ),
                          Image.asset('assets/images/Gpay.png',width: screenWidth/6,height: screenHeight/18,)
                        ],
                      ),
                    ),
                  ),
                ), SizedBox(height:screenHeight/40,),
                Container(
                  width: screenWidth/1.1,
                  height: screenHeight/17,
                  // margin: EdgeInsets.only(right: 15),
                  decoration: BoxDecoration(
                      border: _type == 2 ? Border.all(width: 1,color: Colors.redAccent)
                          : Border.all(width: 0.3,color: Colors.grey),
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.transparent
                  ),
                  child: Center(
                    child: Padding(
                      padding:  EdgeInsets.only(right: screenWidth/20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Radio(
                                value: 2,
                                groupValue: _type,
                                onChanged: _handleRadio,
                                activeColor: Colors.redAccent,),
                              Text('PhonePe Pay',
                                  style: _type == 2
                                      ?TextStyle(fontSize: 15,color: Colors.black)
                                      :TextStyle(fontSize: 15,color: Colors.grey)
                              )
                            ],
                          ),
                          Image.asset('assets/images/phonepe.png',width: screenWidth/6,height: screenHeight/20,)
                        ],
                      ),
                    ),
                  ),
                ), SizedBox(height:screenHeight/40,),
                Container(
                  width: screenWidth/1.1,
                  height: screenHeight/17,
                  // margin: EdgeInsets.only(right: 15),
                  decoration: BoxDecoration(
                      border: _type == 3 ? Border.all(width: 1,color: Colors.redAccent)
                          : Border.all(width: 0.3,color: Colors.grey),
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.transparent
                  ),
                  child: Center(
                    child: Padding(
                      padding:  EdgeInsets.only(right: screenWidth/20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Radio(
                                value: 3,
                                groupValue: _type,
                                onChanged: _handleRadio,
                                activeColor: Colors.redAccent,),
                              Text('Paytm',
                                  style: _type == 3
                                      ?TextStyle(fontSize: 15,color: Colors.black)
                                      :TextStyle(fontSize: 15,color: Colors.grey)
                              )
                            ],
                          ),
                          Image.asset('assets/images/paytm.png',width: screenWidth/6,height: screenHeight/18,)
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height:screenHeight/40,),
                Container(
                  width: screenWidth/1.1,
                  height: screenHeight/17,
                  // margin: EdgeInsets.only(right: 15),
                  decoration: BoxDecoration(
                      border: _type == 4 ? Border.all(width: 1,color: Colors.redAccent)
                          : Border.all(width: 0.3,color: Colors.grey),
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.transparent
                  ),
                  child: Center(
                    child: Padding(
                      padding:  EdgeInsets.only(right: screenWidth/20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Radio(
                                value: 4,
                                groupValue: _type,
                                onChanged: _handleRadio,
                                activeColor: Colors.redAccent,),
                              Text('Credit/ Debit/ ATM Card',
                                  style: _type == 4
                                      ?TextStyle(fontSize: 15,color: Colors.black)
                                      :TextStyle(fontSize: 15,color: Colors.grey)
                              )
                            ],
                          ),
                          Image.asset('assets/images/creditcard.png',width: screenWidth/6,height: screenHeight/18,)
                        ],
                      ),
                    ),
                  ),
                ),SizedBox(height:screenHeight/40,),
                Container(
                  width: screenWidth/1.1,
                  height: screenHeight/17,
                  // margin: EdgeInsets.only(right: 15),
                  decoration: BoxDecoration(
                      border: _type == 5 ? Border.all(width: 1,color: Colors.redAccent)
                          : Border.all(width: 0.3,color: Colors.grey),
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.transparent
                  ),
                  child: Center(
                    child: Padding(
                      padding:  EdgeInsets.only(right: screenWidth/20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Radio(
                                value: 5,
                                groupValue: _type,
                                onChanged: _handleRadio,
                                activeColor: Colors.redAccent,),
                              Text('Cash on Delivery',
                                  style: _type == 5
                                      ?TextStyle(fontSize: 15,color: Colors.black)
                                      :TextStyle(fontSize: 15,color: Colors.grey)
                              )
                            ],
                          ),
                          // Image.asset('assets/images/creditcard.png',width: screenWidth/6,height: screenHeight/18,)
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight/10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Sub Total',
                      style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500, color: Colors.grey),
                    ),
                    Text('\$12999.00',
                      style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500, color: Colors.grey),)
                  ],
                ),  SizedBox(height: screenHeight/80,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Delivery fees',
                      style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500, color: Colors.grey),
                    ),
                    Text('\$30.00',
                      style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500, color: Colors.grey),)
                  ],
                ),
                Divider(height: screenHeight/40,color: Colors.grey,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Total fees',
                      style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500, color: Colors.grey),
                    ),
                    Text('\$13029.00',
                      style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500, color: Colors.redAccent),)
                  ],
                ),
                Divider(height: screenHeight/40,color: Colors.grey,),
                SizedBox(height: screenHeight/20,),
                SizedBox(
                  height: screenHeight/20,
                  width: screenWidth/1.5,
                  child: ElevatedButton(onPressed: (){},
                      style: ElevatedButton.styleFrom(
                          primary: Colors.greenAccent,

                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)
                          ),
                      ),
                      child: Text('Confirm Payment',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 17),)
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
