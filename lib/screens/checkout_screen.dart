
import 'package:flutter/material.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            IconButton(
              icon:const Icon(Icons.arrow_back_ios,color: Colors.black,),
              onPressed: () { Navigator.pop(context); },),
            const Spacer(),
            const Text('Checkout',style: TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontFamily: 'Montserrat',
            )),
            const Spacer(),
          ],
        ),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            const Row(
              children: [
              Icon(Icons.location_on_outlined,color: Colors.black87,),
              SizedBox(width: 10),
              Text('Delivery Address',style: TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontFamily: 'Montserrat',
              )),
              ],
            ),
            const SizedBox(height: 10,),
            Row(
              children: [
                Container(
                  height: 130,
                  width: 300,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(13),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const Text('Address :',style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontFamily: 'Montserrat',
                            )),
                            const Spacer(),
                            IconButton(onPressed: () {},
                                icon: const Icon(Icons.edit_note,color: Colors.black87,)),
                          ],
                        ),
                        const Text("216 St Paul's Rd, London N1 2LL, UK  Contact :  +44-784232",
                            style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontFamily: 'Montserrat',
                        )),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 10,),
                Container(
                  height: 130,
                  width: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                  ),
                  child: IconButton(onPressed: () {

                  }, icon: const Icon(Icons.add_circle_outline_outlined,
                    color: Colors.black87,)),
                )
              ],
            ),
            const SizedBox(height: 10,),
            const Text('Shopping List',style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.black,
              fontFamily: 'Montserrat',
            )),
            const SizedBox(height: 10,),
            Column(
              children: [
                shoppinglistContainer(
                    image: const AssetImage('assess/images/image 15.png'),
                    pname: 'Women’s Casual Wear', variation1: 'Black',
                    variation2: 'Red', text: '4.8',
                    price: '\$ 34.00', offer: 'upto 33% off  ',
                    price1: '\$ 64.00'),
                shoppinglistContainer(
                    image: const AssetImage('assess/images/image 15 (2).png'),
                    pname: 'Men’s Jacket', variation1: 'Green',
                    variation2: 'Grey', text: '4.7',
                    price: '\$ 45.00', offer: 'upto 28% off  ',
                    price1: '\$ 67.00'),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget shoppinglistContainer({
    required ImageProvider image,
    required String pname,
    required String variation1,
    required String variation2,
    required String text,
    required String price,
    required String offer,
    required String price1,

}) => Container(
    margin: const EdgeInsets.all(10),
            height: 250,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(13),
            ),
            child:Column(
              children: [
                Row(
                  children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                     decoration:BoxDecoration(
                         borderRadius: BorderRadius.circular(15),
                         image:   DecorationImage(
                             image:image,fit: BoxFit.cover)),
                    width: 130,
                    height: 160,),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10,),
                        Text(pname,style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          fontFamily: 'Montserrat',
                        )),
                        Row(
                          children: [
                            const Text('Variations : ',style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontFamily: 'Montserrat',
                            )),
                            TextButton(
                                style: ButtonStyle(
                                  shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                                  side: const WidgetStatePropertyAll(BorderSide(color: Colors.black26))
                                ),
                                onPressed: () {},
                                child:  Text(variation1,style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontFamily: 'Montserrat',
                                ))),
                             const SizedBox(width: 2,),
                            TextButton(
                                style: ButtonStyle(
                                    shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10))),
                                    side: const WidgetStatePropertyAll(BorderSide(color: Colors.black26))
                                ),
                                onPressed: () {},
                                child:  Text(variation2,style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontFamily: 'Montserrat',
                                )))
                          ],
                        ),
                         Row(
                          children: [
                            Text(text ,style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontFamily: 'Montserrat',
                            )),
                            const Text('⭐⭐⭐⭐',style: TextStyle(fontSize: 14),),
                            const Icon(Icons.star_half,color: Colors.black12,size: 18,)
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              width: 80,
                              height: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.white,
                                border: Border.all(color: Colors.black45)
                              ),
                              child: Center(child: Text(price,style: const TextStyle(fontSize: 14),)),
                            ),
                            const SizedBox(width: 10,),
                             Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Text(offer,style: const TextStyle(color: Colors.red,
                                      fontSize: 14),),
                                  Text(price1 ,style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.black12,
                                      decoration: TextDecoration.lineThrough,
                                      decorationThickness: 2,
                                      decorationColor: Colors.black26))
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  ],
                ),
                const Divider(
                  color: Colors.black26,
                  indent: 20,
                  endIndent: 20,
                  thickness: 2,
                ),
                 Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const Text('Total Order (1)   :'),
                      const Spacer(),
                      Text(price,style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontFamily: 'Montserrat',
                      ))
                    ],
                  ),
                )
              ],
            ),
          );
}
