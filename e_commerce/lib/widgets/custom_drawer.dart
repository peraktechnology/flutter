
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecom_firebase_user_07/auth/auth_service.dart';
import 'package:ecom_firebase_user_07/pages/cart_tems.dart';
import 'package:ecom_firebase_user_07/pages/launcher.dart';
import 'package:ecom_firebase_user_07/pages/order_page.dart';
import 'package:ecom_firebase_user_07/pages/user_profile_page.dart';
import 'package:ecom_firebase_user_07/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userProvider=Provider.of<UserProvider>(context);
    return Drawer(
      child:ListView(
        children: [
          Container(
            height:MediaQuery.of(context).size.height/3,
            color:Theme.of(context).primaryColor,
            child:  AuthService.currentUser!.isAnonymous?
            const Icon(Icons.person,size:80,color:Colors.white,):Column(
              mainAxisAlignment:MainAxisAlignment.center,
              children: [
                userProvider.userModel!.userPhotoUrl==null?
                Icon(Icons.person,size:80,color:Colors.white,):ClipRRect(
                  borderRadius:BorderRadius.circular(50),
                  child:
                  CachedNetworkImage(
                    height:80,
                    width: 80,
                    imageUrl:userProvider.userModel!.userPhotoUrl!,
                    placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  )
                ),
                Text(userProvider.userModel!.displayName??'',
                  style:TextStyle(color:Colors.white,fontSize:20),)
              ],
            )
          ),
          if(!AuthService.currentUser!.isAnonymous)  ListTile(
            onTap:(){
              Navigator.pop(context);
              Navigator.pushNamed(context, UserProfile.routeName);
            },
            leading:const Icon(Icons.person),
            title:const  Text('My Profile'),
          ),
          if(!AuthService.currentUser!.isAnonymous)  ListTile(
            onTap:(){
              Navigator.pop(context);
              Navigator.pushNamed(context, CartItems.routeName);
            },
            leading:const Icon(Icons.shopping_cart),
            title: const Text('My Cart'),
          ),
          if(!AuthService.currentUser!.isAnonymous)   ListTile(
            onTap:(){
              Navigator.pop(context);
              Navigator.pushNamed(context, OrderPage.routeName);
            },
            leading: const Icon(Icons.monetization_on),
            title: const Text('My Orders'),
          ),
          ListTile(
            onTap: (){
              AuthService.logout().then((value) =>
                  Navigator.pushReplacementNamed(
                      context, Launcher.routeName));
            },
            leading:const Icon(Icons.logout),
            title: const Text('Logout'),
          ),

        ],
      ),
    );
  }
}
