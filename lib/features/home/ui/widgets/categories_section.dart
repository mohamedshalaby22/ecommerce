import 'package:ecommerce/core/constants/app_images.dart';
import 'package:ecommerce/core/helpers/spacing.dart';
import 'package:ecommerce/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CategoriesSection extends StatelessWidget {
  CategoriesSection({super.key});
  final List<String> _catergoryImages = [
    Assets.svgsSofa,
    Assets.svgsBed,
    Assets.svgsDining,
    Assets.svgsChair,
    Assets.svgsTvTable,
    Assets.svgsCupboard,
    Assets.svgsLamb,
    Assets.svgsVase,
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Shop by categories',
          style: TextStyles.font16BlackBold,
        ),
        verticalSpace(15),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 8,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
              childAspectRatio: 1.1),
          itemBuilder: (context, index) {
            return _buildCategoryCard(index);
          },
        ),
      ],
    );
  }

  Widget _buildCategoryCard(int index) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0x20898121),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
            child: SvgPicture.asset(
          _catergoryImages[index],
        
          width: 36,
        )),
      ),
    );
  }
}
