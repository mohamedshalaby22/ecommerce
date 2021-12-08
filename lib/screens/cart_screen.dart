// ignore_for_file: avoid_unnecessary_containers

import 'package:ecommerce/components.dart';
import 'package:ecommerce/screens/cartview_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CarScreen extends StatelessWidget {
  const CarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartViewModel>(
      init: Get.find<CartViewModel>(),
      builder: (controller) => SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            body: Column(
              children: [
                Expanded(
                  child: Container(
                      child: ListView.separated(
                          itemBuilder: (context, index) => Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, top: 10),
                                child: SizedBox(
                                  height: 210,
                                  child: Row(
                                    children: [
                                      ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          child: SizedBox(
                                            height: 200,
                                            child: Image.network(controller
                                                .cartModel[index].image),
                                          )),
                                      SizedBox(
                                        width: 12,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          top: 30,
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              " ${controller.cartModel[index].name}",
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 6,
                                            ),
                                            Text(
                                              " \$${controller.cartModel[index].price.toString()}",
                                              style: const TextStyle(
                                                color: Color(0xff09c16d),
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 35,
                                            ),
                                            Container(
                                              width: 150,
                                              height: 40,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: Colors.grey[200],
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  IconButton(
                                                    onPressed: () {
                                                      controller
                                                          .addcounter(index);
                                                    },
                                                    icon: const Icon(Icons.add),
                                                    color: Colors.grey[500],
                                                    iconSize: 27,
                                                  ),
                                                  Text(
                                                    controller.cartModel[index]
                                                        .quanity
                                                        .toString(),
                                                    style: const TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  IconButton(
                                                    onPressed: () {
                                                      controller
                                                          .removecounter(index);
                                                    },
                                                    icon: const Icon(
                                                        Icons.remove),
                                                    color: Colors.grey[500],
                                                    iconSize: 27,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                          separatorBuilder: (context, index) => const SizedBox(
                                height: 10,
                              ),
                          itemCount: controller.cartModel.length)),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          const Text(
                            'PRICE',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            '\$${controller.totalPrice}',
                            style: const TextStyle(
                              color: Color(0xff09c16d),
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      defaultButton(
                          text: 'CHECKOUT',
                          width: 135,
                          height: 50,
                          pressed: () {
                            print('===========');
                          }),
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }
}
