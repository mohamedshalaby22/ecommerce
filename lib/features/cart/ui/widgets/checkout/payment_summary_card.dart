import 'package:ecommerce/core/helpers/spacing.dart';
import 'package:ecommerce/core/theming/colors.dart';
import 'package:ecommerce/core/theming/styles.dart';
import 'package:flutter/material.dart';

class PaymentSummaryCard extends StatelessWidget {
  const PaymentSummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Payment Summary', style: TextStyles.font16BlackBold),
        verticalSpace(10),
        Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey, width: 0.8),
          ),
          child: Column(
            children: [
              _buildPaymentSummaryRow(
                text: 'Subtotal',
                price: '120.00',
              ),
              _buildPaymentSummaryRow(
                  text: 'Discount', price: '-20.00', isGreenColor: true),
              _buildPaymentSummaryRow(
                text: 'Delivery fee',
                price: '10.20',
              ),
              _buildPaymentSummaryRow(
                text: 'Service fee',
                price: '10.20',
              ),
              _buildPaymentSummaryRow(
                  text: 'Total Amount',
                  price: '250.20',
                  isGreenColor: true,
                  isBlackColor: true,
                  isShowDivider: false),
            ],
          ),
        ),
        verticalSpace(25),
      ],
    );
  }

  Column _buildPaymentSummaryRow({
    required String text,
    required String price,
    bool isGreenColor = false,
    bool isBlackColor = false,
    bool isShowDivider = true,
  }) {
    return Column(
      children: [
        Row(
          children: [
            Text(text,
                style: TextStyles.font14GreyRegular.copyWith(
                    color: isBlackColor ? Colors.black : ColorsManager.grey,
                    fontSize: isBlackColor ? 16 : 14)),
            const Spacer(),
            Text('\$$price',
                style: TextStyles.font14BlackSemiBold.copyWith(
                    color:
                        isGreenColor ? ColorsManager.mainGreen : Colors.black)),
          ],
        ),
        if (isShowDivider)
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 5),
            child: Divider(
              thickness: 0.3,
            ),
          )
      ],
    );
  }
}
