
import 'package:ecom_firebase_user_07/db/db_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService{
static final _auth=FirebaseAuth.instance;
static User? get currentUser=>_auth.currentUser;

static Future<UserCredential> login (String email,String password) async{
  final credential= await _auth.signInWithEmailAndPassword(email: email, password: password);
  return credential;
}

static Future<UserCredential> register (String email,String password) async{
  final credential= await _auth.createUserWithEmailAndPassword(email: email, password: password);
  return credential;
}

static Future<UserCredential> loginAsGuest () {
  return _auth.signInAnonymously();
}



static Future<UserCredential> signInWithGoogle() async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  // Once signed in, return the UserCredential
  return await FirebaseAuth.instance.signInWithCredential(credential);
}


static Future<void>logout(){
  return _auth.signOut();
}


}