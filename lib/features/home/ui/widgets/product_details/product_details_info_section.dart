import 'package:ecommerce/core/constants/app_images.dart';
import 'package:ecommerce/core/helpers/spacing.dart';
import 'package:ecommerce/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'product_availability_card.dart';
import 'product_color_selector.dart';
import 'product_dimensions.dart';
import 'product_reviews.dart';

class ProductDetailsInfoSection extends StatelessWidget {
  const ProductDetailsInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildProductOverview(),
          verticalSpace(10),
          const ProductColorSelector(),
          verticalSpace(10),
          Text(
            'Lorem ipsum dolor sit amet consectetur. Nunc eget tortor sagittis sodales. Faucibus cursus sed at in. Lacus massa purus sit magna auctor. Turpis neque enim et morbi nunc aliquam. Amet justo id arcu in nec. Viverra varius congue malesuada penatibus lectus. Cursus cras adipiscing dui tellus sodales maecenas. In morbi ut et faucibus sem. Dis quisque eu adipiscing morbi enim donec. Eget.',
            style: TextStyles.font12GreyRegular,
          ),
          verticalSpace(15),
          const ProductAvailabilityCard(isAvailable: true),
          verticalSpace(20),
          const ProductDimensions(),
          verticalSpace(20),
          const ProductReviews(),
        ],
      ),
    );
  }

  Widget _buildProductOverview() {
    return Column(
      children: [
        Center(
          child: Image.asset(
            Assets.imagesArrivalChair,
            width: double.infinity,
            fit: BoxFit.contain,
          ),
        ),
        verticalSpace(15),
        Row(
          children: [
            Expanded(
              child: Text(
                'Blush luxe chair',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyles.font18BlackSemiBold,
              ),
            ),
            horizontalSpace(15),
            Text(
              '\$200.00',
              style: TextStyles.font20BlackBold,
            ),
          ],
        ),
      ],
    );
  }
}
