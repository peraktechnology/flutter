import 'package:e_commerce_app1/blocs/auth_cubits/register_cubit/register_cubit.dart';
import 'package:e_commerce_app1/components/my_text_formField.dart';
import 'package:e_commerce_app1/components/reusable_button.dart';
import 'package:e_commerce_app1/utils/app_navigator.dart';
import 'package:e_commerce_app1/views/home_screen.dart';
import 'package:e_commerce_app1/views/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is RegisterSuccessState) {
            AppNavigator(context, true, LoginScreen());
          }
        },
        builder: (context, state) {
          var cubit = RegisterCubit.get(context);
          return Scaffold(
              body: SingleChildScrollView(
            child: Column(children: [
              Center(
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 40.0, left: 20, right: 20),
                  child: Column(
                    children: [
                      Image(image: AssetImage('assets/images/logo.png')),
                      SizedBox(
                        height: 20.h,
                      ),
                      const Text(
                        'Welcome to Portatile',
                        style: TextStyle(
                            color: Color(0xff214eff),
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 7.h,
                      ),
                      const Text(
                        'Please sign up to join us',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          // fontWeight: FontWeight.bold
                        ),
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      MyTextFormField(
                        name: 'Full name',
                        controller: cubit.fullNameController,
                        isPassword: false,
                        preIcon: Icon(Icons.person),
                        type: TextInputType.name,
                        focusNode: cubit.fullNameNode,
                        function: (_) {
                          FocusScope.of(context).requestFocus(cubit.emailNode);
                        },
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
                          FocusScope.of(context)
                              .requestFocus(cubit.passwordNode);
                        },
                      ),
                      SizedBox(
                        height: 20.h,
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
                            onPressed: () => setState(() => cubit
                                .isPasswordVisible = !cubit.isPasswordVisible)),
                        focusNode: cubit.passwordNode,
                        function: (_) {
                          FocusScope.of(context).requestFocus();
                        },
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      MyTextButton(
                          function: () {
                            cubit.register();
                          },
                          width: double.infinity,
                          text: 'Continue'),
                      SizedBox(
                        height: 15.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              cubit.signInWithFacebook();
                              AppNavigator(
                                  context,
                                  true,
                                  HomeScreen(
                                    registerCubit: RegisterCubit.get(context),
                                  ));
                            },
                            child: CircleAvatar(
                              radius: 30,
                              backgroundColor: Color(0xffeeeeee),
                              child: CircleAvatar(
                                backgroundImage:
                                    AssetImage('assets/images/facebook1.png'),
                                backgroundColor: Color(0xffeeeeee),
                                radius: 15,
                              ),
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
                            onTap: () async {
                              await cubit.signInWithGoogle();
                              AppNavigator(
                                  context,
                                  true,
                                  HomeScreen(
                                    registerCubit: RegisterCubit.get(context),
                                  ));
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
                        height: 11.4.h,
                      ),
                      Text(
                        'Already have an account?',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 7.h,
              ),
              MyTextButton(
                  function: () {
                    AppNavigator(context, true, LoginScreen());
                  },
                  width: double.infinity,
                  text: 'Login')
            ]),
          ));
        },
      ),
    );
  }
}
