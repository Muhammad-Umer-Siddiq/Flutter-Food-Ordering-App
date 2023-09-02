import 'popular_food.dart';

class CartItem {
  final PopularFoodModel? food;
  int quantity;
  CartItem({
    this.quantity = 1,
    required this.food,
  });
}
