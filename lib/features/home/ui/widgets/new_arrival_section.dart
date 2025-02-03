import 'package:ecommerce/core/theming/colors.dart';
import 'package:ecommerce/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/constants/app_images.dart';
import '../../../../core/helpers/spacing.dart';

class NewArrivalsSection extends StatelessWidget {
  const NewArrivalsSection({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'New arrivals',
          style: TextStyles.font16BlackBold,
        ),
        FractionallySizedBox(
          widthFactor: 1.1,
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: 2,
            itemBuilder: (context, index) => _buildNewArrivalCard(),
          ),
        ),
      ],
    );
  }

  Stack _buildNewArrivalCard() {
    return Stack(
      fit: StackFit.passthrough,
      alignment: AlignmentDirectional.bottomEnd,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              Assets.imagesArrivalChair,
              height: 300,
              fit: BoxFit.fill,
            ),
          ),
        ),
        _buildFavouriteIcon(),
        _buildArrivalInfoCard(),
      ],
    );
  }

  PositionedDirectional _buildFavouriteIcon() {
    bool isFavourite = false;
    return PositionedDirectional(
      top: 5,
      end: 5,
      child: StatefulBuilder(
        builder: (context, setState) {
          return GestureDetector(
            onTap: () => {
              setState(() => isFavourite = !isFavourite),
              HapticFeedback.selectionClick()
            },
            child: Container(
              width: 40,
              height: 40,
              margin: const EdgeInsetsDirectional.only(top: 25, end: 15),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: ColorsManager.mainGreen,
                  borderRadius: BorderRadius.circular(8)),
              child: SvgPicture.asset(
                isFavourite ? Assets.svgsHeartFill : Assets.svgsHeartOutline,
                fit: BoxFit.contain,
              ),
            ),
          );
        },
      ),
    );
  }

  Container _buildArrivalInfoCard() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'Rustic Haven set',
                  style: TextStyles.font16BlackBold,
                ),
              ),
              horizontalSpace(15),
              Text(
                '\$230.00',
                style: TextStyles.font16BlackBold,
              ),
            ],
          ),
          verticalSpace(5),
          Text(
            'Elevate your living space with the timeless elegance and comfort to your space',
            style: TextStyles.font12BlackRegular,
          )
        ],
      ),
    );
  }
}
