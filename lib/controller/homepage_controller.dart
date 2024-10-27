import 'dart:convert';
import 'package:eqsoftmachinetest/model/persondetail_model/persondetail_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomepageController with ChangeNotifier {
  List<PersonDetailModel> _addresses = []; //details added in list

  List<PersonDetailModel> get addresses => _addresses;

  Future<void> fetchAddresses() async {
    //fetch data from api
    final response =
        await http.get(Uri.parse("https://equalnext.com/mt/api/Customer/List"));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      _addresses =
          data.map((json) => PersonDetailModel.fromJson(json)).toList();
      notifyListeners();
    } else {
      throw Exception('Failed to load addresses');
    }
  }

  Future<void> addNewCustomer({
    required String name,
    required String phone,
    required String email,
    required List<dynamic> addresses,
  }) async {
    final newCustomer = PersonDetailModel(
      name: name,
      phone: phone,
      email: email,
      address: addresses,
    );

    final response = await http.post(
      //add the details giving in bottomsheet text feilds
      Uri.parse("https://equalnext.com/mt/api/Customer/Add"),
      headers: {"Content-Type": "application/json"},
      body: newCustomer.toRawJson(),
    );

    if (response.statusCode == 200) {
      _addresses.add(newCustomer); //add data to the new customer
      print(
          _addresses); //checking the new added details coming or not via console
      notifyListeners();
    } else {
      throw Exception('Failed to add new customer');
    }
  }
}
