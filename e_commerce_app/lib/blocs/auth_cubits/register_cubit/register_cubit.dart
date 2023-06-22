import 'package:bloc/bloc.dart';
import 'package:e_commerce_app1/services/sp_helper/sp_helper.dart';
import 'package:e_commerce_app1/services/sp_helper/sp_keys.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meta/meta.dart';

import '../../../models/auth/register.dart';
import '../../../services/dio_helper/dio_helper.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  static RegisterCubit get(context)=>BlocProvider.of(context);

  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FocusNode fullNameNode = FocusNode();
  FocusNode emailNode = FocusNode();
  FocusNode passwordNode = FocusNode();

  bool isPasswordVisible = true;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Registration ? registration;


  register() {
    emit(RegisterLoadingState());
    print('Loading');
   DioHelper.postData(
       url: 'register',
       data: {
         "name" : fullNameController.text,
         "email" : emailController.text,
         "password" : passwordController.text
       }).then((value){
         emit(RegisterSuccessState());
         print(value.data);
         registration = Registration.fromJson(value.data);
         SharedPrefrenceHelper.saveData(key: SharedPreferencesKeys.token, value: registration!.data!.accessToken);
         print(registration!.data!.user!.name);
   }).catchError((erorr){
     emit(RegisterErorrState());
     print(erorr);
   });
  }

  Future<void> signInWithGoogle() async {
    GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication =
    await googleSignInAccount!.authentication;
    AuthCredential authCredential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);
    UserCredential userCredential = await _auth.signInWithCredential(authCredential);
    var user = await _auth.currentUser!;
    print('user email = ${user.email}');
  }

  Future<UserCredential> signInWithFacebook() async {
    // Trigger the sign-in flow
    LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.token);

    // Once signed in, return the UserCredential
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }

  Future<void> signOut() async {
    await _googleSignIn.signOut();

    print('sign out');
  }
}
