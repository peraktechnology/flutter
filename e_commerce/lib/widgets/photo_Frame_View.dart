
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PhotoFrameView extends StatelessWidget {
  final Widget child;
  final String url;
  final VoidCallback onImagePressed;
  const PhotoFrameView({Key? key,required this.child, required this.url, required this.onImagePressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        height:75,
        width: 75,
        decoration:BoxDecoration(
            border:Border.all(width:1.5,style:BorderStyle.solid,color:Colors.grey)

        ),
        child:url.isEmpty ? child:
        InkWell(
          onTap: onImagePressed,
          child: CachedNetworkImage(
            fit: BoxFit.cover,
            imageUrl:url,
            placeholder: (context, url) => Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        ),
      ),
    )
    ;
  }
}
