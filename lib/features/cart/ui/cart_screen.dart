import 'package:ecommerce/core/helpers/spacing.dart';
import 'package:ecommerce/core/widgets/main_appbar.dart';
import 'package:flutter/material.dart';

import 'widgets/cart_list_view.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(title: 'Cart'),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            verticalSpace(10),
            const CartListView(),
          ],
        ),
      )),
    );
  }
}
