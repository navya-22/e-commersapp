import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:stylish_app/services/api_service.dart';

import '../model/productmodel.dart';

class TrendingProductScreen extends StatefulWidget {
  const TrendingProductScreen({super.key});

  @override
  State<TrendingProductScreen> createState() => _TrendingProductScreenState();
}

class _TrendingProductScreenState extends State<TrendingProductScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _searchController = TextEditingController();
  late Future<List<productModel>> _futureProduct;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _futureProduct = fetchTrendingProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              IconButton(onPressed: () {

              }, icon: const Icon(Icons.menu)),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assess/images/Group 34010.png',
                    height: 30,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text('stylish',
                      style: TextStyle(
                          color: Colors.blue[200],
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'LibreCaslonText',
                          decoration: TextDecoration.none))
                ],
              ),
              const Spacer(),
              Image.asset('assess/images/2289_SkVNQSBGQU1PIDEwMjgtMTE2 1.png'),
              const SizedBox(
                width: 20,
              ),
            ],
          ),
        automaticallyImplyLeading: false,
        ),
      body:SingleChildScrollView(
    scrollDirection: Axis.vertical,
    child: Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
           children: [
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Form(
                 key: _formKey,
                 child: Container(
                   decoration: BoxDecoration(
                       color: Colors.white,
                       borderRadius: BorderRadius.circular(13)),
                   child: Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: TextFormField(
                       controller: _searchController,
                       decoration: const InputDecoration(
                         suffixIcon: Icon(
                           Icons.mic_none,
                           color: Colors.black45,
                         ),
                         hintText: 'Search any Product..',
                         hintStyle: TextStyle(
                           fontSize: 20,
                           color: Colors.black45,
                           fontFamily: 'Montserrat',
                         ),
                         prefixIcon: Icon(
                           Icons.search_outlined,
                           color: Colors.black45,
                         ),
                         border: InputBorder.none,
                         enabledBorder: InputBorder.none,
                         disabledBorder: InputBorder.none,
                         focusedBorder: InputBorder.none,
                       ),
                     ),
                   ),
                 ),
               ),
             ),
             const SizedBox(
               height: 20,
             ),
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Row(
                 children: [
                   const Text(
                     ' 52,082+Items',
                     style: TextStyle(
                       fontSize: 25,
                       color: Colors.black,
                       fontWeight: FontWeight.bold,
                       fontFamily: 'Montserrat',
                     ),
                   ),
                   const Spacer(),
                   Container(
                     width: 80,
                     height: 40,
                     decoration: BoxDecoration(
                         color: Colors.white,
                         borderRadius: BorderRadius.circular(13)),
                     child: Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Row(
                         children: [
                           const Text(
                             'Sort',
                             style: TextStyle(
                               fontSize: 20,
                               color: Colors.black,
                               fontWeight: FontWeight.bold,
                               fontFamily: 'Montserrat',
                             ),
                           ),
                           const SizedBox(
                             width: 5,
                           ),
                           Image.asset(
                             'assess/images/Component 1.png',
                             color: Colors.black,
                           ),
                         ],
                       ),
                     ),
                   ),
                   const SizedBox(
                     width: 15,
                   ),
                   Container(
                     width: 100,
                     height: 40,
                     decoration: BoxDecoration(
                         color: Colors.white,
                         borderRadius: BorderRadius.circular(13)),
                     child: const Padding(
                       padding: EdgeInsets.all(8.0),
                       child: Row(
                         children: [
                           Text(
                             'Filter',
                             style: TextStyle(
                               fontSize: 20,
                               color: Colors.black,
                               fontWeight: FontWeight.bold,
                               fontFamily: 'Montserrat',
                             ),
                           ),
                           SizedBox(
                             width: 5,
                           ),
                           Icon(
                             Icons.filter_alt_outlined,
                             color: Colors.black,
                           ),
                         ],
                       ),
                     ),
                   ),
                 ],
               ),
             ),
             const SizedBox(height: 20),
             FutureBuilder<List<productModel>>(
               builder: (context, snapshot) {
                 if (snapshot.connectionState == ConnectionState.waiting) {
                   return const Center(
                       child:
                       CircularProgressIndicator(color: Colors.black87));
                 } else if (snapshot.hasError) {
                   return Center(
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                       crossAxisAlignment: CrossAxisAlignment.center,
                       children: [
                         Text('Error: ${snapshot.error}'),
                         ElevatedButton(
                           onPressed: () {
                             setState(() {
                               _futureProduct = fetchTrendingProducts();
                             });
                           },
                           child: const Text('Retry'),
                         ),
                       ],
                     ),
                   );
                 } else if (!snapshot.hasData) {
                   return const Center(child: Text('No products found'));
                 } else {
                   return GridView.builder(
                     shrinkWrap: true,
                     physics: const NeverScrollableScrollPhysics(),
                     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                       crossAxisCount: 2,
                       crossAxisSpacing: 10,
                       mainAxisSpacing: 10,
                       childAspectRatio: 0.7,
                     ),
                     itemCount: snapshot.data!.length,
                     itemBuilder: (context, index) {
                       final product = snapshot.data![index];
                       // Debug print statements
                       print('Product: $product');
                       print('Product price: ${product.price}');
                       print('Product rate: ${product.rate}');
                       return productContainer(
                         image: NetworkImage('${product.image}'),
                         pname: '${product.name}',
                         pdetail: '${product.details}',
                         price1: product.price!.toString(),
                         rate: product.rate!.toString(),
                         Onpress: () {},
                       );
                     },
                   );
                 }
               },
               future: _futureProduct,
             ),
             const SizedBox(
               height: 10,
             ),
           ],
    ),
    ),
      ),
    );
  }

  Widget productContainer({
    required ImageProvider<Object> image,
    required String pname,
    required String pdetail,
    required String price1,
    required String rate,
    required Function() Onpress,
  }) {
    return GestureDetector(
      onTap: Onpress,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(13),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(13)),
              child: Image(
                image: image,
                fit: BoxFit.cover,
                height: 150,
                width: double.infinity,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    pname,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                  Text(
                    pdetail,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                  Text(
                    ' \u{20B9} $price1',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        size: 15,
                        color: Colors.amber,
                      ),
                      const Icon(
                        Icons.star,
                        size: 15,
                        color: Colors.amber,
                      ),
                      const Icon(
                        Icons.star,
                        size: 15,
                        color: Colors.amber,
                      ),
                      const Icon(
                        Icons.star,
                        size: 15,
                        color: Colors.amber,
                      ),
                      const Icon(
                        Icons.star_half,
                        size: 15,
                        color: Colors.black26,
                      ),
                      const SizedBox(width: 4),
                      Text(
                          '$rate',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black45,
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
      ),
    );
  }

}
