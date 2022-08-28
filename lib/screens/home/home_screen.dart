import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/model/category_model.dart';
import 'package:e_commerce/screens/home/product_carousel.dart';
import 'package:e_commerce/widgets/section_title.dart';
import 'package:flutter/material.dart';

import '../../model/product_model.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/custom_nav_bar.dart';
import '../../widgets/hero_carousel_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(text: 'Zero To Unicorn'),
      bottomNavigationBar: const CustomNavBar(),
      body: Column(
        children: [
          Container(
            child: CarouselSlider(
              options: CarouselOptions(
                  aspectRatio: 1.5,
                  enlargeCenterPage: true,
                  viewportFraction: 0.9,
                  enlargeStrategy: CenterPageEnlargeStrategy.height),
              items: Category.categories
                  .map(
                    (category) => HeroCarouselCard(category: category),
                  )
                  .toList(),
            ),
          ),
          const SectionTitle(title: 'RECOMMENDED'),
          ProductCarousel(products: Product.products.where((product) => product.isRecommended).toList()),
          const SectionTitle(title: 'MOST POPULAR'),
          ProductCarousel(products: Product.products.where((product) => product.isPopular).toList()),
        ],
      ),
    );
  }
}
