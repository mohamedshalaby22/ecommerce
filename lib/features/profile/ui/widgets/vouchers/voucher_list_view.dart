import 'package:flutter/material.dart';
import 'empty_voucher_list.dart';
import 'voucher_card.dart';

class VoucherListView extends StatelessWidget {
  const VoucherListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Visibility(
        visible: true,
        replacement: const EmptyVoucherList(),
        child: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index) => const VoucherCard(
            voucherName: 'voucher name',
            price: '500',
            description:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
          ),
        ),
      ),
    );
  }
}
