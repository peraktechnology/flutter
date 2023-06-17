
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecom_firebase_user_07/models/address_model.dart';
import 'package:ecom_firebase_user_07/models/user_model.dart';
import 'package:ecom_firebase_user_07/pages/otp_verification.dart';
import 'package:ecom_firebase_user_07/utils/helper_functions.dart';
import 'package:ecom_firebase_user_07/widgets/widget_function.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/user_provider.dart';

class UserProfile extends StatelessWidget {
  static const String routeName='/user_profile';
  const UserProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userProvider=Provider.of<UserProvider>(context);
    return Scaffold(
      appBar:AppBar(
        elevation:0,
        title:Text('My Profile'),
      ),
      body: userProvider.userModel == null
          ? const Center(
        child: Text('Failed to load user data'),
      )
          : ListView(
        children: [
          Container(
            height:MediaQuery.of(context).size.height/5,
            width:double.infinity,
            color:Colors.blue,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(

                children: [
                  Card(
                      child:userProvider.userModel!.userPhotoUrl==null?
                     const Icon(Icons.person,size:80,):
                      CachedNetworkImage(
                        height:80,
                        width: 80,
                        imageUrl:userProvider.userModel!.userPhotoUrl!,
                        placeholder: (context, url) =>const Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) => const Icon(Icons.error),
                      )
                  ),

                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(userProvider.userModel!.displayName==null?
                      'No name to Display':userProvider.userModel!.displayName!,
                        style:const TextStyle(color:Colors.white,fontSize:15),),
                      Text(userProvider.userModel!.email,
                        style:const TextStyle(color:Colors.white,fontSize:20),),
                    ],
                  ),


                ],
              ),
            ),
          ),
          ListTile(
            leading:Icon(Icons.phone),
            title:Text(userProvider.userModel!.phone ?? 'Not set Yet'),
            trailing: IconButton(
              onPressed: () {
                showSingleInputDailog(title: 'Update Phone', onSubmit: (value){
                  if(value.length>10 && isNumeric(value)){
                    Navigator.pushNamed(context, OtpVerificationPage.routeName,arguments:value);
                  }else{
                    showMsg(context,'Enter 11 digit valid number');
                  }

                }, context: context);
              },
              icon: const Icon(Icons.edit),
            ),
          ),
          ListTile(
            leading:Icon(Icons.person),
            title:Text(userProvider.userModel!.gender ?? 'Not set Yet'),
            subtitle:Text('Gender'),
            trailing: IconButton(
              onPressed: () {
                showSingleInputDailog(title: 'Update Gender', onSubmit: (value){
                  userProvider.userProfileUpdate('$userFieldGender', value);
                }, context: context);
              },
              icon: const Icon(Icons.edit),
            ),
          ),
          ListTile(
            leading:const Icon(Icons.location_city),
            title:Text(userProvider.userModel!.addressModel?.addressLine1 ?? 'Not set Yet'),
            subtitle:const Text('Address Line 1'),
            trailing: IconButton(
              onPressed: () {
                showSingleInputDailog(title: 'Update Address', onSubmit: (value){
                  userProvider.userProfileUpdate('$userFieldAddressModel.$addressFieldAddressLine1', value);
                }, context: context);
              },
              icon: const Icon(Icons.edit),
            ),
          ),
          ListTile(
            leading:const Icon(Icons.location_city),
            title:Text(userProvider.userModel!.addressModel?.city ?? 'Not set Yet'),
            subtitle:const Text('City'),
            trailing: IconButton(
              onPressed: () {
                showSingleInputDailog(title: 'Update City', onSubmit: (value){
                  userProvider.userProfileUpdate('$userFieldAddressModel.$addressFieldCity', value);
                }, context: context);
              },
              icon: const Icon(Icons.edit),
            ),
          ),
          ListTile(
            leading:const Icon(Icons.location_city),
            title:Text(userProvider.userModel!.addressModel?.zipcode ?? 'Not set Yet'),
            subtitle:const Text('Zip Code'),
            trailing: IconButton(
              onPressed: () {
                showSingleInputDailog(title: 'Update Address', onSubmit: (value){
                  userProvider.userProfileUpdate('$userFieldAddressModel.$addressFieldZipcode', value);
                }, context: context);
              },
              icon: const Icon(Icons.edit),
            ),
          ),
        ],
      ),
    );
  }
}
