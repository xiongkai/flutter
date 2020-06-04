import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class BannerWidget extends StatelessWidget {
  List<String> _images = <String>[
    'images/banners/1.jpeg',
    'images/banners/2.jpeg',
    'images/banners/3.jpeg',
    'images/banners/4.jpeg',
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = width * 540.0 / 1080.0;
    return Container(
      width: width,
      height: height,
      child: Swiper(
        itemWidth: width,
        itemHeight: height,
        itemCount: _images.length,
        itemBuilder: (context, index) {
          return Container(
            child: Image.asset(
              _images[index],
              width: width,
              height: height,
              fit: BoxFit.fill,
            ),
          );
        },
        autoplay: true,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
