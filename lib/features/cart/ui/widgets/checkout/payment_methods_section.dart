import 'package:ecommerce/core/helpers/spacing.dart';
import 'package:ecommerce/core/theming/styles.dart';
import 'package:ecommerce/features/cart/ui/widgets/checkout/payment_method_card.dart';
import 'package:flutter/material.dart';
import '../../../../../core/constants/app_images.dart';

class PaymentMethodsSection extends StatefulWidget {
  const PaymentMethodsSection({super.key, required this.onSelectPaymentMethod});
  final Function(String selectedPaymentMethod) onSelectPaymentMethod;

  @override
  State<PaymentMethodsSection> createState() => _PaymentMethodsSectionState();
}

class _PaymentMethodsSectionState extends State<PaymentMethodsSection> {
  String _selectedPaymentMethod = 'paypal';

  void _updateSelectedPaymentMethod(String paymentMethod) {
    setState(() {
      _selectedPaymentMethod = paymentMethod;
      widget.onSelectPaymentMethod(paymentMethod);
    });
  }

 
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Payment Methods',
          style: TextStyles.font16BlackBold,
        ),
        verticalSpace(15),
        PaymentMethodCard(
          paymentMethod: 'PayPal',
          image: Assets.svgsPaypal,
          isSelected: _selectedPaymentMethod == 'paypal',
          onTap: () => _updateSelectedPaymentMethod('paypal'),
        ),
        PaymentMethodCard(
          paymentMethod: 'Klarna',
          image: Assets.svgsKlarna,
          isSelected: _selectedPaymentMethod == 'klarna',
          onTap: () => _updateSelectedPaymentMethod('klarna'),
        ),
        PaymentMethodCard(
          paymentMethod: 'Credit Card',
          image: Assets.svgsCard,
          isSelected: _selectedPaymentMethod == 'card',
          onTap: () => _updateSelectedPaymentMethod('card'),
        ),
      ],
    );
  }
}
