import 'package:ecommerce/core/widgets/app_text_button.dart';
import 'package:flutter/material.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/styles.dart';
import '../../../../../core/widgets/app_text_form_field.dart';

class EditSavedAddressContent extends StatelessWidget {
  EditSavedAddressContent({super.key});
  final TextEditingController firstNameController =
      TextEditingController(text: 'Frank');
  final TextEditingController lastNameController =
      TextEditingController(text: 'Muñoz');
  final TextEditingController streetNameController =
      TextEditingController(text: 'Calle 1');
  final TextEditingController houseNumberController =
      TextEditingController(text: '12B');
  final TextEditingController zipCodeController =
      TextEditingController(text: '123456');
  final TextEditingController cityController =
      TextEditingController(text: 'frankfurt');
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpace(10),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('First address Name',
                        style: TextStyles.font14GreyMedium),
                    verticalSpace(10),
                    AppTextFormField(
                      controller: firstNameController,
                      hintText: 'First name',
                      validator: (value) {},
                    ),
                  ],
                ),
              ),
              horizontalSpace(15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Last address name',
                        style: TextStyles.font14GreyMedium),
                    verticalSpace(10),
                    AppTextFormField(
                      controller: lastNameController,
                      hintText: 'Last name',
                      validator: (value) {},
                    ),
                  ],
                ),
              )
            ],
          ),
          verticalSpace(15),
          Text('Str. name', style: TextStyles.font14GreyMedium),
          verticalSpace(10),
          AppTextFormField(
            controller: streetNameController,
            hintText: 'Elm Street',
            validator: (value) {},
          ),
          verticalSpace(15),
          Text('House number', style: TextStyles.font14GreyMedium),
          verticalSpace(10),
          AppTextFormField(
            controller: houseNumberController,
            hintText: '16A',
            validator: (value) {},
          ),
          verticalSpace(15),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('ZIP code', style: TextStyles.font14GreyMedium),
                    verticalSpace(10),
                    AppTextFormField(
                      controller: zipCodeController,
                      hintText: '123456',
                      validator: (value) {},
                    ),
                  ],
                ),
              ),
              horizontalSpace(15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('City name', style: TextStyles.font14GreyMedium),
                    verticalSpace(10),
                    AppTextFormField(
                      controller: cityController,
                      hintText: 'Frankfurt',
                      validator: (value) {},
                    ),
                  ],
                ),
              )
            ],
          ),
          verticalSpace(30),
          Row(
            children: [
              Expanded(
                child: AppTextButton(
                  backgroundColor: ColorsManager.lightRed,
                  textStyle: TextStyles.font16MainGreenMedium
                      .copyWith(color: ColorsManager.red),
                  buttonText: 'Delete',
                  onPressed: () {},
                ),
              ),
              horizontalSpace(15),
              Expanded(
                  child: AppTextButton(buttonText: 'Save', onPressed: () {}))
            ],
          ),
        ],
      ),
    );
  }
}
