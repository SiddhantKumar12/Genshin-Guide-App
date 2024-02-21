import 'package:cached_network_image/cached_network_image.dart';
import 'package:dainsleif_journal/screen/widget/error.dart';
import 'package:dainsleif_journal/screen/widget/loader.dart';
import 'package:flutter/cupertino.dart';

class CacheImageWidget extends StatelessWidget {
  final String imageUrl;
  final double? height;
  final double? width;
  final BoxFit? fit;

  const CacheImageWidget({super.key, required this.imageUrl, this.height, this.width, this.fit});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      height: height,
      width: width,
      imageUrl: imageUrl,
      fit: fit ?? BoxFit.cover,
      placeholder: (context, url) => MyLoader(),
      errorWidget: (context, url, error) => MyError(),
    );
  }
}
