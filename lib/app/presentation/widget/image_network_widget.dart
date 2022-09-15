import 'package:flutter/material.dart';

class ImageNetworkWidget extends StatelessWidget {
  const ImageNetworkWidget({Key? key, required this.path, required this.width, required this.height}) : super(key: key);

  final String path;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      path,
      loadingBuilder: (_, Widget child, ImageChunkEvent? loadingProgress) {
        if (loadingProgress == null) {
          return child;
        }
        return Center(
          child: CircularProgressIndicator(
            color: Colors.red,
            value: loadingProgress.expectedTotalBytes != null
                ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                : null,
          ),
        );
      },
      width: width,
      height: height,
      cacheWidth: width.toInt(),
      cacheHeight: height.toInt(),
    );
  }
}
