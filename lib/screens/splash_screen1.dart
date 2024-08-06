import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:stylish_app/screens/sign_in_screen.dart';

class SplashScreen1 extends StatefulWidget {
  const SplashScreen1({super.key});

  @override
  State<SplashScreen1> createState() => _SplashScreen1State();
}

class _SplashScreen1State extends State<SplashScreen1> {
  final PageController _controller = PageController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('${currentIndex + 1}/3', style: const TextStyle(fontSize: 18)),
                  TextButton(
                    onPressed: () {
                      _controller.jumpToPage(2);
                    },
                    child: TextButton(onPressed: () { Navigator.push(
                        context, MaterialPageRoute(builder: (context) => const SignInScreen(),)); },
                    child: const Text('Skip', style: TextStyle(fontSize: 18))),
                  ),
                ],
              ),
            ),
            Expanded(
              child: PageView(
                controller: _controller,
                onPageChanged: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                children: [
                  splashPage(
                    image: Image.asset('assess/images/fashion shop-rafiki 1.png'),
                    text1: 'Choose Products',
                  ),
                  splashPage(
                    image: Image.asset('assess/images/Sales consulting-pana 1.png'),
                    text1: 'Make Payment',
                  ),
                  splashPage(
                    image: Image.asset('assess/images/Shopping bag-rafiki 1.png'),
                    text1: 'Get Your Order',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: SmoothPageIndicator(
                controller: _controller,
                count: 3,
                effect: const  ExpandingDotsEffect(
                  dotHeight: 8,
                  dotWidth: 8,
                  activeDotColor: Colors.black,
                ),
              ),
            ),
           const Spacer(),
            currentIndex == 2
                ? TextButton(
              onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const SignInScreen(),));  },
              child: const Text(
                'Get Started',
                style: TextStyle(fontSize: 20,color: Colors.redAccent),
              ),
            )
                : TextButton(
              onPressed: () {
                _controller.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeIn,
                );
              },
              child: const Text(
                'Next',
                style: TextStyle(fontSize: 20,color: Colors.redAccent),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget splashPage({
    required Image image,
    required String text1,
  }) =>
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            image,
            const SizedBox(height: 20),
            Text(
              text1,
              style: const TextStyle(color: Colors.black, fontSize: 23),
            ),
            const SizedBox(height: 10),
            const Text(
              'Amet minim mollit non deserunt ullamco est\n'
                  'sit aliqua dolor do amet sint. Velit officia\n'
                  'consequat duis enim velit mollit.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black26, fontSize: 18),
            ),
          ],
        ),
      );
}

