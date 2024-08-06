import 'package:flutter/material.dart';
import 'package:stylish_app/screens/sign_in_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../services/firebase_authservices.dart';
import 'get_started_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _conformPasswordController = TextEditingController();
  bool _passwordVisibility = false;
  final bool _emailVisibility =false;
  final _formKey = GlobalKey<FormState>();
  final _auth = AuthService();

  Future<void> registerUser() async {
    var  url = Uri.parse('https://41d8-117-223-87-162.ngrok-free.app/register');
    try {
      var  response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'email': _emailController.text,
          'password': _passwordController.text,
          'confirmPassword': _conformPasswordController.text,
        }),
      );
      print('hai');
      print('Status Code: ${response.statusCode}');
      print('Headers: ${response.headers}');
      print('Body: ${response.body}');
      if (response.statusCode == 307) {
        // Follow the redirect
        var redirectedUrl = response.headers['location'];
        if (redirectedUrl != null) {
          response = await http.post(
            Uri.parse(redirectedUrl),
            body: {
              'email': _emailController.text,
              'password': _passwordController.text,
              'conformPassword': _conformPasswordController.text,
            },
          );
        }
      }
      if (response.statusCode == 200) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const GetStartedScreen()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Registration failed: ${response.body}')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Network error: $e')),
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
            padding: const EdgeInsets.all(13.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  ' Create an \n account',
                  style: TextStyle(
                    fontSize: 55,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Montserrat',
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
                          signInContainer(
                              Controller: _conformPasswordController,
                              icon: const Icon(
                                Icons.lock,
                                color: Colors.black,
                              ),
                              hint: 'ConformPassword',
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
                               if(value!.isEmpty){
                                 return 'Please re enter the Password';
                               }else{
                                 if(value!= _passwordController.text){
                                   return 'Not Match';
                                 }
                               }
                                return null;
                              }, ObscureText: !_passwordVisibility),
                          const SizedBox(height: 10,),
                          const Row(
                            children: [
                              Text(
                                '    By clicking the',
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontFamily: 'Montserrat',
                                  wordSpacing: 5.0,
                                ),
                              ),
                              Text(
                                ' Register',
                                style: TextStyle(
                                  color: Colors.redAccent,
                                  fontFamily: 'Montserrat',
                                  wordSpacing: 5.0,
                                ),
                              ),
                              Text(
                                ' button, you agree ',
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontFamily: 'Montserrat',
                                  wordSpacing: 5.0,
                                ),
                              )
                            ],
                          ),
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '    to the public offer',
                              style: TextStyle(
                                color: Colors.black87,
                                fontFamily: 'Montserrat',
                                wordSpacing: 5.0,
                              ),
                            ),
                          )
                        ],
                      ),
                    )),
                const SizedBox(height: 20,),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              WidgetStatePropertyAll(Colors.red[400]),
                          fixedSize: const WidgetStatePropertyAll(Size(320, 60)),
                          shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(13)
                          )
                          )
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          registerUser();
                        }
                      },
                      child: const Text(
                        'Create Account',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )),
                ),
                const SizedBox(
                  height: 50,
                ),
                const Align(
                    alignment: Alignment.center,
                    child: Text('- OR Continue with - ',
                        style: TextStyle(color: Colors.black45, fontSize: 20))),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    authContainer(
                      Onpress: () async {
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
                      Onpress: () {},
                      image: Image.asset(
                          'assess/images/facebook-app-symbol 1.png'),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('I Already Have an Account',
                        style: TextStyle(color: Colors.black45, fontSize: 20)),
                    TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const SignInScreen(),));
                      },
                      child: Text(' Login',
                          style: TextStyle(
                              color: Colors.red[400],
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                    ),
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
          obscureText: ObscureText,
          keyboardType: TextInputType.text,
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
          validator: validator,
        ),
      );
}
