import 'package:flutter/material.dart';
import '../../../../../../core/widgets/full_sheet_app_bar.dart';
import 'edit_user_info_content.dart';

class EditUserInfoSheet extends StatelessWidget {
  const EditUserInfoSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      height: MediaQuery.sizeOf(context).height - 80,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25),
        ),
      ),
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         const FullSheetAppBar(
            title: 'Edit Profile',
            subTitle: 'Update your personal information',
          ),
          EditUserInfoContent(),
        ],
      ),
    );
  }
}
