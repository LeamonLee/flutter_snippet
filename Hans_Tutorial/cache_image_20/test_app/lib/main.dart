import 'package:flutter/material.dart';
import 'package:cache_image_20/main.dart';

void main() => runApp(MaterialApp(
      home: Scaffold(
        body: CacheImage("https://picsum.photos/id/966/200/300"),
      ),
    )
  );

