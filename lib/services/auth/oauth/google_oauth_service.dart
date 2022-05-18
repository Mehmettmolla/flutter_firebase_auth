import 'package:google_sign_in/google_sign_in.dart';

class GoogleOAuthService {
  final _googleSignIn = GoogleSignIn();

  Future<GoogleSignInAuthentication?> signIn() async {
    final googleUser = await _googleSignIn.signIn();
    final googleAuth = await googleUser?.authentication;

    return googleAuth;
  }
}
