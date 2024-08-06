import 'package:flutter/material.dart';

class ShippingScreen extends StatefulWidget {
  const ShippingScreen({super.key});

  @override
  State<ShippingScreen> createState() => _ShippingScreenState();
}

class _ShippingScreenState extends State<ShippingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Checkout'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Order'),
                  Text('₹ 7,000'),
                ],
              ),
              const SizedBox(height: 8),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Shipping'),
                  Text('₹ 30'),
                ],
              ),
              const SizedBox(height: 8),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total'),
                  Text('₹ 7,030'),
                ],
              ),
              const Divider(),
              const SizedBox(height: 8),
              const Text('Payment'),
              const SizedBox(height: 16),
              paymentOption(
                title: 'VISA',
                cardNumber: '************2109',
                selected: false,
              ),
              paymentOption(
                title: 'PayPal',
                cardNumber: '************2109',
                selected: false,
              ),
              paymentOption(
                title: 'MasterCard',
                cardNumber: '************2109',
                selected: false,
              ),
              const SizedBox(height: 24),
              ElevatedButton(

                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return const AlertDialog(
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.check_circle,
                              color: Colors.green,
                              size: 60,
                            ),
                            SizedBox(height: 16),
                            Text('Payment done successfully.'),
                          ],
                        ),
                      );
                    },
                  );
                },
                style: ButtonStyle(
                  fixedSize: WidgetStatePropertyAll(Size(MediaQuery.of(context).size.width, 50)),
                  shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(borderRadius: BorderRadius.circular(14))),
                  backgroundColor:const WidgetStatePropertyAll(Colors.red),
                ),
                child: const Text(
                  'Continue',
                  style: TextStyle(fontSize: 18,color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Wishlist',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: 2, // Set the current index to highlight the correct item
        selectedItemColor: Colors.red,
        onTap: (index) {
          // Handle bottom navigation tap
        },
      ),
    );
  }

  Widget paymentOption(
      {required String title,
        required String cardNumber,
        required bool selected}) =>
      Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        decoration: BoxDecoration(
          border: Border.all(color: selected ? Colors.red : Colors.grey),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: ListTile(
          leading: const Icon(Icons.credit_card),
          title: Text(title),
          subtitle: Text(cardNumber),
          trailing:
          selected ? const Icon(Icons.check_circle, color: Colors.red) : null,
          onTap: () {
            // Handle payment option selection
          },
        ),
      );
}

