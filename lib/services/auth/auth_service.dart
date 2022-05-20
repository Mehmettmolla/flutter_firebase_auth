import 'package:firebase_auth/firebase_auth.dart';
import 'oauth/facebook_oauth_service.dart';
import 'oauth/google_oauth_service.dart';
import 'oauth/apple/apple_oauth_service.dart';

class AuthService {
  final GoogleOAuthService googleOAuthService;
  final FacebookOAuthService facebookOAuthService;
  final AppleOAuthService appleOAuthService;

  AuthService({
    required this.googleOAuthService,
    required this.facebookOAuthService,
    required this.appleOAuthService,
  });

  final _auth = FirebaseAuth.instance;

  signIn(OAuthCredential credential) {
    FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<UserCredential> signInWithGoogle() async {
    final googleAuth = await googleOAuthService.signIn();
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<UserCredential> signInWithFacebook() async {
    final facebookAuth = await facebookOAuthService.signIn();

    final credential =
        FacebookAuthProvider.credential(facebookAuth.accessToken!.token);

    return FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<UserCredential> signInWithApple() async {
    final appleAuth = await appleOAuthService.signIn();

    final oauthCredential = OAuthProvider("apple.com").credential(
      idToken: appleAuth.appleCredential.identityToken,
      rawNonce: appleAuth.rawNonce,
    );

    return await FirebaseAuth.instance.signInWithCredential(oauthCredential);
  }

  Future signInWithEmailPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future signUpWithEmailPassword(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}

final authService = AuthService(
    googleOAuthService: GoogleOAuthService(),
    facebookOAuthService: FacebookOAuthService(),
    appleOAuthService: AppleOAuthService());
