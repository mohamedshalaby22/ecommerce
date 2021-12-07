// ignore_for_file: must_be_immutable, sized_box_for_whitespace, avoid_unnecessary_containers

import 'package:ecommerce/components.dart';
import 'package:ecommerce/screens/cart_model.dart';
import 'package:ecommerce/screens/cartview_model.dart';

import 'package:ecommerce/screens/products.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailScreen extends StatelessWidget {
  //DetailScreen({Key? key}) : super(key: key);
  late ProductsModel model;
  DetailScreen({Key? key, required this.model}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartViewModel>(
      init: CartViewModel(),
      builder: (controller) => SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Container(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Container(
                            width: MediaQuery.of(context).size.width,
                            height: 270,
                            child: Image.network(
                              model.image,
                              fit: BoxFit.fill,
                            )),
                        Positioned(
                            top: 10,
                            left: 10,
                            child: IconButton(
                              onPressed: () {
                                Get.back();
                              },
                              icon: const Icon(
                                Icons.arrow_back_ios,
                                size: 17,
                              ),
                            )),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            model.name,
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 23,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(top: 10),
                                width: 140,
                                height: 45,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(color: Colors.grey)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    const Text(
                                      'Size',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                      ),
                                    ),
                                    Text(
                                      model.size,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 10),
                                width: 140,
                                height: 45,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(color: Colors.grey)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    const Text(
                                      'Color',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                      ),
                                    ),
                                    Container(
                                      width: 30,
                                      height: 30,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: model.color,
                                        border: Border.all(
                                          color: Colors.grey,
                                          width: 2,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            'Details',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            model.description,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 18,
                              //height: 2.5
                            ),
                          ),
                          const SizedBox(
                            height: 45,
                          ),
                          Row(
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
                                    '\$' + model.price,
                                    style: const TextStyle(
                                      color: Color(0xff09c16d),
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              defaultButton(
                                  text: 'ADD',
                                  width: 135,
                                  height: 50,
                                  pressed: () {
                                    print('===========');
                                    controller.addProduct(
                                      CartModel(
                                          name: model.name,
                                          price: model.price,
                                          quanity: 1,
                                          image: model.image),
                                    );
                                  })
                            ],
                          )
                        ],
                      ),
                    )
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
