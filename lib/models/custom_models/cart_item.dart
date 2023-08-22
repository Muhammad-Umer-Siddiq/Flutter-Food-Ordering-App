import 'package:food_ordering_app/models/custom_models/popular_food.dart';

class CartItem {
  final PopularFoodModel? food;
  int quantity;
  CartItem({
    this.quantity = 1,
    required this.food,
  });
}

List<CartItem> cartItems = [];

void addToCart(dynamic food) {
  bool itemExists = false;

  for (var item in cartItems) {
    if (item.food == food) {
      item.quantity++;
      itemExists = true;
      break;
    }
  }

  if (!itemExists) {
    cartItems.add(CartItem(food: food));
  }
}
