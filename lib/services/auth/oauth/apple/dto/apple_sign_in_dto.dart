import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class AppleSignInDTO {
  final AuthorizationCredentialAppleID appleCredential;
  final String rawNonce;

  const AppleSignInDTO({required this.appleCredential, required this.rawNonce});
}
