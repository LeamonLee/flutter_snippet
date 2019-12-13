import 'package:flutter/material.dart';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';


class CacheImage extends StatelessWidget {

  final String strUrl;
  CacheImage(this.strUrl);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getImageWidget(strUrl),
      builder: (context, AsyncSnapshot<Widget> snap){
        if(!snap.hasData) return Container();

        return snap.data;
      },
    );
  }

  Future<Widget> getImageWidget(String _strUrl) async {
    Directory dir = await getApplicationDocumentsDirectory();
    String strPath = dir.path;
    String strCachePath = "$strPath/cache_images";
    String strFileName = _strUrl.split('/').last;
    
    File imageFile = File("$strCachePath/$strFileName");
    
    print("strCachePath: $strCachePath");
    print("imageFile: $imageFile");

    // If strCachePath doesn't exist, then create it.
    Directory(strCachePath).createSync(recursive: true);

    // Check if the image exists, if yes, use the local file. If not, download it from the internet.
    if(await imageFile.exists()){
      return Image.file(imageFile);
    }

    downloadImage(_strUrl, imageFile.path);
    return Image.network(_strUrl);

  }

  Future<Response> downloadImage(String url, String fileSavePath){
    return HttpHelper().dio.download(url, fileSavePath);
  }
}

class HttpHelper {
  
  static HttpHelper _object = HttpHelper._();

  Dio dio = Dio();

  factory HttpHelper(){
    return _object;
  }

  HttpHelper._();
}