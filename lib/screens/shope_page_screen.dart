
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ShopePageScreen extends StatefulWidget {
  const ShopePageScreen({super.key});

  @override
  State<ShopePageScreen> createState() => _ShopePageScreenState();
}

class _ShopePageScreenState extends State<ShopePageScreen> {
  final _pageController = PageController(viewportFraction: 1, keepPage: true);
  @override
  Widget build(BuildContext context) {
    final pages = List.generate(
      3,
          (index) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              image: const DecorationImage(
                  image: AssetImage('assess/images/unsplash_NoVnXXmDNi0.png'),
                  fit: BoxFit.cover)),
        ),
      ),
    );
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: const Icon(Icons.shopping_cart_outlined, color: Colors.black),
              onPressed: () {},
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 200,
                        child: PageView.builder(
                          controller: _pageController,
                          itemBuilder: (_, index) {
                            return pages[index % pages.length];
                          },
                          itemCount: pages.length,
                        ),
                      ),
                      const SizedBox(height: 5),
                      SmoothPageIndicator(
                        controller: _pageController,
                        count: pages.length,
                        effect: WormEffect(
                          dotHeight: 10,
                          dotWidth: 10,
                          activeDotColor: Colors.pink.shade200,
                        ),
                      ),
                    ],
                  ),
                ),
      const SizedBox(height: 10),
        const Text(' Size : 7UK',
          style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600),),
                const SizedBox(height: 10),
        Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
        sizeContainer(size: '5 UK'),
    sizeContainer(size: '7 UK'),
    sizeContainer(size: '8 UK'),
    sizeContainer(size: '9 UK'),
    sizeContainer(size: '10 UK'),
    ],
    ),

      const SizedBox(height: 10),
      const Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nike Sneakers',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'WALKAROO Men\'s Shoes Size (All Colors)',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 5),
            Row(
              children: [
                Text(
                  '₹1,600',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  '50% off',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              'Product Overview',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Experience the comfort and style of Nike. It is designed to offer superior performance and a sleek look, ensuring you make a statement wherever you go. Perfect for casual wear, sports, or a night out.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
      Row(
        children: [
          const SizedBox(width: 10,),
          TextButton(
            onPressed: () {  },
            child: Container(
              width: 120,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border:  Border.all(color: Colors.black38)
              ),
              child: const Row(
                children: [
                  Icon(Icons.location_on_outlined,color: Colors.black38,),
                  SizedBox(width: 4,),
                  Text('Nearest Store',style: TextStyle(
                    fontSize: 12,
                    color: Colors.black45,
                    fontFamily: 'Montserrat',
                  ),)
                ],
              ),
            ),
          ),
          TextButton(onPressed: (){},
              child:Container(
                width: 60,
                height: 30,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border:  Border.all(color: Colors.black38)
                ),
                child: const Row(
                  children: [
                    Icon(Icons.lock_outline,color: Colors.black38,),
                    SizedBox(width: 4,),
                    Text('VIP',style: TextStyle(
                      fontSize: 12,
                      color: Colors.black45,
                      fontFamily: 'Montserrat',
                    ),)
                  ],
                ),
              ) ),
          TextButton(onPressed: (){},
              child: Container(
                width: 120,
                height: 30,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border:  Border.all(color: Colors.black38)
                ),
                child: const Row(
                  children: [
                    Icon(Icons.cached_outlined,color: Colors.black38,),
                    SizedBox(width: 4,),
                    Text('Return policy',style: TextStyle(
                      fontSize: 12,
                      color: Colors.black45,
                      fontFamily: 'Montserrat',
                    ),)
                  ],
                ),
              ))
        ],
      ),
      Row(
          children: [
          iconContainer(
              text: 'Go to cart  ',
              icon:const Icon(Icons.shopping_cart_outlined,color: Colors.white,),
              color: Colors.blue.shade900, color1: Colors.blue.shade900, onPress: () {  }),
   iconContainer(
       text: 'Buy Now  ',
       icon: const Icon(Icons.touch_app_outlined,color: Colors.white,),
       color: Colors.green, color1: Colors.green, onPress: (){}),
    ],
    ),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
      color: Colors.pink[100],
      borderRadius: BorderRadius.circular(10),
      ),
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Delivery in ',
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                '1 Within Hour',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    ),
      Row(
        children: [
          const SizedBox(width: 10,),
          TextButton(
            onPressed: () {  },
            child: Container(
              width: 160,
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white
              ),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(Icons.remove_red_eye_outlined,color: Colors.black87,),
                    SizedBox(width: 4,),
                    Text('View Similar',style: TextStyle(
                      fontSize: 12,
                      color: Colors.black87,
                      fontFamily: 'Montserrat',
                    ),)
                  ],
                ),
              ),
            ),
          ),
          TextButton(
            onPressed: () {  },
            child: Container(
              width: 160,
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white
              ),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(Icons.analytics_outlined,color: Colors.black45,),
                    SizedBox(width: 4,),
                    Text('Add to Compare',style: TextStyle(
                      fontSize: 12,
                      color: Colors.black87,
                      fontFamily: 'Montserrat',
                    ),)
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      const Text(
        '  Similar To',
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const Text(
                        ' 282+Items',
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
      const SizedBox(height: 10),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return  similarContainer(
                        image: const AssetImage('assess/images/unsplash_mHUk4Se7peY.png'),
                        pname: 'NIke Sneakers',
                        pdetail: 'Nike Air Jordan Retro 1 Low Mystic Black',
                        price1: '₹1,900',
                        text: '46,890',
                        Onpress: () {  });
                  },
                ),
              ],
          ),
        ),
      ),
    );
  }

  Widget iconContainer({
    required String text,
    required Icon icon,
    required Color color,
    required Color color1,
    required VoidCallback onPress
}) => TextButton(
        onPressed: onPress,
    child: SizedBox(
      height: 50,
      width: 150,
      child: Stack(
          children:[
        Positioned(
          left: 22,
          bottom: 5,
          child: Container(
            height: 40,
            width: 120,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(12)
            ),
              child: Align(
                alignment: Alignment.centerRight,
                  child: Text(text  ,style: const TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontFamily: 'Montserrat',
                  ))),),
        ),
            Positioned(
              right: 90,
              bottom: 2.5,
              child: CircleAvatar(
                maxRadius: 24,
                backgroundColor: Colors.black45,
                child: CircleAvatar(
                  child: icon,
                  backgroundColor: color1,
                  maxRadius: 23,
                ),
              ),
            ),
          ]
      ),
    ),

  );

  Widget similarContainer({
    required ImageProvider<Object> image,
    required String pname,
    required String pdetail,
    required String price1,
    required String text,
    required Function() Onpress,
}) => GestureDetector(
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
                height: 90,
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
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                  // const SizedBox(height: 4),
                  Text(
                    pdetail,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                  // const SizedBox(height: 8),
                  Text(
                    price1,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                  // const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        size: 13,
                        color: Colors.amber,
                      ),
                      const Icon(
                        Icons.star,
                        size: 13,
                        color: Colors.amber,
                      ),
                      const Icon(
                        Icons.star,
                        size: 13,
                        color: Colors.amber,
                      ),
                      const Icon(
                        Icons.star,
                        size: 13,
                        color: Colors.amber,
                      ),
                      const Icon(
                        Icons.star_half,
                        size: 13,
                        color: Colors.black26,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        text,
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

  Widget sizeContainer({required String size,}) => Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.pink.shade400),
        ),
        child: Text(
          size,
          style: TextStyle(
            fontSize: 16,
            color: Colors.pink.shade400
          ),
        ),
      );
}
