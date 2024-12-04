import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselDemo extends StatelessWidget {
  final List<Widget>? items;
  CarouselDemo(this.items, {super.key});
  CarouselController buttonCarouselController = CarouselController();

  @override
  Widget build(BuildContext context) => Column(children: <Widget>[
        CarouselSlider(
          items: items,
          // carouselController: buttonCarouselController,
          options: CarouselOptions(
            // autoPlay: false,
            enlargeCenterPage: true,
            viewportFraction: 1,
            aspectRatio: 1.6,
            initialPage: 2,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 5),
            autoPlayAnimationDuration: const Duration(milliseconds: 1000),
            autoPlayCurve: Curves.fastOutSlowIn,
          ),
        ),
        // TextButton(
        //   onPressed: () => buttonCarouselController.nextPage(
        //       duration: Duration(milliseconds: 300), curve: Curves.linear),
        //   child: Text('→'),
        // )
      ]);
}

class CarouselForProduct extends StatelessWidget {
  final List<Widget>? items;
  CarouselForProduct(this.items, {super.key});
  CarouselController buttonCarouselController = CarouselController();

  @override
  Widget build(BuildContext context) => Column(children: <Widget>[
        CarouselSlider(
          items: items,
          // carouselController: buttonCarouselController,
          options: CarouselOptions(
            // autoPlay: false,
            enlargeCenterPage: true,
            viewportFraction: 1,
            aspectRatio: 1.0,
            initialPage: 2,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
          ),
        ),
        // TextButton(
        //   onPressed: () => buttonCarouselController.nextPage(
        //       duration: Duration(milliseconds: 300), curve: Curves.linear),
        //   child: Text('→'),
        // )
      ]);
}
