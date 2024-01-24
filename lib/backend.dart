import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

const String baseUrl = 'http://192.168.56.1';

List<dynamic> dataLists = [];

class BaseClient {

  var client = http.Client();

  Future<dynamic> get(String api) async {
    var uri = Uri.parse(baseUrl + api);


    var response = await http.get(uri);

    if(response.statusCode == 200){
      return jsonDecode(response.body);
    }else{
      throw Exception('Failed to load');
    }



  }

  Future<dynamic> post(String api, String name, String age) async {
    var uri = Uri.parse(baseUrl + api);

    var response = await http.post(uri, body: {
      'name' : name,
      'age' : age,
    });

    if (response.statusCode == 200){
      print('Added Data Successfully');
    }else{
      print('Add Failed. with code: ${response.statusCode}');
    }
  }

  Future<dynamic> put(String api, String i_name, String i_age, String f_name, String f_age) async {
    var uri = Uri.parse(baseUrl + api);

    var response = await http.post(uri, body: {
      'init_name' : i_name,
      'init_age' : i_age,
      'final_name' : f_name,
      'final_age' : f_age,
    });

    if (response.statusCode == 200){
      print('updated Succesfully');

    }else{
      print(response.statusCode);
    }


  }

  Future<dynamic> delete(String api, String name, String age) async {
    var uri = Uri.parse(baseUrl + api);

    var response = await http.post(
      uri, body: {
        'name' : name,
        'age' : age,
    }
    );

    if (response.statusCode == 200){
      print('Deleted Succesfully');

    }else{
      print(response.statusCode);
    }

  }

}