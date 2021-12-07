// ignore_for_file: must_be_immutable, sized_box_for_whitespace
import 'package:ecommerce/detail_screen.dart';
import 'package:ecommerce/screens/explore_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({Key? key}) : super(key: key);
  Future<void> handleRefresh() async {
    await Future.delayed(const Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ExploreViewModel>(
      init: Get.find<ExploreViewModel>(),
      builder: (controller) => controller.loading.value
          ? const Center(
              child: CircularProgressIndicator(
              color: Color(0xff09c16d),
            ))
          : Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
              backgroundColor: Colors.white,
              body: LiquidPullToRefresh(
                height: 300,
                color: Colors.white,
                backgroundColor: Colors.black,
                animSpeedFactor: 2,
                showChildOpacityTransition: false,
                onRefresh: handleRefresh,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          //margin: const EdgeInsets.only(top: 70),
                          decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: TextFormField(
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Search Products',
                                hintStyle:
                                    TextStyle(color: Colors.grey, fontSize: 15),
                                prefixIcon: Icon(
                                  Icons.search,
                                  color: Colors.black,
                                )),
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        const Text(
                          'Categories',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Container(
                          height: 110,
                          child: ListView.separated(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) => Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                    width: 60,
                                    height: 60,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.6),
                                          blurRadius: 5,
                                          offset: const Offset(0, 5),
                                        ),
                                      ],
                                    ),
                                    child: Image.network(controller
                                        .categoriesModel[index].image)),
                                const SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  controller.categoriesModel[index].name,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                              width: 13,
                            ),
                            itemCount: controller.categoriesModel.length,
                          ),
                        ),
                        const SizedBox(
                          height: 17,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'Best Selling',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'See all',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Container(
                          height: 350,
                          child: ListView.separated(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) => InkWell(
                              onTap: () {
                                Get.to(DetailScreen(
                                  model: controller.productsModel[index],
                                ));
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image(
                                    image: NetworkImage(
                                      controller.productsModel[index].image,
                                    ),
                                    width: 147,
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    controller.productsModel[index].name,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 13,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    'Bang and Olufsen',
                                    style: TextStyle(
                                      color: Colors.grey[400],
                                      fontSize: 13,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    '\$' +
                                        controller.productsModel[index].price,
                                    style: const TextStyle(
                                      color: Color(0xff09c16d),
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                              width: 15,
                            ),
                            itemCount: controller.productsModel.length,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
    );
  }

  // Widget imageBuildItem() =>
}
