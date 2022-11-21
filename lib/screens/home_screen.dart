import 'package:flutter/material.dart';
import 'package:food_order_ui/models/food_item.dart';
import 'package:food_order_ui/utils/constants.dart';
import 'package:food_order_ui/utils/widgets/add_remove_button.dart';

import '../utils/widgetFunctions.dart';
import '../utils/widgets/submit_button.dart';
import 'cart_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    List<FoodItem> foodItems = [];
    foodItems.add(
        const FoodItem(imagePath: Constants.pasta, name: 'Pasta', price: '24'));
    foodItems.add(
        const FoodItem(imagePath: Constants.pizza, name: 'Pizza', price: '21'));
    foodItems.add(const FoodItem(
        imagePath: Constants.quinoa, name: 'Quinoa', price: '34'));
    foodItems.add(const FoodItem(
        imagePath: Constants.burger, name: 'Burger', price: '14'));
    foodItems.add(
        const FoodItem(imagePath: Constants.pizza, name: 'Pizza', price: '41'));
    return SafeArea(
        child: Scaffold(
      floatingActionButton: const SubmitButton(text: 'Check out 2 products'),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('The Kitchen'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.lightGreenAccent[700],
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Row(
                  children: const [
                    Icon(
                      Icons.shopping_cart_outlined,
                      color: Colors.black,
                    ),
                    Text(
                      '  2 ',
                      style: TextStyle(color: Colors.black),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.grey[100],
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20))),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, bottom: 10.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.grey[700],
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(20))),
                            child: TextFormField(
                              textAlign: TextAlign.left,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(0),
                                hintStyle: const TextStyle(
                                    fontSize: 17, color: Colors.white),
                                filled: true,
                                prefixIcon: Icon(
                                  Icons.search,
                                  color: Colors.grey[300],
                                ),
                                label: Text(
                                  'Search for something tasty...',
                                  style: TextStyle(color: Colors.grey[300]),
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              buildLabelAndViewAll('Top Categories'),
              const Categories(),
              buildLabelAndViewAll('Recommended for you'),
              addVerticalSpace(10),
              GridView.builder(
                physics: const ScrollPhysics(),
                shrinkWrap: true,
                itemCount: foodItems.length,
                // padding: const EdgeInsets.all(9),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1 / 1.1,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return FoodItemWidget(
                    foodItem: foodItems[index],
                  );
                },
              ),
              addVerticalSpace(40)
            ],
          ),
        ),
      ),
    ));
  }

  Padding buildLabelAndViewAll(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          Text(
            'View all',
            style: TextStyle(
                color: Colors.grey[700],
                fontSize: 17,
                fontWeight: FontWeight.normal),
          ),
          addHorizontalSpace(4),
          Icon(
            Icons.arrow_forward,
            size: 20,
            color: Colors.grey[700],
          ),
        ],
      ),
    );
  }
}

class FoodItemWidget extends StatelessWidget {
  final FoodItem foodItem;

  const FoodItemWidget({
    Key? key,
    required this.foodItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          // open bottom sheet
          buildFoodItemDetailBottomSheet(context);
        },
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child: Column(
            children: [
              addVerticalSpace(10),
              SizedBox(
                  height: 130,
                  width: 130,
                  child: Image.asset(foodItem.imagePath)),
              addVerticalSpace(10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    SizedBox(
                      width: 100,
                      child: Text(
                        foodItem.name,
                        maxLines: 2,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    const Spacer(),
                    Text(
                      foodItem.price,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> buildFoodItemDetailBottomSheet(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        builder: (context) {
          return Stack(
            alignment: Alignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.75,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15.0),
                          topRight: Radius.circular(15.0))),
                  child: ListView(
                    children: [
                      addVerticalSpace(10),
                      Container(
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18.0),
                          child: Container(
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20))),
                              height: 200,
                              width: double.infinity,
                              child: Image.asset(foodItem.imagePath)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                          color: Colors.white,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Divider(),
                              Text(
                                'The Kitchen~ ${foodItem.name}',
                                maxLines: 2,
                                textAlign: TextAlign.left,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              const Text(
                                '~240g',
                                maxLines: 2,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Colors.grey),
                              ),
                              addVerticalSpace(8),
                              const Divider(),
                              Row(
                                children: [
                                  CategoryItem(
                                    categoryName: 'Vegan',
                                    icon: Icons.energy_savings_leaf,
                                    color: Colors.green,
                                    backgroundColor: Colors.grey[100],
                                  ),
                                  CategoryItem(
                                    categoryName: 'Calories',
                                    icon: Icons.local_fire_department,
                                    color: Colors.deepOrange,
                                    backgroundColor: Constants.grey100,
                                  ),
                                ],
                              ),
                              const Divider(),
                              const Text(
                                'Nutritional value per 100 gm',
                                maxLines: 2,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Colors.grey),
                              ),
                              addVerticalSpace(2),
                              Row(
                                children: [
                                  buildNutritionalValues('198', 'kcal'),
                                  buildNutritionalValues('12', 'proteins'),
                                  buildNutritionalValues('18', 'fats'),
                                  buildNutritionalValues('5.6', 'carbs'),
                                ],
                              ),
                              const Divider(),
                              buildLabelAndDetail('Ingredients',
                                  'There are some toppings that should be cooked first before topping a pizza because they won’t cook fully before the pizza is done cooking. Raw meat should be fully cooked before adding it as a topping. Any vegetables that you don’t want to be raw on the cooked pizza such as onions, peppers, broccoli, or mushrooms should be sautéed first.'),
                              const Divider(),
                              addVerticalSpace(5),
                              buildLabelAndDetail('Terms and Conditions',
                                  'There are some toppings that should be cooked first before topping a pizza because they won’t cook fully before the pizza is done cooking. Raw meat should be fully cooked before adding it as a topping. Any vegetables that you don’t want to be raw on the cooked pizza such as onions, peppers, broccoli, or mushrooms should be sautéed first.'),
                            ],
                          ),
                        ),
                      ),
                      addVerticalSpace(60),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 30),
                  child: Container(
                    color: Colors.white,
                    child: Row(
                      children: [
                        const AddRemoveButton(),
                        addHorizontalSpace(10),
                        Container(
                            decoration: const BoxDecoration(
                                color: Colors.black,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => CartScreen(
                                                    foodItem: foodItem,
                                                  )),
                                        );
                                      },
                                      child: const Text(
                                        'Add To Cart     ',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                    // const Spacer(),
                                    Text(
                                      '\$ ${foodItem.price}',
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            )),
                      ],
                    ),
                  ),
                ),
              )
            ],
          );
        });
  }

  Column buildLabelAndDetail(String label, String details) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          maxLines: 2,
          textAlign: TextAlign.left,
          style: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black),
        ),
        addVerticalSpace(5),
        Text(
          details,
          // maxLines: 2,
          textAlign: TextAlign.left,

          style: const TextStyle(
              letterSpacing: 0.5,
              fontWeight: FontWeight.normal,
              fontSize: 15,
              color: Colors.grey),
        ),
      ],
    );
  }

  Widget buildNutritionalValues(String value, String key) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          Text(
            value,
            maxLines: 2,
            textAlign: TextAlign.left,
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black),
          ),
          Text(
            key,
            maxLines: 2,
            textAlign: TextAlign.left,
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 15, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}

class Categories extends StatelessWidget {
  const Categories({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      child: SizedBox(
        height: 40,
        child: ListView(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            children: const [
              CategoryItem(
                categoryName: 'Vegan',
                icon: Icons.energy_savings_leaf,
                color: Colors.green,
              ),
              CategoryItem(
                categoryName: 'Coffee',
                icon: Icons.coffee,
                color: Colors.brown,
              ),
              CategoryItem(
                categoryName: 'Drinks',
                icon: Icons.emoji_food_beverage_rounded,
                color: Colors.red,
              ),
              CategoryItem(
                categoryName: 'Ice Creams',
                icon: Icons.icecream_rounded,
                color: Colors.pink,
              ),
            ]),
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final String categoryName;
  final IconData icon;
  final Color color;
  final Color? backgroundColor;
  const CategoryItem({
    Key? key,
    required this.categoryName,
    required this.icon,
    required this.color,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3.5),
      child: Container(
        decoration: BoxDecoration(
            color: backgroundColor ?? Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              Icon(
                icon,
                color: color,
              ),
              addHorizontalSpace(4),
              Text(
                categoryName,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              )
            ],
          ),
        ),
      ),
    );
  }
}
