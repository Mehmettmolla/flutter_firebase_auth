import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_firebase_auth/services/auth/auth_service.dart';
import 'package:flutter_firebase_auth/services/auth/oauth/apple_oauth_service.dart';
import 'package:flutter_firebase_auth/services/auth/oauth/facebook_oauth_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final authService = AuthService(
    googleOAuthService: GoogleOAuthService(),
    facebookOAuthService: FacebookOAuthService(),
  );

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
                                await authService.signInWithEmailPassword(
                                    _emailController.text,
                                    _passwordController.text);
                              }),
                          ElevatedButton(
                              child: Text("email and password signUp"),
                              onPressed: () async {
                                await authService.signUpWithEmailPassword(
                                    _emailController.text,
                                    _passwordController.text);
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
                              authService.signInWithGoogle();
                            }),
                        ElevatedButton(
                            child: Text("facebook"),
                            onPressed: () {
                              authService.signInWithFacebook();
                            }),
                        ElevatedButton(
                            child: Text("apple"),
                            onPressed: () {
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
