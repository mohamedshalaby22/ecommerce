import 'package:ecommerce/core/helpers/spacing.dart';
import 'package:ecommerce/features/onBoarding/ui/widgets/on_boarding_app_bar.dart';
import 'package:flutter/material.dart';
import 'widgets/on_boarding_page_view.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OnBoardingAppBar(
        isShowBackIcon: currentPage != 0,
        onBack:onBack,
        onSkip:onSkip,
      ),
      body: SafeArea(
        child: Column(
          children: [
            verticalSpace(5),
            Expanded(
              child: OnBoardingPageView(
                currentPage: currentPage,
                pageController: _pageController,
                onChangeCurrentPage: (int currentPage) {
                  setState(() {
                    this.currentPage = currentPage;
                  });
                },
              ),
            ),
             verticalSpace(10),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void onSkip() {
    _pageController.animateToPage(3,
        duration: const Duration(milliseconds: 500), curve: Curves.ease);
  }
  void onBack() { 
    _pageController.animateToPage(currentPage - 1,
        duration: const Duration(milliseconds: 500), curve: Curves.ease);
  }
}
