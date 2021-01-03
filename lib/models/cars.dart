part of 'models.dart';

class Cars extends Equatable{

  final String id;
  final String brand;
  final String model;
  final String color;
  final String plateNumber;
  final String isSelected;

  Cars(this.id, this.brand, this.model, this.color, this.plateNumber, this.isSelected);

  @override
  List<Object> get props => [id, brand, model, color, plateNumber, isSelected];

}