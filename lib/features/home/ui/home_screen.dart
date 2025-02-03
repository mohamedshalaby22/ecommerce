import 'package:ecommerce/core/helpers/spacing.dart';
import 'package:ecommerce/features/home/ui/widgets/categories_section.dart';
import 'package:flutter/material.dart';
import 'widgets/home_appbar.dart';
import 'widgets/banner_slider.dart';
import 'widgets/new_arrival_section.dart';
import 'widgets/rooms_section.dart';
import 'widgets/select_location_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBar(),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(10),
              const SelectLocationCard(),
              verticalSpace(25),
              const BannerSlider(),
              verticalSpace(30),
              CategoriesSection(),
              verticalSpace(25),
              const NewArrivalsSection(),
              verticalSpace(15),
              const RoomsSection(),
            ],
          ),
        ),
      )),
    );
  }
}
