import 'package:flutter/material.dart';

import '../constants.dart';

class AddRemoveButton extends StatelessWidget {
  final double? padding;
  const AddRemoveButton({
    Key? key,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Constants.grey100,
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        child: Padding(
          padding: EdgeInsets.all(padding ?? 8.0),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.all(padding ?? 8.0),
                child: const Icon(
                  Icons.remove,
                  color: Colors.black,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(padding ?? 8.0),
                child: const Text(
                  '1',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(padding ?? 8.0),
                child: const Icon(
                  Icons.add,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ));
  }
}
