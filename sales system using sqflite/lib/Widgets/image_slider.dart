import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ImageSlider extends StatelessWidget {
  final int imageCount;
  final List<String> imagesPath;
  const ImageSlider(
      {required this.imageCount, required this.imagesPath, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(20),
      ),
      child: CarouselSlider.builder(
        itemCount: imageCount,
        itemBuilder: (context, index, realIndex) {
          return Container(
            color: Colors.white,
            child: Image.asset(imagesPath[index]),
          );
        },
        options: CarouselOptions(height: 300),
      ),
    );
  }
}
