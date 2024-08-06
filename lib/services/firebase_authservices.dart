
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService{
  final _auth =FirebaseAuth.instance;
  Future<UserCredential?>loginWithGoogle()async{
    try{
      final googleUser = await GoogleSignIn().signIn();
      final googleAuth = await googleUser?.authentication;
      final cred = GoogleAuthProvider.credential(idToken:googleAuth?.idToken,accessToken:  googleAuth?.accessToken);
    return await  _auth.signInWithCredential(cred);
    }catch(e){
      print(e.toString());
    }
    return null;
  }
  Future<User?> loginWithFacebook() async {
    try {
      final LoginResult loginResult = await FacebookAuth.instance.login();
      if (loginResult.status == LoginStatus.success) {
        final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(
            loginResult.accessToken!.tokenString );
        UserCredential userCredential = await _auth.signInWithCredential(facebookAuthCredential);
        return userCredential.user;
      } else {
        print('Facebook login failed: ${loginResult.status}');
        return null;
      }
    } catch (e) {
      print(e.toString());
    }
      return null;
  }
}
