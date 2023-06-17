
import 'package:ecom_firebase_user_07/auth/auth_service.dart';
import 'package:ecom_firebase_user_07/db/db_helper.dart';
import 'package:ecom_firebase_user_07/models/user_model.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier{
  UserModel? userModel;
  Future <void> addUser(UserModel user) {
    return DbHelper.addUser(user);
  }

  Future<bool> doesUserExists(String uid){
    return DbHelper.doesUserExist(uid);
  }

  getUserInfo(){
   DbHelper.getUserInfo(AuthService.currentUser!.uid).listen((snapshot) {
     if(snapshot.exists){
       userModel=UserModel.fromMap(snapshot.data()!);
       notifyListeners();
     }
   });
  }

  Future<void> userProfileUpdate(String userField, dynamic value){
    return DbHelper.userProfileUpdate(AuthService.currentUser!.uid,{userField:value});
  }

}