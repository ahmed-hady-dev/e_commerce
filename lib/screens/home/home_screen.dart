import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/screens/home/product_carousel.dart';
import 'package:e_commerce/widgets/section_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/category/category_bloc.dart';
import '../../blocs/product/product_bloc.dart';
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
          BlocBuilder<CategoryBloc, CategoryState>(
            builder: (context, state) {
              if (state is CategoryLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state is CategoryLoaded) {
                return CarouselSlider(
                  options: CarouselOptions(
                      aspectRatio: 1.5,
                      enlargeCenterPage: true,
                      viewportFraction: 0.9,
                      enlargeStrategy: CenterPageEnlargeStrategy.height),
                  items: state.categories
                      .map(
                        (category) => HeroCarouselCard(category: category),
                      )
                      .toList(),
                );
              } else {
                return Center(child: Text('Something went wrong.', style: Theme.of(context).textTheme.bodyText2));
              }
            },
          ),
          const SectionTitle(title: 'RECOMMENDED'),
          BlocBuilder<ProductBloc, ProductState>(
            builder: (context, state) {
              if (state is ProductLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state is ProductLoaded) {
                return ProductCarousel(
                  products: state.products.where((product) => product.isRecommended).toList(),
                );
              } else {
                return Center(child: Text('Something went wrong.', style: Theme.of(context).textTheme.bodyText2));
              }
            },
          ),
          const SectionTitle(title: 'MOST POPULAR'),
          BlocBuilder<ProductBloc, ProductState>(
            builder: (context, state) {
              if (state is ProductLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state is ProductLoaded) {
                return ProductCarousel(
                  products: state.products.where((product) => product.isPopular).toList(),
                );
              } else {
                return Center(child: Text('Something went wrong.', style: Theme.of(context).textTheme.bodyText2));
              }
            },
          )
          // ProductCarousel(
          //   products: Product.products.where((product) => product.isPopular).toList(),
          // ),
        ],
      ),
    );
  }
}
