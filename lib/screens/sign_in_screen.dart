import 'dart:ui';
import 'package:http/http.dart'as http;
import 'package:flutter/material.dart';
import 'package:stylish_app/screens/forgot_password_screen.dart';
import 'package:stylish_app/screens/get_started_screen.dart';
import 'package:stylish_app/screens/sign_up_screen.dart';
import 'package:stylish_app/services/firebase_authservices.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _passwordVisibility = false;
  final bool _emailVisibility = false;
  final _formKey = GlobalKey<FormState>();
  final _auth = AuthService();

  Future<void>loginUser()async{
    var url = Uri.parse('https://41d8-117-223-87-162.ngrok-free.app/login');
    try{
      var response = await http.post(
        url,
        body :{
          'email': _emailController.text,
          'password': _passwordController.text,
        }
      );
      if(response.statusCode == 307){
        var redirectedUrl = response.headers['location'];
        if(redirectedUrl != null){
          response = await http.post(
              Uri.parse(redirectedUrl),
              body: {
                'email': _emailController.text,
                'password': _passwordController.text,
              }
          );
        }
      }
      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('User logined successfully')),
        );
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const GetStartedScreen()),
       );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('login failed: ${response.reasonPhrase}')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  ' Welcome \n Back!',
                  style: TextStyle(
                    fontSize: 55,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          signInContainer(
                              Controller: _emailController,
                              icon: const Icon(
                                Icons.person,
                                color: Colors.black,
                              ),
                              hint: 'Username or  Email',
                              validator: (value) {
                                RegExp regex = RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~)]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                                if (value!.isEmpty) {
                                  return 'Please enter the Email';
                                } else {
                                  if (!regex.hasMatch(value)) {
                                    return 'Please enter a valid Email';
                                  }
                                }
                                return null;
                              }, ObscureText: _emailVisibility),
                          signInContainer(
                              Controller: _passwordController,
                              icon: const Icon(
                                Icons.lock,
                                color: Colors.black,
                              ),
                              hint: 'Password',
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _passwordVisibility =
                                          !_passwordVisibility;
                                    });
                                  },
                                  icon: Icon(
                                    _passwordVisibility
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Colors.black45,
                                  )),
                              validator: (value) {
                                RegExp regex = RegExp(
                                    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#/$*&~]).{8,}$');
                                if (value!.isEmpty) {
                                  return 'Please enter your Password';
                                } else {
                                  if (!regex.hasMatch(value)) {
                                    return 'enter a valid Password';
                                  }
                                }
                                return null;
                              }, ObscureText: !_passwordVisibility),
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => const ForgotPasswordScreen(),));
                                },
                                child: Text(
                                  'Forgot Password?',
                                  style: TextStyle(color: Colors.red[400]),
                                )),
                          )
                        ],
                      ),
                    )),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              WidgetStatePropertyAll(Colors.red[400]),
                          fixedSize: const WidgetStatePropertyAll(Size(320, 60)),
                          shape: WidgetStatePropertyAll(
                              RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(13)
                          )
                          )
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          loginUser();
                        }
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )),
                ),
                const SizedBox(
                  height: 80,
                ),
                const Align(
                    alignment: Alignment.center,
                    child: Text('- OR Continue with - ',
                        style: TextStyle(color: Colors.black45, fontSize: 20))),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    authContainer(
                      Onpress: () async {
                        //login with google
                       await  _auth.loginWithGoogle();
                       Navigator.push(context, MaterialPageRoute(builder: (context) =>const GetStartedScreen() ,));
                      },
                      image: Image.asset('assess/images/Frame 4.png'),
                    ),
                    authContainer(
                      Onpress: () {},
                      image: Image.asset('assess/images/apple 1.png'),
                    ),
                    authContainer(
                      Onpress: () async {
                        final result = await _auth.loginWithFacebook();
                        if(result != null  ){
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) => const GetStartedScreen(),));
                          print('User logged in');
                        }
                       print('login failed');
                      },
                      image: Image.asset(
                          'assess/images/facebook-app-symbol 1.png'),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Create a Account',
                        style: TextStyle(color: Colors.black45, fontSize: 20)),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SignUpScreen(),
                              ));
                        },
                        child: Text('Sign Up',
                            style: TextStyle(
                                color: Colors.red[400],
                                fontSize: 20,
                                fontWeight: FontWeight.bold))),
                  ],
                ),
                const SizedBox(
                  height: 120,
                )
              ],
            ),
          ),
        ));
  }

  Widget authContainer({required VoidCallback Onpress, required Image image}) =>
      TextButton(
        onPressed: Onpress,
        child: Container(
          height: 65,
          width: 65,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: Colors.red[100],
            border: Border.all(color: Colors.red),
          ),
          child: image,
        ),
      );

  Widget signInContainer(
          {required TextEditingController Controller,
          required Icon icon,
          Widget? suffixIcon,
            required bool ObscureText,
          required String hint,
          required String? Function(String?)? validator}) =>
      Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.grey[300], borderRadius: BorderRadius.circular(13)),
        child: TextFormField(
          controller: Controller,
          decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black45),
                  borderRadius: BorderRadius.circular(13)),
              focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(13)),
              prefixIcon: icon,
              suffixIcon: suffixIcon,
              hintText: hint),
          obscureText: ObscureText,
          keyboardType: TextInputType.text,
          validator: validator,
        ),
      );
}
