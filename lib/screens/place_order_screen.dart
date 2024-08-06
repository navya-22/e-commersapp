import 'package:flutter/material.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  String? selectSize;
  String? selectQty;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
              onPressed: () {},
            ),
            const Spacer(),
            const Text('Checkout',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontFamily: 'Montserrat',
                )),
            const Spacer(),
            const Icon(Icons.favorite_border_outlined)
          ],
        ),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            height: 180,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
            
              borderRadius: BorderRadius.circular(13),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: const DecorationImage(
                                image: AssetImage('assess/images/image 15.png'),
                                fit: BoxFit.cover)),
                        width: 130,
                        height: 160,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          const Text('Women’s Casual Wear',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                                fontFamily: 'Montserrat',
                              )),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text('Checked Single-Breasted Blazer',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                                fontFamily: 'Montserrat',
                              )),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Container(
                                height: 40,
                                width: 100,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.grey[300]),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        const Text(' Size ',
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black,
                                              fontFamily: 'Montserrat',
                                            )),
                                        DropdownButton<String>(
                                          value: selectSize,
                                          items: <String>[
                                            '42',
                                            '43',
                                            '44',
                                            '45',
                                            '46',
                                            '47'
                                          ].map((String value) {
                                            return DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(value));
                                          }).toList(),
                                          onChanged: (value) {
                                            setState(() {
                                              selectSize = value;
                                            });
                                          },
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 2,
                              ),
                              Container(
                                height: 40,
                                width: 100,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.grey[300]),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        const Text('Qty',
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.black,
                                                fontFamily: 'Montserrat')),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        DropdownButton<String>(
                                          value: selectQty,
                                          items: <String>['1', '2', '3']
                                              .map((String value) {
                                            return DropdownMenuItem(
                                                value: value,
                                                child: Text(value));
                                          }).toList(),
                                          onChanged: (value) {
                                            setState(() {
                                              selectQty = value;
                                            });
                                          },
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Row(
                            children: [
                              Text('Delivery by',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                    fontFamily: 'Montserrat',
                                  )),
                              Text(
                                '10 May 2XXX',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat',
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          ListTile(
            title: const Text('Apply Coupons', style: TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontFamily: 'Montserrat',
            )),
            trailing: TextButton(
              onPressed: () {
                // Handle apply coupon press
              },
              child: const Text('Select', style: TextStyle(
                fontSize: 14,
                color: Colors.red,
                fontFamily: 'Montserrat',
              )),
            ),
          ),
          const Divider(),
          const ListTile(
            title: Text('Order Payment Details' ,style: TextStyle(
    fontSize: 18,
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontFamily: 'Montserrat',
    )),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Order Amounts', style: TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontFamily: 'Montserrat',
              )),
              Text('₹ 7,000.00', style: TextStyle(
                fontSize: 17,
                color: Colors.black,
                fontFamily: 'Montserrat',
              )),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Text('Convenience', style: TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontFamily: 'Montserrat',
              )),
              TextButton(
                onPressed: () {  },
                child: const Text(
                  'Know More',
                  style: TextStyle(
                    color: Colors.red,
                    fontFamily: 'Montserrat',
                  ),
                ),
              ),
              const Spacer(),
              const Text(
                'Apply Coupon',
                style: TextStyle(
                  color: Colors.red,
                  fontFamily: 'Montserrat',
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Delivery Fee', style: TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontFamily: 'Montserrat',
              )),
              Text(
                'Free',
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Order Total', style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontFamily: 'Montserrat',
                  )),
                  Text('₹ 7,000.00'),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Text(
                    'EMI Available',
                  ),
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Details',
                        style: TextStyle(color: Colors.red, fontSize: 16),
                      ))
                ],
              ),
            ],
          ),
          const Divider(),
          const SizedBox(height: 30,),
          ListTile(
            title: const Text(' ₹ 7,000.00'),
            subtitle: const Text('View Details'),
            trailing: ElevatedButton(
              style: ButtonStyle(
                  fixedSize: const WidgetStatePropertyAll(Size(200, 50)),
                  backgroundColor: const WidgetStatePropertyAll(Colors.red),
                  shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ))),
              onPressed: () {},
              child: const Text(
                'Proceed to Payment',
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
