import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
 // final _formKey = GlobalKey<FormState>();
 final TextEditingController _emailController =TextEditingController();
 final TextEditingController _passwordController =TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            IconButton(
              icon:const Icon(Icons.arrow_back_ios,color: Colors.black,),
              onPressed: () {  },),
            const Spacer(),
            const Text('Checkout',style: TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontFamily: 'Montserrat',
            )),
            const Spacer(),
          ],
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Center(
                child: Container(
                  height: 200,
                  width: 180,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Stack(
                    children: [
                      const Center(
                        child: CircleAvatar(
                          backgroundColor: Colors.grey,
                          radius: 50,
                          child: Center(
                            child:Icon(
                              Icons.person,
                              color: Colors.white,
                              size: 80,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 40,
                        right: 40,
                        child: CircleAvatar(
                          radius: 19,
                          backgroundColor: Colors.blueAccent,
                          child: IconButton(
                            onPressed: (){},
                            icon: const Icon(
                              Icons.edit,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Align(
                alignment: Alignment.topLeft,
                child: Text('  Personal Details',style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                   fontWeight: FontWeight.bold,
                  fontFamily: 'Montserrat',
                ) ),
              ),
              const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                    child:Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Email Address',style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontFamily: 'Montserrat',
                        ) ),
                        const SizedBox(height: 10,),
                        TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(
                              border:OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(13),
                                borderSide: const BorderSide(color: Colors.black45)
                              ),
                            hintText:'aashifa@gmail.com'
                          ),
                        ),
                        const SizedBox(height: 20,),
                        const Text('Password',style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontFamily: 'Montserrat',
                        ) ),
                        const SizedBox(height: 10,),
                        TextFormField(
                          controller: _passwordController,
                          decoration: InputDecoration(
                              border:OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(13),
                                  borderSide: const BorderSide(color: Colors.black45)
                              ),
                              hintText:'............'
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(onPressed: (){},
                              child: const Text('ChangePassword',
                                style: TextStyle(color: Colors.red,decoration: TextDecoration.underline),)),
                        ),
                        const Divider(color: Colors.black26,thickness: 2,endIndent: 20,indent: 20,),
                        const SizedBox(height: 10,),
                        const Align(
                          alignment: Alignment.topLeft,
                          child: Text('  Business Address Details',style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Montserrat',
                          ) ),
                        ),
                        const SizedBox(height: 20,),
                        const Text('Pincode',style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontFamily: 'Montserrat',
                        ) ),
                        const SizedBox(height: 10,),
                        TextFormField(
                          // controller: _passwordController,
                          decoration: InputDecoration(
                              border:OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(13),
                                  borderSide: const BorderSide(color: Colors.black45)
                              ),
                              hintText:'Pincode'
                          ),
                        ),
                        const SizedBox(height: 20,),
                        const Text('Address',style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontFamily: 'Montserrat',
                        ) ),
                        const SizedBox(height: 10,),
                        TextFormField(
                          // controller: _passwordController,
                          decoration: InputDecoration(
                              border:OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(13),
                                  borderSide: const BorderSide(color: Colors.black45)
                              ),
                              hintText:'Country'
                          ),
                        ),
                        const SizedBox(height: 20,),
                        const Text('City',style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontFamily: 'Montserrat',
                        ) ),
                        const SizedBox(height: 10,),
                        TextFormField(
                          // controller: _passwordController,
                          decoration: InputDecoration(
                              border:OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(13),
                                  borderSide: const BorderSide(color: Colors.black45)
                              ),
                              hintText:'Country'
                          ),
                        ),
                        const SizedBox(height: 20,),
                        const Text('State',style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontFamily: 'Montserrat',
                        ) ),
                        const SizedBox(height: 10,),
                        TextFormField(
                          // controller: _passwordController,
                          decoration: InputDecoration(
                              border:OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(13),
                                  borderSide: const BorderSide(color: Colors.black45)
                              ),
                              hintText:'N1 2LL,'
                          ),
                        ),
                        const SizedBox(height: 20,),
                        const Text('Country',style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontFamily: 'Montserrat',
                        ) ),
                        const SizedBox(height: 10,),
                        TextFormField(
                          // controller: _passwordController,
                          decoration: InputDecoration(
                              border:OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(13),
                                  borderSide: const BorderSide(color: Colors.black45)
                              ),
                              hintText:'United Kingdom'
                          ),
                        ),
                        const SizedBox(height: 20,),
                        const Divider(color: Colors.black26,thickness: 2,endIndent: 20,indent: 20,),
                        const SizedBox(height: 10,),
                        const Align(
                          alignment: Alignment.topLeft,
                          child: Text('  Bank Account Details',style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Montserrat',
                          ) ),
                        ),
                        const SizedBox(height: 20,),
                        const Text('Bank Account Number',style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontFamily: 'Montserrat',
                        ) ),
                        const SizedBox(height: 10,),
                        TextFormField(
                          // controller: _passwordController,
                          decoration: InputDecoration(
                              border:OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(13),
                                  borderSide: const BorderSide(color: Colors.black45)
                              ),
                              hintText:'204356XXXXXXX'
                          ),
                        ),
                        const SizedBox(height: 10,),
                        const Text('Account Holder’s Name',style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontFamily: 'Montserrat',
                        ) ),
                        const SizedBox(height: 10,),
                        TextFormField(
                          // controller: _passwordController,
                          decoration: InputDecoration(
                              border:OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(13),
                                  borderSide: const BorderSide(color: Colors.black45)
                              ),
                              hintText:'Abhiraj Sisodiya'
                          ),
                        ),
                        const SizedBox(height: 10,),
                        const Text('Abhiraj Sisodiya',style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontFamily: 'Montserrat',
                        ) ),
                        const SizedBox(height: 10,),
                        TextFormField(
                          // controller: _passwordController,
                          decoration: InputDecoration(
                              border:OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(13),
                                  borderSide: const BorderSide(color: Colors.black45)
                              ),
                              hintText:'Abhiraj Sisodiya'
                          ),
                        ),
                        const SizedBox(height: 10,),
                      ],
                    ),
                ),
              ),
              const SizedBox(height: 10,),
              ElevatedButton(
                  style: ButtonStyle(
                    fixedSize: WidgetStatePropertyAll(
                        Size(
                            MediaQuery.of(context).size.width, 50)
                    ),
                      backgroundColor: const WidgetStatePropertyAll(Colors.red),
                 shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(13))) ),
                  onPressed: () {
                
              }, child: const Text('Save',style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontFamily: 'Montserrat',
              ) ))
            ],
          ),
        ),
      ),
    );
  }
}
