// part of 'widgets.dart';

import 'package:eval/services/services.dart';
import 'package:flutter/material.dart';
import 'package:eval/models/models.dart';
import 'package:eval/ui/pages/pages.dart';

class CarCard extends StatelessWidget {
  final Cars car;
  CarCard({this.car});

  String carIsSelected;

  @override
  Widget build(BuildContext context) {

    if (car.isSelected == "false") {
      carIsSelected = "";
    } else {
      carIsSelected = "(Selected)";
    }

    return Card(
      color: Color(0xff2c2c2e),
      margin: EdgeInsets.only(left: 10, right: 10, top: 10),
      child: ListTile(
        contentPadding: EdgeInsets.only(left: 20),
        onTap: () async {
            carIsSelected = "true";
            await CarServices.updateSelectedCar(car.id);
        },
        title: Text(
          car.brand,
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        subtitle: Text(
            car.model + " - " + car.plateNumber + " " + carIsSelected, style: TextStyle(color: Color(0xff8e8e93))),
      ),
    );
  }
}