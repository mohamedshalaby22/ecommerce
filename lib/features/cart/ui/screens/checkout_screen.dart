import 'package:ecommerce/core/helpers/spacing.dart';
import 'package:ecommerce/core/widgets/secondary_appbar.dart';
import 'package:flutter/material.dart';
import '../../../../core/widgets/app_text_button.dart';
import '../widgets/checkout/payment_methods_section.dart';
import '../widgets/checkout/payment_summary_card.dart';
import '../widgets/checkout/payment_voucher_card.dart';
import '../widgets/checkout/select_location_card.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SecondaryAppBar(title: 'Checkout'),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                verticalSpace(10),
                const SelectLocationCard(),
                verticalSpace(15),
                PaymentMethodsSection(
                  onSelectPaymentMethod: (String selectedPaymentMethod) {},
                ),
                const PaymentVoucherCard(),
                verticalSpace(15),
                const PaymentSummaryCard(),
               
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0.0,
        color: Colors.transparent,
        child: AppTextButton(
            buttonText: 'Place Order',
            onPressed: () {
              // context.pushNamed(Routes.checkoutScreen);
            }),
      ),
    );
  }
}
