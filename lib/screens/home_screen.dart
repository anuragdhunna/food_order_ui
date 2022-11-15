import 'package:flutter/material.dart';

import '../utils/widgetFunctions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
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
                shrinkWrap: true,
                itemCount: 4,
                // padding: const EdgeInsets.all(9),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1 / 1.2,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return const FoodItem(
                    name: 'Pizza',
                    price: '\$20',
                    imagePath: 'lib/images/pizza.png',
                  );
                },
              )
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

class FoodItem extends StatelessWidget {
  final String imagePath;
  final String name;
  final String price;

  const FoodItem({
    Key? key,
    required this.imagePath,
    required this.name,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            addVerticalSpace(10),
            SizedBox(height: 130, width: 130, child: Image.asset(imagePath)),
            addVerticalSpace(10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  SizedBox(
                    width: 100,
                    child: Text(
                      name,
                      maxLines: 2,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Spacer(),
                  Text(
                    price,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            )
          ],
        ),
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
            children: [
              const CategoryItem(
                categoryName: 'Vegan',
                icon: Icons.energy_savings_leaf,
                color: Colors.green,
              ),
              addHorizontalSpace(7),
              const CategoryItem(
                categoryName: 'Coffee',
                icon: Icons.coffee,
                color: Colors.brown,
              ),
              addHorizontalSpace(7),
              const CategoryItem(
                categoryName: 'Drinks',
                icon: Icons.emoji_food_beverage_rounded,
                color: Colors.red,
              ),
              addHorizontalSpace(7),
              const CategoryItem(
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
  const CategoryItem({
    Key? key,
    required this.categoryName,
    required this.icon,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10))),
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
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            )
          ],
        ),
      ),
    );
  }
}
