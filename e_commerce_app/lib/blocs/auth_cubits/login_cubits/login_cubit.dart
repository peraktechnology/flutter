import 'package:bloc/bloc.dart';
import 'package:e_commerce_app1/models/auth/login.dart';
import 'package:e_commerce_app1/services/dio_helper/dio_helper.dart';
import 'package:e_commerce_app1/services/sp_helper/sp_helper.dart';
import 'package:e_commerce_app1/services/sp_helper/sp_keys.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meta/meta.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(context)=>BlocProvider.of(context);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FocusNode emailNode = FocusNode();
  FocusNode passwordNode = FocusNode();
  bool isPasswordVisible = true;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Login? login;
  
  
  loginAuth(){
    emit(LoginLoadingState());
    print('Loading');
    DioHelper.postData(
        url: 'login',
        data: {
          "email" : emailController.text,
          "password" : passwordController.text
        }).then((value){
          emit(LoginSuccessState());
          print(value.data);
          login = Login.fromJson(value.data);
          SharedPrefrenceHelper.saveData(key: SharedPreferencesKeys.token, value: login!.data!.accessToken);
          print(login!.data!.user!.name);
    }).catchError((erorr){
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

  Future<void> signOut() async {
    await _googleSignIn.signOut();
    print('sign out');
  }



}
