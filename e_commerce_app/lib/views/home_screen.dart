import 'package:e_commerce_app1/blocs/auth_cubits/register_cubit/register_cubit.dart';
import 'package:e_commerce_app1/utils/app_navigator.dart';
import 'package:e_commerce_app1/views/login_screen.dart';
import 'package:e_commerce_app1/views/register_Screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  RegisterCubit registerCubit;


  HomeScreen({required this.registerCubit});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Center(
        child: GestureDetector(
          onTap: (){
            registerCubit.signOut();
            AppNavigator(context, true, RegisterScreen());
          },
          child: Text(
            'logout'
          ),
        ),
      ),
    );
  }
}
