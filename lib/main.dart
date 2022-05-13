import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_firebase_auth/service/apple_auth.dart';
import 'package:flutter_firebase_auth/service/facebook_auth.dart';
import 'package:flutter_firebase_auth/service/google_auth.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(); 
  runApp(MyApp());
}
class MyApp extends StatelessWidget {  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('LOGİN'),
        ),
        body: Center(
          child: Column(
            children: [
              ElevatedButton(child: Text("google"),
              onPressed: (){
                GoogleAuth().login();
              }
              ),
              ElevatedButton(child: Text("facebook"),
              onPressed: (){
               FacebookAuth().login();
               setState(){};
              }
              ),
              ElevatedButton(child: Text("apple"),
              onPressed: (){
                AppleAuth().login();
               setState(){};
              }
              ),
            ],
          ),
        ),
      ),
    );
  }
}