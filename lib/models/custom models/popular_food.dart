class PopularFoodModel {
  final String foodImageURL;
  final String foodName;
  final int foodPrice;
  final String foodDescription;
  final String foodExtras;
  bool extrasCheck;
  int foodQuantity;
  PopularFoodModel({
    required this.foodImageURL,
    required this.foodName,
    required this.foodPrice,
    required this.foodDescription,
    required this.foodExtras,
    required this.foodQuantity,
    required this.extrasCheck,
  });
}
