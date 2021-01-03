// part of 'widgets.dart';

import 'package:flutter/material.dart';
import 'package:eval/models/models.dart';
import 'package:eval/ui/pages/pages.dart';

class CarCard extends StatelessWidget {
  final Cars car;
  CarCard({this.car});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: ListTile(
        contentPadding: EdgeInsets.all(10),
        onTap: () {
          // Navigator.pushReplacement(context,
          //     MaterialPageRoute(builder: (context) {
          //   return EditPage(product);
          // }));
        },
        title: Text(
          car.brand,
          style: TextStyle(fontSize: 20),
        ),
        subtitle: Text(
            car.model),
      ),
    );
  }
}