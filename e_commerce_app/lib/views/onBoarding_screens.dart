import 'package:e_commerce_app1/components/reusable_button.dart';
import 'package:e_commerce_app1/src/app_colors.dart';
import 'package:e_commerce_app1/utils/app_navigator.dart';
import 'package:e_commerce_app1/views/register_Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final int _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 3.0),
      height: 7.0.h,
      width: isActive ? 7.w : 7.0.w,
      decoration: BoxDecoration(
          color: isActive ? AppColors.KPrimaryColor : Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          border: Border.all(
            color: Colors.grey,
          )
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.1],
              colors: [
                Color(0xffFFFFFF),
              ],
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: 580.h,
                  child: PageView(
                    physics: const ClampingScrollPhysics(),
                    controller: _pageController,
                    onPageChanged: (int page) {
                      setState(() {
                        _currentPage = page;
                      });
                    },
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 100.0,right: 20,left: 20,),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Center(
                              child: Container(
                                height: 220.h,
                                width: double.infinity,
                                child: Image(
                                  fit: BoxFit.fill,
                                  image: AssetImage('assets/images/onboarding1.png'),
                                  height: 170.h,
                                  width:300.w,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 70.h,
                            ),
                            const Text(
                              'Browse the menu \n and order directly from \n the application',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black, fontSize: 25),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 100.0,right: 20,left: 20,),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Center(
                              child: Container(
                                height: 220.h,
                                child: Image(
                                  fit: BoxFit.fill,
                                  image: AssetImage('assets/images/onboarding2.png'),
                                  height: 170.h,
                                  width:400.w,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 70.h,
                            ),
                            const Text(
                              'your order will be \n immediately collected and \n send by our courier',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black, fontSize: 25),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 100.0,right: 20,left: 20,),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Center(
                              child: Container(
                                height: 220.h,
                                width: 270.w,
                                child: Image(
                                  fit: BoxFit.fill,
                                  image: AssetImage('assets/images/onboarding3.png'),
                                  height: 200.h,
                                  width:400.w,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 70.h,
                            ),
                            const Text(
                              'Pick up delivery \n at your door and enjoy \n groceries',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black, fontSize: 25),
                            ),
                            SizedBox(
                              height: 40.h,
                            ),
                            MyTextButton(
                                function: (){
                                  AppNavigator(context, true, RegisterScreen());
                                },
                                width: double.infinity, text: 'Get start')
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buildPageIndicator(),
                ),
                _currentPage != _numPages - 1
                    ? Expanded(
                  child: Align(
                    alignment: FractionalOffset.bottomRight,
                  ),
                )
                    : const Text(''),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
