import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:stylish_app/model/productoffer_model.dart';
import 'package:stylish_app/services/api_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  final _pageController = PageController(viewportFraction: 1, keepPage: true);
  final _formKey = GlobalKey<FormState>();
  final CarouselController _carouselController = CarouselController();
  late Future<List<ProductOfferModel>> _futureOffer;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _futureOffer = fetchProductOffers();

  }
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
                  image: AssetImage('assess/images/Rectangle 48.png'),
                  fit: BoxFit.cover)),
          child: Stack(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '50-40% OFF',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Now in (product) \nAll colours',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      style: ButtonStyle(
                        fixedSize: const WidgetStatePropertyAll(Size(190, 35)),
                        backgroundColor:
                            const WidgetStatePropertyAll(Colors.transparent),
                        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                            side: const BorderSide(color: Colors.white))),
                      ),
                      onPressed: () {},
                      child: const Row(
                        children: [
                          Text(
                            'Shop Now ',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: 'Montserrat',
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
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
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(children: [
                  Form(
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
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      const Text(
                        ' All Featured',
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
                  const SizedBox(
                    height: 10,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15)),
                      height: 120,
                      // width: MediaQuery.of(context).size.width,
                      child: Row(
                        children: [
                          allItem(
                              image: const AssetImage(
                                  'assess/images/Ellipse 4.png'),
                              text: 'Beauty',
                              Onpress: () {}),
                          allItem(
                              image: const AssetImage(
                                  'assess/images/unsplash__3Q3tsJ01nc.png'),
                              text: 'Fashion',
                              Onpress: () {}),
                          allItem(
                              image: const AssetImage(
                                  'assess/images/unsplash_GCDjllzoKLo.png'),
                              text: 'Kids',
                              Onpress: () {}),
                          allItem(
                              image: const AssetImage(
                                  'assess/images/unsplash_xPJYL0l5Ii8.png'),
                              text: 'Mens',
                              Onpress: () {}),
                          allItem(
                              image: const AssetImage(
                                  'assess/images/unsplash_OYYE4g-I5ZQ.png'),
                              text: "Women's",
                              Onpress: () {}),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
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
                  offerContainer(
                      color: Colors.blueAccent,
                      text1: 'Deal of the Day',
                      icon: Icons.alarm,
                      text2: '22h 55m 20s remaining ',
                      Onpress: () {}),
                 FutureBuilder<List<ProductOfferModel>>(
                   future: _futureOffer,
                   builder: (context,snapshot) {
                     if (snapshot.connectionState == ConnectionState.waiting) {
                       return const Center(child: CircularProgressIndicator());
                     } else if (snapshot.hasError) {
                       return const Center(
                           child: Text('Failed to load product offers'));
                     } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                       return const Center(
                           child: Text('No product offers available'));
                     } else {
                       return Padding(
                         padding: const EdgeInsets.symmetric(vertical: 8),
                         child: SizedBox(
                           width: double.infinity,
                           height: 430,
                           child: Stack(
                             children: [
                               Center(
                                 child: CarouselSlider(
                                   carouselController: _carouselController,
                                   options: CarouselOptions(
                                     autoPlay: true,
                                     enlargeCenterPage: true,
                                     viewportFraction: 1.0,
                                     aspectRatio: .6,
                                     initialPage: 0,
                                   ),
                                   items: snapshot.data!.map((product) {
                                     return Builder(
                                       builder: (BuildContext context) {
                                         return productContainer(
                                           image: NetworkImage(product.image!),
                                           pname: product.name!,
                                           pdetail: product.details!,
                                           price1: '\u{20B9} ${product.price}',
                                           price2: '\u{20B9} ${product.oldprice}',
                                           offer: '${product.offer!} off',
                                           text: product.rate!,
                                           Onpress: () {},
                                         );
                                       },
                                     );
                                   }).toList(),
                                 ),
                               ),
                               // Positioned(
                               //   top: 200,
                               //   left: 10,
                               //   child: IconButton(
                               //     onPressed: () {
                               //       _carouselController.previousPage();
                               //     },
                               //     icon: Icon(Icons.arrow_back_ios),
                               //   ),
                               // ),
                               // Positioned(
                               //   top: 200,
                               //   right: 10,
                               //   child: IconButton(
                               //     onPressed: () {
                               //       _carouselController.nextPage();
                               //     },
                               //     icon: Icon(Icons.arrow_forward_ios),
                               //   ),
                               // ),
                             ],
                           ),
                         ),
                       );
                     }
                   }
                 ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 90,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Image.asset('assess/images/Rectangle 56.png'),
                          const SizedBox(
                            width: 20,
                          ),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Special Offers  😱',
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 19,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                ' We make sure you get the \n offer you need at best prices',
                                style: TextStyle(
                                    fontFamily: 'Montserrat', fontSize: 16),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        color: Colors.white,
                      ),
                      child: Stack(
                        children: <Widget>[
                          Image.asset('assess/images/Rectangle 54.png'),
                          Positioned(
                              top: 2,
                              left: 8,
                              child:
                                  Image.asset('assess/images/Group 33732.png')),
                          Positioned(
                              top: 30,
                              left: 18,
                              child: Image.asset(
                                  'assess/images/Rectangle 55.png')),
                          Positioned(
                            top: 20,
                            right: 20,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  const Text(
                                    'Flat and Heels',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const Text(
                                    'Stand a chance to get rewarded',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontFamily: 'Montserrat',
                                    ),
                                  ),
                                  ElevatedButton(
                                    style: ButtonStyle(
                                      fixedSize: const WidgetStatePropertyAll(
                                          Size(170, 35)),
                                      backgroundColor:
                                          const WidgetStatePropertyAll(
                                              Colors.pink),
                                      shape: WidgetStatePropertyAll(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              side: const BorderSide(
                                                  color: Colors.pink))),
                                    ),
                                    onPressed: () {},
                                    child: const Row(
                                      children: [
                                        Text(
                                          'Visit now ',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontFamily: 'Montserrat',
                                          ),
                                        ),
                                        Icon(
                                          Icons.arrow_forward,
                                          color: Colors.white,
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  offerContainer(
                      color: Colors.pink.shade300,
                      text1: '  Trending Products ',
                      icon: Icons.calendar_month,
                      text2: '  Last Date 29/02/22   ',
                      Onpress: () {}),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Stack(children: [
                      Row(
                        children: [
                          specialContainer(
                              onPress: () {},
                              image: const AssetImage(
                                'assess/images/image 18 (1).png',
                              ),
                              pname: 'IWC Schaffhausen ',
                              pdetail: "2021 Pilot's Watch 'SIHH 2019'44mm",
                              price1: '₹650',
                              price2: '₹1599',
                              offer: '60%Off'),
                          specialContainer(
                              onPress: () {},
                              image: const AssetImage(
                                'assess/images/image 18.png',
                              ),
                              pname: 'Labbin White Sneakers',
                              pdetail: ' For Men and Female',
                              price1: '₹650',
                              price2: '₹1250',
                              offer: '70% off'),
                          specialContainer(
                              onPress: () {},
                              image: const AssetImage(
                                'assess/images/image 18(3).png',
                              ),
                              pname: "Mammon Women's ",
                              pdetail: ' Handbag(Set of 3, Beige)',
                              price1: '₹750',
                              price2: '₹1999',
                              offer: '70% off'),
                        ],
                      ),
                      Positioned(
                        bottom: 130,
                        left: 320,
                        child: TextButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  WidgetStatePropertyAll(Colors.grey[400]),
                              fixedSize:
                                  const WidgetStatePropertyAll(Size(40, 40)),
                              shape: const WidgetStatePropertyAll(
                                  CircleBorder(side: BorderSide(width: 80)))),
                          onPressed: () {},
                          child: const Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.black,
                          ),
                        ),
                      )
                    ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: <Widget>[
                          Image.asset('assess/images/Mask Group.png'),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'New Arrivals ',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      'Summer’ 25 Collections',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontFamily: 'Montserrat',
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                ElevatedButton(
                                  style: ButtonStyle(
                                    fixedSize:
                                        const WidgetStatePropertyAll(Size(150, 35)),
                                    backgroundColor:
                                        const WidgetStatePropertyAll(Colors.pink),
                                    shape: WidgetStatePropertyAll(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            side: const BorderSide(
                                                color: Colors.pink))),
                                  ),
                                  onPressed: () {},
                                  child: const Row(
                                    children: [
                                      Text(
                                        'Visit now ',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontFamily: 'Montserrat',
                                        ),
                                      ),
                                      Icon(
                                        Icons.arrow_forward,
                                        color: Colors.white,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 390,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Sponserd',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              fontFamily: 'Montserrat',
                            ),
                          ),
                          Container(
                            height: 300,
                            width: 380,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assess/images/image 12.png'),
                                    fit: BoxFit.cover)),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Row(
                              children: [
                                Text(
                                  'up to 50% Off',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 15,
                                    fontFamily: 'Montserrat',
                                  ),
                                ),
                                Spacer(),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.black,
                                  size: 20,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
                ),
            ),
        ),
    );
  }

  Widget specialContainer({
    required VoidCallback onPress,
    required ImageProvider image,
    required String pname,
    required String pdetail,
    required String price1,
    required String price2,
    required String offer,
  }) =>
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 320,
          width: 250,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
          ),
          child: TextButton(
            onPressed: onPress,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    height: 160,
                    width: 240,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: image, fit: BoxFit.cover),
                    )),
                Text(
                  pname,
                  style: const TextStyle(
                      fontSize: 19,
                      color: Colors.black,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w400),
                ),
                Text(pdetail,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontFamily: 'Montserrat',
                    )),
                Text(
                  price1,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      price2,
                      style: const TextStyle(
                          fontSize: 18,
                          color: Colors.black12,
                          decoration: TextDecoration.lineThrough,
                          decorationThickness: 2,
                          decorationColor: Colors.black26),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      offer,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.red,
                        fontFamily: 'Montserrat',
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      );

  Widget productContainer(
          {required ImageProvider image,
          required String pname,
          required String pdetail,
          required String price1,
          required String price2,
          required String offer,
          required String text,
          required VoidCallback Onpress}) =>
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 250,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
          ),
          child: TextButton(
            onPressed: Onpress,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    height: 160,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: image, fit: BoxFit.cover),
                    )),
                Text(
                  pname,
                  style: const TextStyle(
                      fontSize: 19,
                      color: Colors.black,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w400),
                ),
                Text(pdetail,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontFamily: 'Montserrat',
                    )),
                Text(
                  price1,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      price2,
                      style: const TextStyle(
                          fontSize: 18,
                          color: Colors.black12,
                          decoration: TextDecoration.lineThrough,
                          decorationThickness: 2,
                          decorationColor: Colors.black26),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      offer,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.red,
                        fontFamily: 'Montserrat',
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.yellow[600],
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.yellow[600],
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.yellow[600],
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.yellow[600],
                    ),
                    const Icon(
                      Icons.star_half,
                      color: Colors.black12,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      text,
                      style:
                          const TextStyle(fontSize: 16, color: Colors.black12),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      );

  Widget offerContainer(
          {required Color color,
          required String text1,
          required IconData icon,
          required VoidCallback Onpress,
          required String text2}) =>
      Container(
        margin: const EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width,
        height: 90,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18), color: color),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    text1,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(
                          icon,
                          color: Colors.white,
                        ),
                        Text(text2,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontFamily: 'Montserrat',
                            ))
                      ],
                    ),
                  )
                ],
              ),
              TextButton(
                  style: ButtonStyle(
                      side: const WidgetStatePropertyAll(
                          BorderSide(color: Colors.white)),
                      maximumSize: const WidgetStatePropertyAll(Size(100, 40)),
                      shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(13)))),
                  onPressed: Onpress,
                  child: const Row(
                    children: [
                      Text(
                        'View all',
                        style: TextStyle(color: Colors.white),
                      ),
                      Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      )
                    ],
                  ))
            ],
          ),
        ),
      );

  Widget allItem(
          {required VoidCallback Onpress,
          required AssetImage image,
          required String text}) =>
      Column(
        children: [
          TextButton(
            onPressed: Onpress,
            child: CircleAvatar(
              maxRadius: 40,
              backgroundImage: image,
            ),
          ),
          Text(
            text,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontFamily: 'Montserrat',
            ),
          )
        ],
      );
}
