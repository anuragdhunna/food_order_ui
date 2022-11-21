import 'package:flutter/material.dart';
import 'package:food_order_ui/models/food_item.dart';
import 'package:food_order_ui/utils/constants.dart';
import 'package:food_order_ui/utils/widgetFunctions.dart';

import '../utils/widgets/add_remove_button.dart';

class CartScreen extends StatefulWidget {
  final FoodItem foodItem;
  const CartScreen({Key? key, required this.foodItem}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Order'),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 20,
              decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
            ),
            Container(
              color: Constants.grey100,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    CartFoodItem(
                        imagePath: widget.foodItem.imagePath,
                        name: widget.foodItem.name,
                        price: widget.foodItem.price),
                    addVerticalSpace(10),
                    CartFoodItem(
                        imagePath: widget.foodItem.imagePath,
                        name: widget.foodItem.name,
                        price: widget.foodItem.price),
                    addVerticalSpace(10),
                    Container(
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Row(
                        children: [
                          Container(
                              decoration: const BoxDecoration(
                                  color: Colors.lightGreen,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Text(
                                    'Promo code Confirmed',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ))
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}

class CartFoodItem extends StatelessWidget {
  const CartFoodItem({
    Key? key,
    required this.imagePath,
    required this.name,
    required this.price,
  }) : super(key: key);

  final String imagePath;
  final String name;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              SizedBox(height: 130, width: 130, child: Image.asset(imagePath)),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'The Kitchen~ $name',
                      maxLines: 2,
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    addVerticalSpace(5),
                    const Text(
                      '~240g',
                      maxLines: 2,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.grey),
                    ),
                    addVerticalSpace(5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const AddRemoveButton(
                          padding: 2,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            '    \$$price',
                            maxLines: 2,
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
