
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecom_firebase_user_07/models/notification_model.dart';
import 'package:ecom_firebase_user_07/models/user_model.dart';
import 'package:ecom_firebase_user_07/pages/launcher.dart';
import 'package:ecom_firebase_user_07/providers/notification_provider.dart';
import 'package:ecom_firebase_user_07/providers/user_provider.dart';
import 'package:ecom_firebase_user_07/utils/constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import '../auth/auth_service.dart';
import '../utils/helper_functions.dart';

class LoginPage extends StatefulWidget {
  static const String routeName='/login';
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String _errMsg = '';
  late UserProvider provider;
  late NotificationProvider notificationProvider;


  @override
  void initState() {
    _passwordController.text = '123456';
    super.initState();
  }
  @override
  void didChangeDependencies() {
    provider=Provider.of<UserProvider>(context,listen: false);
    notificationProvider=Provider.of<NotificationProvider>(context,listen:false);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(16),
            shrinkWrap: true,
            children: [
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Email Address',
                  prefixIcon: Icon(Icons.email),
                  filled: true,
                ),
                validator: (value) {
                  if(value == null || value.isEmpty) {
                    return 'This field must not be empty';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 5,
              ),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.lock),
                  filled: true,
                ),
                validator: (value) {
                  if(value == null || value.isEmpty) {
                    return 'This field must not be empty';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: (){
                  _authenticate(true);
                },
                child: const Text('Login'),
              ),
              SizedBox(height: 5,),
              TextButton.icon(onPressed:(){
                _signinWithGoogle();
              }, label:Text('Login with Google'), icon:Icon(Icons.g_mobiledata_rounded),),
              Row(
                children: [

                const   Text('New User?'),
                  TextButton(onPressed: (){
                    _authenticate(false);
                  }, child: const Text('Register')),


                ],
              ),
              const SizedBox(
                height: 5,
              ),
              OutlinedButton(onPressed: () async{
                EasyLoading.show(status: 'Please wait');
                await AuthService.loginAsGuest();
                EasyLoading.dismiss();
               if(mounted) Navigator.pushNamed(context,Launcher.routeName);

              }, child:const  Text('Login as Guest')),
              const SizedBox(
                height: 10,
              ),
              Text(_errMsg, style: const TextStyle(fontSize: 18, color: Colors.red),),
            ],
          ),
        ),
      ),
    );
  }

  void _authenticate(bool tag) async{
    if(_formKey.currentState!.validate()){
      UserCredential credential;
      EasyLoading.show(status: 'Please wait', dismissOnTap: false);
      final email = _emailController.text;
      final password = _passwordController.text;
      try {
        if(tag){
           credential = await AuthService.login(email, password);
          EasyLoading.dismiss();
        }else{
          if(AuthService.currentUser!=null){
            final credential = EmailAuthProvider.credential(email: email, password: password);
            await convertAnonymousUserIntoRealAccount(credential);
          }else{
            credential=await AuthService.register(email, password);
            final user=UserModel(
              userId:credential.user!.uid,
              email: credential.user!.email!,
              userCreationTime: Timestamp.fromDate(credential.user!.metadata!.creationTime!),
            );
            await provider.addUser(user);
            final notification=NotificationModel(
              notificationId: DateTime.now().millisecondsSinceEpoch.toString(),
              type: NotificationType.user,
              message:'You have new user  #${user.email} ',
              userModel:user,
            );
            await notificationProvider.addNotification(notification);
          }
        }
        EasyLoading.dismiss();
      if(mounted) Navigator.pushReplacementNamed(context, Launcher.routeName);

      } on FirebaseAuthException catch (error) {
        EasyLoading.dismiss();
        setState(() {
          _errMsg = error.message!;
        });
      }
    }
    }

  void _signinWithGoogle() async{
    try{
      EasyLoading.show(status: 'Redirecting..');
      final credential=await AuthService.signInWithGoogle();
      final userExists=await provider.doesUserExists(credential.user!.uid);
      if(!userExists){
        final user=UserModel(
          userId:credential.user!.uid,
          email: credential.user!.email!,
          phone: credential.user!.phoneNumber,
          displayName: credential.user!.displayName,
          userPhotoUrl: credential.user!.photoURL,
          userCreationTime: Timestamp.fromDate(DateTime.now()),
        );
        await provider.addUser(user);
        final notification=NotificationModel(
            notificationId: DateTime.now().millisecondsSinceEpoch.toString(),
            type: NotificationType.user,
            message:'You have new user  #${user.email} ',
            userModel:user,
        );
        await notificationProvider.addNotification(notification);
        EasyLoading.dismiss();
      }
      if(mounted){
        EasyLoading.dismiss();
        Navigator.pushReplacementNamed(context, Launcher.routeName);
      }
    }catch(error){
      EasyLoading.dismiss();
      rethrow;
    }
  }

  Future<void> convertAnonymousUserIntoRealAccount(
      AuthCredential credential) async {
    try {
      final userCredential = await FirebaseAuth.instance.currentUser
          ?.linkWithCredential(credential);
      if (userCredential!.user != null) {
        final userModel = UserModel(
          userId: AuthService.currentUser!.uid,
          email: AuthService.currentUser!.email!,
          userCreationTime: Timestamp.fromDate(
              AuthService.currentUser!.metadata.creationTime!),
        );
        provider.addUser(userModel).then((value) {
          EasyLoading.dismiss();
        }).catchError((error) {
          EasyLoading.dismiss();
          showMsg(context, 'could not save user info');
        });

      }
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "provider-already-linked":
          print("The provider has already been linked to the user.");
          break;
        case "invalid-credential":
          print("The provider's credential is not valid.");
          break;
        case "credential-already-in-use":
          print("The account corresponding to the credential already exists, "
              "or is already linked to a Firebase User.");
          break;
      // See the API reference for the full list of error codes.
        default:
          print("Unknown error.");
      }
    }
  }

}
