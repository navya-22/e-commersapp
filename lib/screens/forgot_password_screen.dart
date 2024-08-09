import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:stylish_app/screens/get_started_screen.dart';
import 'package:http/http.dart'as http;
import 'package:stylish_app/screens/reset_password_screen.dart';
class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _emailController =TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  Future<void> _resetPassword(String email)async{
    setState(() {
      _isLoading = true;
    });
    final Url = 'https://a530-117-221-190-217.ngrok-free.app/forgetpassword';
    try{
      final response = await http.post(
        Uri.parse(Url),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': _emailController.text}),
      );
      final responseData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ResetPasswordScreen(
                email: _emailController.text,
                 id :responseData['data']['id'] ),
          ),
        );
      } else {
        // Handle error
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Error'),
            content: Text(responseData['message']),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          ),
        );
      }
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text('An error occurred. Please try again.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false,),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(' Forgot \n password?',
              style: TextStyle(fontWeight: FontWeight.bold,
                  fontSize: 55,
                fontFamily: 'Montserrat',
              height: 1.0),
            ),
            const SizedBox(height: 50,),
            Form(
              key: _formKey,
                child: Container(
                  color: Colors.grey[200],
                  child: TextFormField(
                    controller: _emailController,
                              decoration: InputDecoration(
                    border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(13),
                              ),
                              hintText: 'Enter your email address',
                              prefixIcon: const Icon(Icons.email,
                                color: Colors.black45,
                              )
                              ),
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
                    },
                            ),
                ),
            ),
            const SizedBox(height: 40,),
            const Row(
              children: [
                Text('*',style: TextStyle(color: Colors.red),),
                Text(' We will send you a message to set or reset \n your new password',
                  style: TextStyle( fontFamily: 'Montserrat',color: Colors.black87),),
              ],
            ),
         const SizedBox(height: 50,),
        _isLoading
            ? Center(child: CircularProgressIndicator(),)
            : ElevatedButton(
           style: ButtonStyle(
             shape: WidgetStatePropertyAll(
                 RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(13))),
             fixedSize: WidgetStatePropertyAll(Size(MediaQuery.of(context).size.width, 50)),
         backgroundColor: WidgetStatePropertyAll(Colors.red[400])
           ),
             onPressed: () {
             if(_formKey.currentState!.validate()){
               _resetPassword(_emailController.text);
             }
             },
             child: const Text('submit',
         style: TextStyle(
             color: Colors.white,
             fontFamily: 'Montserrat',
         fontSize: 20),))
          ],
        ),
      ),
    );
  }
}
