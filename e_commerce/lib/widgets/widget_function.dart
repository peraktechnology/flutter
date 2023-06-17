import 'package:flutter/material.dart';


//show dialog with input field-------------
showSingleInputDailog({
  required String title,
  String positive='ok',
  String negative='close',
required Function(String) onSubmit,
required  BuildContext context
}){
final txtController=TextEditingController();
showDialog(context: context, builder: (context)=>AlertDialog(
  title:Text(title),
  content:Padding(
    padding:EdgeInsets.all(20),
    child:TextField(
      controller: txtController,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText:'Enter $title',
      ),
    ),
  ),
  actions: [
    TextButton(onPressed: ()=>Navigator.pop(context), child:Text(negative)),
    TextButton(onPressed: (){
      if(txtController.text.isEmpty) return;
      Navigator.pop(context);
      onSubmit(txtController.text);

    }, child:Text(positive)),
  ],
));
}

//show custom dialog only-------------
showCustomDailog({
  required String title,
  String positive='ok',
  String negative='close',
 required String content,
  required VoidCallback onPressed,
  required  BuildContext context
}){

  showDialog(context: context, builder: (context)=>AlertDialog(
    title:Text(title),
    content:Text(content),
    actions: [
      TextButton(onPressed: ()=>Navigator.pop(context), child:Text(negative)),
      TextButton(onPressed: onPressed,child:Text(positive)),
    ],
  ));
}