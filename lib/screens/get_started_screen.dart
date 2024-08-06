import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stylish_app/screens/home_screen.dart';
import 'package:stylish_app/widget/bottomnavigation.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assess/images/unsplash_fouVDmGXoPI.png'),
                    fit: BoxFit.cover)),
          ),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(),
                const Text(
                  '     You want \nAuthentic, here  \n     you go!',
                  style: TextStyle(
                      height: 1.3,
                      wordSpacing: 5.0,
                      letterSpacing: 1.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Montserrat',
                      fontSize: 40),
                ),
                const SizedBox(height: 20,),
                const Text(
                  'Find it here, buy it now!',
                  style: TextStyle(color: Colors.white70,fontWeight: FontWeight.w500,
                    fontFamily: 'Montserrat',
                    wordSpacing: 5.0,
                    letterSpacing: 1.0,),
                ),
                const SizedBox(height: 80,),
                ElevatedButton(
                    style: ButtonStyle(
                      shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(13))),
                      fixedSize: const WidgetStatePropertyAll(Size(300, 50)),
                        backgroundColor:
                            WidgetStatePropertyAll(Colors.red[400])),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const BottomnavigationScreen() ));
                    },
                    child: const Text(
                      'Get Started',
                      style: TextStyle(color: Colors.white, fontSize: 23, fontFamily: 'Montserrat',),
                    )),
                const SizedBox(height: 20,),
              ],
            ),
          )
        ],
      ),
    );
  }
}
