import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_firebase_auth/service/apple_auth.dart';
import 'package:flutter_firebase_auth/service/email_password_auth.dart';
import 'package:flutter_firebase_auth/service/facebook_auth.dart';
import 'package:flutter_firebase_auth/service/google_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Material App',
        home: Scaffold(
          appBar: AppBar(
            title: Text('LOGİN'),
          ),
          body: Center(
            child: Column(children: [
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(labelText: 'Email'),
                    ),
                    TextFormField(
                      controller: _passwordController,
                      decoration: const InputDecoration(labelText: 'Password'),
                    ),
                    Center(
                      child: Column(
                        children: [
                          ElevatedButton(
                              child: Text("email and password singIn"),
                              onPressed: () async {
                                await EmailPasswordAuth().signInWithEmailPassword (
                                    _emailController.text,
                                    _passwordController.text);
                              }),
                          ElevatedButton(
                              child: Text("email and password signUp"),
                              onPressed: () async {
                                await EmailPasswordAuth().signUpWithEmailPassword(
                                    _emailController.text,
                                    _passwordController.text);
                              }),
                          ElevatedButton(
                        child: Text("email and password signOut"),
                        onPressed: () async {
                          await EmailPasswordAuth().signOutWithEmailPassword();
                        }),
                        ],
                      ),
                    ),
                    
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                            child: Text("google"),
                            onPressed: () {
                              GoogleAuth().signIn();
                            }),
                        ElevatedButton(
                            child: Text("facebook"),
                            onPressed: () {
                              FacebookAuth().signIn();
                              setState() {}
                              ;
                            }),
                        ElevatedButton(
                            child: Text("apple"),
                            onPressed: () {
                              AppleAuth().signIn();
                              setState() {}
                              ;
                            }),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                            child: Text("googleOut"),
                            onPressed: () {
                              GoogleAuth().signOut();
                            }),
                        ElevatedButton(
                            child: Text("facebookOut"),
                            onPressed: () {
                              FacebookAuth().signOut();
                              setState() {}
                              ;
                            }),
                        ElevatedButton(
                            child: Text("appleOut"),
                            onPressed: () {
                              AppleAuth().signOut();
                              setState() {}
                              ;
                            }),
                      ],
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ));
  }
}
