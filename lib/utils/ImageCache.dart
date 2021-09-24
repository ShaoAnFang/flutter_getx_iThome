import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageCached extends StatefulWidget {
  const ImageCached(
      {Key? key, required this.imageUrl, this.placeholderPath = ''})
      : super(key: key);

  final String imageUrl;
  final String placeholderPath;

  @override
  _ImageCachedState createState() => _ImageCachedState();
}

class _ImageCachedState extends State<ImageCached> {
  String placeholderPath = '';
  static const imagUrlPrefix = 'https://www.solivatech.com';
  String imageUrl = '';

  @override
  void initState() {
    super.initState();
    placeholderPath = widget.placeholderPath;
    imageUrl = imagUrlPrefix + widget.imageUrl;
  }

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      placeholder: (context, url) {
        return (placeholderPath.isEmpty)
            ? Icon(Icons.photo_library)
            : Image.asset(placeholderPath, fit: BoxFit.contain);
      },
      imageUrl: imageUrl,
      imageBuilder: (context, imageProvider) {
        return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.contain,
            ),
          ),
        );
      },
      errorWidget: (context, url, error) {
        return (placeholderPath.isEmpty)
            ? Icon(Icons.image_not_supported_outlined)
            : Image.asset(placeholderPath, fit: BoxFit.contain);
      },
    );
  }
}
