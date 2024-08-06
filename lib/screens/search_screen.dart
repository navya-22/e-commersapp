import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios),
            ),
            const Spacer(),
            const Text(
              "Search",
              style: TextStyle(fontSize: 20,),
            ),
            const Spacer(),
            TextButton(
                onPressed: () {

                },
                child: const Text('Cancle',style:  TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontFamily: 'Montserrat',
                ),)),
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            height: 50,
            width: 380,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.white,
            ),
            child: TextFormField(
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
              ),
            ),
          )
        ],
      ),
    );
  }
}
