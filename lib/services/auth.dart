import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class AuthBase {
  User? get currentUser;
  Stream<User?> authStateChanges();
  Future<User?> signInAnonymously();
  Future<User?> signInWithGoogle();
  Future<User?> signInWithFacebook();
  Future<void> signOut();
}

class Auth implements AuthBase {
  final _firebaseAuth = FirebaseAuth.instance;

  @override
  User? get currentUser => _firebaseAuth.currentUser;

  @override
  Stream<User?> authStateChanges() => _firebaseAuth.authStateChanges();

  @override
  Future<User?> signInAnonymously() async {
    var userCredential = await _firebaseAuth.signInAnonymously();
    return userCredential.user;
  }

  @override
  Future<User?> signInWithGoogle() async {
    final googleSignIn = GoogleSignIn();
    var googleSignInAccount = await googleSignIn.signIn();
    if (googleSignInAccount == null) {
      throw FirebaseAuthException(
        code: 'ERROR_ABORTED_BY_USER',
        message: 'Sign in aborted by user',
      );
    }

    var authentication = await googleSignInAccount.authentication;
    if (authentication.idToken == null) {
      throw FirebaseAuthException(
        code: 'ERROR_MISSING_GOOGLE_ID_TOKEN',
        message: 'Missing Goggle ID token',
      );
    }

    var userCredential =
        await _firebaseAuth.signInWithCredential(GoogleAuthProvider.credential(
      idToken: authentication.idToken,
      accessToken: authentication.accessToken,
    ));

    return userCredential.user;
  }

  @override
  Future<User?> signInWithFacebook() async {
    final fb = FacebookLogin();
    final loginResult = await fb.logIn(permissions: [
      FacebookPermission.publicProfile,
      FacebookPermission.email,
    ]);

    switch (loginResult.status) {
      case FacebookLoginStatus.cancel:
        throw FirebaseAuthException(
          code: 'ERROR_ABORTED_BY_USER',
          message: 'Sign in aborted by user',
        );
      case FacebookLoginStatus.error:
        throw FirebaseAuthException(
          code: 'ERROR_FACEBOOK_LOGIN_FAILED',
          message: loginResult.error?.developerMessage,
        );
      case FacebookLoginStatus.success:
        final accessToken = loginResult.accessToken;
        if (accessToken == null) {
          throw FirebaseAuthException(
              code: 'ERROR_MISSING_FACEBOOK_ACCESS_TOKEN',
              message: "Missing Facebook access token");
        }

        var credential = await _firebaseAuth.signInWithCredential(
          FacebookAuthProvider.credential(accessToken.token),
        );
        return credential.user;
    }
  }

  @override
  Future<void> signOut() async {
    await GoogleSignIn().signOut();
    await FacebookLogin().logOut();
    await _firebaseAuth.signOut();
  }
}
