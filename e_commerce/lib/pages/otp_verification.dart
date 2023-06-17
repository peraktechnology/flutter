
import 'package:ecom_firebase_user_07/auth/auth_service.dart';
import 'package:ecom_firebase_user_07/models/user_model.dart';
import 'package:ecom_firebase_user_07/utils/constant.dart';
import 'package:ecom_firebase_user_07/utils/helper_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

import '../providers/user_provider.dart';

class OtpVerificationPage extends StatefulWidget {
  static const String routeName='/otp_verification';
  const OtpVerificationPage({Key? key}) : super(key: key);

  @override
  State<OtpVerificationPage> createState() => _OtpVerificationPageState();
}

class _OtpVerificationPageState extends State<OtpVerificationPage> {
  late String phone;
  TextEditingController textEditingController = TextEditingController();
  bool isFirst = true;
  String incomingOtp = '';
  String vid = '';
  @override
  void didChangeDependencies() {
    if (isFirst) {
      phone=ModalRoute.of(context)!.settings.arguments as String;
      _sendVerificationCode();
      isFirst = false;
    }

    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar:AppBar(
        title: const Text('OTP Verification'),
      ),
      body:ListView(
        shrinkWrap: true,
        padding: EdgeInsets.all(12),
        children: [
         Text('Verify Phone Number',style:Theme.of(context).textTheme.headline6,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              phone,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          const Text(
            'An OTP code is sent to your mobile number. Enter the OTP Code below',
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: PinCodeTextField(
              appContext: context,
              pastedTextStyle: TextStyle(
                color: Colors.green.shade600,
                fontWeight: FontWeight.bold,
              ),
              length: 6,
              obscureText: false,
              obscuringCharacter: '*',
              /*obscuringWidget: const FlutterLogo(
                  size: 24,
                ),*/
              blinkWhenObscuring: true,
              animationType: AnimationType.fade,
              validator: (v) {
                /*if (v!.length < 3) {
                    return "I'm from validator";
                  } else {
                    return null;
                  }*/
                return null;
              },
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(5),
                fieldHeight: 50,
                fieldWidth: 40,
                activeFillColor: Colors.white,
              ),
              cursorColor: Colors.black,
              animationDuration: const Duration(milliseconds: 300),
              enableActiveFill: true,
              //errorAnimationController: errorController,
              controller: textEditingController,
              keyboardType: TextInputType.number,
              boxShadows: const [
                BoxShadow(
                  offset: Offset(0, 1),
                  color: Colors.black12,
                  blurRadius: 10,
                )
              ],
              onCompleted: (v) {
                incomingOtp = v;
                debugPrint("Completed");
              },
              // onTap: () {
              //   print("Pressed");
              // },
              onChanged: (value) {
                // debugPrint(value);
                // setState(() {});
              },
              beforeTextPaste: (text) {
                debugPrint("Allowing to paste $text");

                //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                //but you can show anything you want here, like your pop up saying wrong paste format or etc
                return true;
              },
            ),
          ),
          TextButton(
            onPressed: () {
              _verify();
            },
            child: const Text('SEND'),
          )
        ],
      ),
    );
  }
  void _sendVerificationCode() async {
    EasyLoading.show();
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber:  countryCode.BD+phone,
      verificationCompleted: (PhoneAuthCredential credential) {
        print('Verification Completed');
      },
      verificationFailed: (FirebaseAuthException e) {
        print('Verification Failed');
      },
      codeSent: (String verificationId, int? resendToken) {
        vid = verificationId;
        showMsg(context, 'Code sent');
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
    EasyLoading.dismiss();
  }

  void _verify() {
    EasyLoading.show(status: 'Verifying...');
    PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: vid, smsCode: incomingOtp);
    AuthService.currentUser!.linkWithCredential(credential).then((value) async {
      await Provider.of<UserProvider>(context, listen: false)
          .userProfileUpdate(userFieldPhone, phone);
      EasyLoading.dismiss();
      Navigator.pop(context);
    }).catchError((error) {
      EasyLoading.dismiss();
      showMsg(context, error.toString());
      print(error.toString());
    });
    if (incomingOtp == textEditingController.text) {
      print('OTP MATCHED');
    } else {
      print('OTP MISMATCHED');
    }
  }
  @override
  void dispose() {
   textEditingController.dispose();
    super.dispose();
  }
}
