import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class ResetPasswordScreen extends StatefulWidget {
  final String email;
  final String id;
  const ResetPasswordScreen({
    super.key,
    required this.email,
    required this.id,
  });

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _passwordVisibility = false;
  bool _isLoading = false;

  Future<void> _submitNewPassword() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isLoading = true;
    });

    final url = 'https://your-backend-url.com/forgetpassword/resetpassword';
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'id': widget.id,
          'password': _passwordController.text,
        }),
      );
      final responseData = jsonDecode(response.body);

      if (response.statusCode == 200) {
        // Successfully reset password
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Success'),
            content: Text('Password has been reset.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).popUntil((route) => route.isFirst);
                },
                child: Text('OK'),
              ),
            ],
          ),
        );
      } else {
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
      appBar: AppBar(title: Text('Reset Password')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Reset Password for ${widget.email}',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black45),
                        borderRadius: BorderRadius.circular(13)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(13)),
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _passwordVisibility = !_passwordVisibility;
                          });
                        },
                        icon: Icon(
                          _passwordVisibility
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.black45,
                        )),
                    hintText: 'new password'),
                keyboardType: TextInputType.text,
                obscureText: !_passwordVisibility,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a new password';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _confirmPasswordController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black45),
                      borderRadius: BorderRadius.circular(13)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(13)),
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _passwordVisibility = !_passwordVisibility;
                        });
                      },
                      icon: Icon(
                        _passwordVisibility
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.black45,
                      )),
                  hintText: 'conform password',
                ),
                keyboardType: TextInputType.text,
                obscureText: !_passwordVisibility,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please re enter the Password';
                  } else {
                    if (value != _passwordController.text) {
                      return 'Not Match';
                    }
                  }
                  return null;
                },
              ),
              SizedBox(height: 40),
              _isLoading
                  ? Center(child: CircularProgressIndicator())
                  : ElevatedButton(
                      onPressed: _submitNewPassword,
                      child: Text('Submit'),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
