import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:free_to_game/services/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider with ChangeNotifier {
  bool isFailed = false;
  bool isLoading = false;
  bool isAuthenticeted = false;
  Api api = Api();

  setLoading(bool value) {
    Timer(const Duration(milliseconds: 50), () {
      isLoading = value;
      notifyListeners();
    });
  }

  setFailed(bool value) {
    
    Timer(const Duration(milliseconds: 50), () {
      isFailed = value;
      notifyListeners();
    });
  }
  setIsAuthenticeted(bool value){
      Timer (const Duration(milliseconds : 50),(){
    isAuthenticeted = value;
    notifyListeners();
  });
  }

  checkIsAuthentecated() async{
 SharedPreferences prefs = await SharedPreferences.getInstance();
 String? token = prefs.getString("token");
if (token == null){
setIsAuthenticeted(false);
  }
else {
  setIsAuthenticeted(true);
}}
 
 
 
 storeToken(String token) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString("token", token);
  setIsAuthenticeted(true);
 }


  Future<List> login(Map sendedBody) async {
    setLoading(true);
    final response = await api.post("https://api.ha-k.ly/api/v1/client/auth/login", sendedBody);

    if (kDebugMode) {
      print("STATUS CODE${response.statusCode}");
      print("BODY :${response.body}");
    }

    if (response.statusCode == 201) {
      storeToken (json.decode(response.body)['token']);
      setLoading(false);
      setFailed(false);

      return [true, "Loged In Successfully"];
    } else {
      setLoading(false);
      setFailed(true);

      return [false, json.decode(response.body)['message']];
    }
  }
  logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    setIsAuthenticeted(false);
  }
}
