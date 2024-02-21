import 'package:dainsleif_journal/Utils/image.dart';
import 'package:dainsleif_journal/screen/widget/cache_image_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyLoader extends StatelessWidget {
  const MyLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(MyImage.paimonPrimi),
    );
  }
}
