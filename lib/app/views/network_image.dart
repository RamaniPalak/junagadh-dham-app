
import 'dart:io';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:junagadh_temple/app/utils/constants.dart';

class CustomNetWorkImage extends StatelessWidget {

  final String url;
  final String? assetName;
  final BoxFit? fit;

  const CustomNetWorkImage({Key? key, required this.url, this.assetName, this.fit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    try {

      final image = NetworkImage(url);
      
      return ExtendedImage.network(
        url,
        fit: fit,
        cache: true,
        loadStateChanged: (state) {
          switch(state.extendedImageLoadState){
            case LoadState.loading:
              // TODO: Handle this case.
              if(Platform.isAndroid){
                return Center(child: SizedBox(height: 30,width: 30,child: CircularProgressIndicator(strokeWidth: 3,color: kSecondary,)),);
              }else{
                return const Center(child: SizedBox(height: 30,width: 30,child: CupertinoActivityIndicator(animating: true,)),);
              }
              break;
            case LoadState.completed:
              // TODO: Handle this case.
              break;
            case LoadState.failed:
              // TODO: Handle this case.
              return const Center(child: Text('No Image Found',textAlign: TextAlign.center,),);
              break;
          }
        },
        //cancelToken: cancellationToken,
      );
      
      return FadeInImage(
        fit: fit ?? BoxFit.cover,
        placeholder: AssetImage(assetName ?? "assets/images/placeholder-img.png",),
        image: image,
        imageErrorBuilder: (context, error, stackTrace) {

          return Image.asset(
            assetName ?? "assets/images/placeholder-img.png",
            fit: fit ?? BoxFit.cover,
          );
        },
        placeholderErrorBuilder: (context, error, stackTrace) {

          return Image.asset(
            assetName ?? "assets/images/placeholder-img.png",
            fit: fit ?? BoxFit.cover,
          );
        },
      );
    } catch (e) {
      return Container();
    }

  }
}
