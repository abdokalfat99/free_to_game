import 'dart:convert';

// ignore: unused_import
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
class Api {
Future<Response> get (String url, Map body) async {
  final response = await http.get(
    Uri.parse(url),
  headers: {
          "Content-Type": "application/json",
          "Accept": "application/json"
},
  );
If(kDebugMode){
  print("GET REQ ON $url");
  print("STATUD CODE : ${response.statusCode}");
  print("RES BODY : ${response.body}");
}
return response;
}


Future<Response> post (String url, Map body) async {
  final response = await http.post(
    Uri.parse(url),
    body: jsonEncode(body),
  headers: {
          "Content-Type": "application/json",
          "Accept": "application/json"
},
  );
If(kDebugMode){
  print("POST REQ ON $url");
  print("POST BODY REQ $body");
  print("STATUD CODE : ${response.statusCode}");
  print("RES BODY : ${response.body}");
}
return response;
}


Future<Response> put (String url, Map body) async {
  final response = await http.put(
    Uri.parse(url),
    body: jsonEncode(body),
  headers: {
          "Content-Type": "application/json",
          "Accept": "application/json"
},
  );
If(kDebugMode){
  print("PUT REQ ON $url");
  print("BODY PUT REQ $body");
  print("STATUD CODE : ${response.statusCode}");
  print("RES BODY : ${response.body}");
}
return response;
}


Future<Response> delete (String url, Map body) async {
  final response = await http.delete(
    Uri.parse(url),
    body: jsonEncode(body),
  headers: {
          "Content-Type": "application/json",
          "Accept": "application/json"
},
  );
If(kDebugMode){
  print("DELETE REQ ON $url");
  print("DELETE POST REQ $body");
  print("STATUD CODE : ${response.statusCode}");
  print("RES BODY : ${response.body}");
}
return response;
}
}