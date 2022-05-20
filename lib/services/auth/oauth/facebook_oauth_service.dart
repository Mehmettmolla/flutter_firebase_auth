import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class FacebookOAuthService {
  Future<LoginResult> signIn() async {
    final loginResult = await FacebookAuth.instance.login();

    return loginResult;
  }
}
