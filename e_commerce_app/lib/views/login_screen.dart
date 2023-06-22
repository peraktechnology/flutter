import 'package:e_commerce_app1/blocs/auth_cubits/register_cubit/register_cubit.dart';
import 'package:e_commerce_app1/utils/app_navigator.dart';
import 'package:e_commerce_app1/views/home_screen.dart';
import 'package:e_commerce_app1/views/register_Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../blocs/auth_cubits/login_cubits/login_cubit.dart';
import '../components/my_text_formField.dart';
import '../components/reusable_button.dart';

class LoginScreen extends StatefulWidget {


  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if(state is LoginSuccessState){
            AppNavigator(context, true, HomeScreen(registerCubit: RegisterCubit.get(context),));
          };
        },
        builder: (context, state) {
          var cubit = LoginCubit.get(context);
          return Scaffold(
              body: SingleChildScrollView(
                child: Column(children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 40.0, left: 20, right: 20),
                      child: Column(
                        children: [
                          Image(image: AssetImage('assets/images/logo.png')),
                          SizedBox(
                            height: 20.h,
                          ),
                          const Text(
                            'Welcome back',
                            style: TextStyle(
                                color: Color(0xff214eff),
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 7.h,
                          ),
                          const Text(
                            'Please login to your account',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              // fontWeight: FontWeight.bold
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          MyTextFormField(
                            name: 'your email',
                            controller: cubit.emailController,
                            isPassword: false,
                            preIcon: Icon(Icons.email),
                            type: TextInputType.emailAddress,
                            focusNode: cubit.emailNode,
                            function: (_) {
                              FocusScope.of(context).requestFocus(cubit.passwordNode);
                            },
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          MyTextFormField(
                            name: 'your password',
                            controller: cubit.passwordController,
                            isPassword: cubit.isPasswordVisible,
                            preIcon: Icon(Icons.lock),
                            type: TextInputType.visiblePassword,
                            sufIcon: IconButton(
                                icon: cubit.isPasswordVisible
                                    ? Icon(Icons.visibility_off)
                                    : Icon(Icons.visibility),
                                onPressed: () => setState(
                                        () => cubit.isPasswordVisible = !cubit.isPasswordVisible)),
                            focusNode: cubit.passwordNode,
                            function: (_) {
                              FocusScope.of(context).requestFocus();
                            },
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Row(
                            children: [
                              Text(
                                'forgot password',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13.sp,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          MyTextButton(
                              function: () {
                                cubit.loginAuth();
                              },
                              width: double.infinity,
                              text: 'Continue'),
                          SizedBox(
                            height: 20.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 30,
                                backgroundColor: Color(0xffeeeeee),
                                child: CircleAvatar(
                                  backgroundImage:
                                  AssetImage('assets/images/facebook1.png'),
                                  backgroundColor: Color(0xffeeeeee),
                                  radius: 15,
                                ),
                              ),
                              SizedBox(
                                width: 15.w,
                              ),
                              CircleAvatar(
                                radius: 30,
                                backgroundColor: Color(0xffeeeeee),
                                child: CircleAvatar(
                                  backgroundImage:
                                  AssetImage('assets/images/twitter2.png'),
                                  backgroundColor: Color(0xffeeeeee),
                                  radius: 15,
                                ),
                              ),
                              SizedBox(
                                width: 15.w,
                              ),
                              GestureDetector(
                                onTap: (){
                                  cubit.signInWithGoogle();
                                },
                                child: CircleAvatar(
                                  radius: 30,
                                  backgroundColor: Color(0xffeeeeee),
                                  child: CircleAvatar(
                                    backgroundImage:
                                    AssetImage('assets/images/google3.png'),
                                    backgroundColor: Color(0xffeeeeee),
                                    radius: 15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          Text(
                            'Don\'t have an account?',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 21.h,
                  ),
                  MyTextButton(function: () {
                    AppNavigator(context, true, RegisterScreen());
                  }, width: double.infinity, text: 'Sign up')
                ]),
              ));
        },
      ),
    );
  }
}
