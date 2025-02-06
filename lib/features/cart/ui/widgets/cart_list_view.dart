import 'package:ecommerce/core/constants/app_images.dart';
import 'package:ecommerce/features/cart/ui/widgets/empty_cart_list.dart';
import 'package:flutter/material.dart';
import 'cart_item.dart';

class CartListView extends StatelessWidget {
  const CartListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Visibility(
        visible: true,
        replacement: const EmptyCartList(),
        child: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index) => CartItem(
            image: Assets.imagesCartImage,
            category: 'Chairs',
            productName: 'Blush Luxe Chair',
            description:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
            price: '120.00',
            quantity: 2,
            onIncrementTap: () {},
            onDecrementTap: () {},
            onDismissed: () {},
          ),
        ),
      ),
    );
  }
}
