import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth/services/auth/auth_service.dart';
import 'package:flutter_firebase_auth/services/auth/oauth/apple/apple_oauth_service.dart';
import 'package:flutter_firebase_auth/services/auth/oauth/facebook_oauth_service.dart';
import 'package:flutter_firebase_auth/services/auth/oauth/google_oauth_service.dart';

class HomeViewModel extends StatelessWidget {
  final authService = AuthService(
    googleOAuthService: GoogleOAuthService(),
    facebookOAuthService: FacebookOAuthService(),
    appleOAuthService: AppleOAuthService()
  );

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 10, left: 10),
              child: Column(
                children: [
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(labelText: 'Email'),
                  ),
                  TextFormField(
                    controller: _passwordController,
                    decoration: const InputDecoration(labelText: 'Password'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      EmailPasswordButtons(
          authService: authService,
          emailController: _emailController,
          passwordController: _passwordController),
      OAuthButtons(authService: authService),
      SignOutButton(),
    ]);
  }

  Center SignOutButton() {
    return Center(
      child: ElevatedButton(
          child: Text("SignOut Firebase"),
          onPressed: () {
            authService.signOut();
          }),
    );
  }
}

class EmailPasswordButtons extends StatelessWidget {
  const EmailPasswordButtons({
    Key? key,
    required this.authService,
    required TextEditingController emailController,
    required TextEditingController passwordController,
  })  : _emailController = emailController,
        _passwordController = passwordController,
        super(key: key);

  final AuthService authService;
  final TextEditingController _emailController;
  final TextEditingController _passwordController;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          ElevatedButton(
              child: Text("email and password singIn"),
              onPressed: () async {
                await authService.signInWithEmailPassword(
                    _emailController.text, _passwordController.text);
              }),
          ElevatedButton(
              child: Text("email and password signUp"),
              onPressed: () async {
                await authService.signUpWithEmailPassword(
                    _emailController.text, _passwordController.text);
              }),
        ],
      ),
    );
  }
}

class OAuthButtons extends StatelessWidget {
  const OAuthButtons({
    Key? key,
    required this.authService,
  }) : super(key: key);

  final AuthService authService;

  @override
  Widget build(BuildContext context) {
    return Row(
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
              authService.signInWithApple();
            }),
      ],
    );
  }
}
