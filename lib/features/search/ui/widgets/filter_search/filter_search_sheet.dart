import 'package:ecommerce/features/search/ui/widgets/filter_search/filter_search_sheet_content.dart';
import 'package:flutter/material.dart';
import 'filter_search_sheet_app_bar.dart';

class FilterSearchSheet extends StatelessWidget {
  const FilterSearchSheet({super.key});

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
      child: const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FilterSearchSheetAppBar(),
            FilterSearchSheetContent(),
          ],
        ),
      ),
    );
  }
}
