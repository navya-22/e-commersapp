
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:stylish_app/model/productoffer_model.dart';
import '../model/productmodel.dart';

Future<List<productModel>> fetchTrendingProducts()  async {
    final response = await http.get(Uri.parse('https://41d8-117-223-87-162.ngrok-free.app/product/view'));
    if (response.statusCode == 200) {
      print('Response body: ${response.body}');
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      print('jsonResponse: $jsonResponse');

      List<dynamic> productsJson = jsonResponse['data'];
      return productsJson.map((data) => productModel.fromJson(data)).toList();
    } else {
      print('Failed to load trending products. Status code: ${response.statusCode}');
      throw Exception('Failed to load trending products');
    }
}

Future<List<ProductOfferModel>> fetchProductOffers()async{
  final response = await http.get(Uri.parse('https://2249-117-222-165-212.ngrok-free.app/productoffer/viewoffer'));
  if(response.statusCode == 200){
    Map<String,dynamic> jsonResponse = json.decode(response.body);
    List<dynamic> offerJson = jsonResponse['data'];
    return offerJson.map((data)=> ProductOfferModel.fromJson(data)).toList();
  }else{
    throw Exception('Failed to load trending products');
  }
}
