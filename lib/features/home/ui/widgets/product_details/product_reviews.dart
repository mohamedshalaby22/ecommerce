import 'package:ecommerce/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/theming/styles.dart';
import 'product_review_card.dart';

class ProductReviews extends StatelessWidget {
  const ProductReviews({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildReviewHeader(),
        verticalSpace(15),
        SizedBox(
          height: 200,
          child: FractionallySizedBox(
            widthFactor: 1.1,
            child: ListView.builder(
              itemCount: 3,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => const ProductReviewCard(
                reviewerName: 'Jannis Schmitt',
                reviewText: '“ Lorem ipsum dolor sit amet consectetur. Semper elementum sit egestas nulla semper. Venenatis tortor hendrerit.”',
              ),
            ),
          ),
        ),
        verticalSpace(50),
      ],
    );
  }

  Row _buildReviewHeader() {
    return Row(
      children: [
        Text(
          'Reviews',
          style: TextStyles.font16BlackBold,
        ),
        const Spacer(),
        GestureDetector(
          onTap: () {},
          child: Row(
            children: [
              Text(
                'All Reviews',
                style: TextStyles.font12MainGreenRegular,
              ),
              horizontalSpace(5),
              const HugeIcon(
                size: 22,
                icon: HugeIcons.strokeRoundedArrowRight01,
                color: ColorsManager.mainGreen,
              )
            ],
          ),
        ),
      ],
    );
  }
}
