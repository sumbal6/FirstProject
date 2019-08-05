import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class BaseAuth {
 Future<String> signInWithEmailandPassword(String email, String password);
 Future<String> createUserWithEmailAndPassword(String email, String password);
 Future<String> signInWithGoogle();
 Future<FirebaseUser> getCurrentUser();
 Future<void> signOut();
}
class Auth implements BaseAuth {
 final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
 final GoogleSignIn _googleSignIn = GoogleSignIn();
 Future<String> signInWithEmailandPassword(
     String email, String password) async {
   AuthResult user = await _firebaseAuth.signInWithEmailAndPassword(
       email: email, password: password);
   return user.user.uid;
 }
 Future<FirebaseUser> getCurrentUser() async {
   FirebaseUser user = await _firebaseAuth.currentUser();
   return user;
 }
 Future<void> signOut() async {
   return _firebaseAuth.signOut();
 }
 Future<String> createUserWithEmailAndPassword(
     String email, String password) async {
   AuthResult user = await _firebaseAuth.createUserWithEmailAndPassword(
       email: email, password: password);
   return user.user.uid;
 }
 @override
 Future<String> signInWithGoogle() async {
   final GoogleSignInAccount account = await _googleSignIn.signIn();
  final GoogleSignInAuthentication _auth = await account.authentication;
  final AuthCredential credential = GoogleAuthProvider.getCredential(
    accessToken: _auth.accessToken,
    idToken: _auth.idToken,
  );
  return (await _firebaseAuth.signInWithCredential(credential)).user.uid;
 }
}
