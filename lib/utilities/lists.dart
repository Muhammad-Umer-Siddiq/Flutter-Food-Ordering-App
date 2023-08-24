import 'package:food_ordering_app/models/api_models/drinks_model.dart';

import '../models/api_models/meals_model.dart';
import '../models/custom_models/payment_model.dart';
import '../models/custom_models/popular_food.dart';

List<Categories> mealsList = [];
// dynamic data items
List<Drinks> drinksList = [];

// static data items
List<PopularFoodModel> popularFoodList = [
  PopularFoodModel(
      foodQuantity: 1,
      foodExtras: 'Chicken Piece',
      foodImageURL: "assets/images/biryani_bg_r_pic.png",
      foodName: "Chicken Biryani",
      foodPrice: 180,
      foodDescription:
          "Get ready to savor the spiciest Chicken Biryani in town! Our dish combines tender chicken with aromatic Basmati rice, all cooked to perfection. The blend of flavorful spices creates a mouthwatering experience that will leave you wanting more. Don't miss out on this deliciously hot and delightful culinary delight!"),
  PopularFoodModel(
      foodQuantity: 1,
      foodExtras: 'Extra Cheese',
      foodImageURL: "assets/images/burger_bg_r_pic.png",
      foodName: "Cheese Burger",
      foodPrice: 350,
      foodDescription:
          "Dive into cheesy goodness with our classic Cheese Burger! Picture this: a juicy, perfectly grilled beef patty topped with melty, gooey cheese. The buns are soft and toasted just right for that extra crunch. Each bite is a harmonious symphony of flavors that will make your taste buds sing. Treat yourself to the ultimate comfort food experience with our delectable Cheese Burger - a true crowd-pleaser!"),
  PopularFoodModel(
      foodQuantity: 1,
      foodExtras: 'Extra Cucumber',
      foodImageURL: "assets/images/shawarma_bg_r_pic.png",
      foodName: "Mayo Shawarma",
      foodPrice: 220,
      foodDescription:
          "Experience the mouthwatering delight of our Chicken Mayo Shawarma! Tender, marinated chicken, creamy mayo, fresh veggies, and warm pita come together for a taste of the Mediterranean. Savor the perfect blend of flavors and textures in every bite. Don't miss out on this heavenly treat!"),
  PopularFoodModel(
      foodQuantity: 1,
      foodExtras: 'Double Cheese',
      foodImageURL: "assets/images/italian_pizza_fries_bg_r_pic.png",
      foodName: "Italian Pizza Fries",
      foodPrice: 849,
      foodDescription:
          "Indulge in the deliciousness of our Italian Pizza Fries! Crispy golden fries topped with melted cheese, zesty marinara sauce, and a medley of Italian spices. Each bite is a burst of flavors reminiscent of your favorite pizza. It's the perfect combination of comfort food and Italian cuisine that will leave you craving for more. Treat yourself to this mouthwatering fusion of pizza and fries - a delightful twist that will surely satisfy your taste buds!"),
  PopularFoodModel(
      foodQuantity: 1,
      foodExtras: 'Hot Spicy',
      foodImageURL: "assets/images/pasta_bg_r_pic.png",
      foodName: "Classic Pasta",
      foodPrice: 135,
      foodDescription:
          "Indulge in our Classic Pasta! Perfectly cooked pasta in rich tomato sauce, infused with herbs and garlic. Each bite is a heavenly blend of flavors. With a sprinkle of Parmesan, this Italian masterpiece is simply satisfying. Treat yourself to the timeless taste of our Classic Pasta!"),
  PopularFoodModel(
      foodQuantity: 1,
      foodExtras: 'Paper glasses',
      foodImageURL: 'assets/images/cold_drink_bg_r_pic.png',
      foodName: 'Chilled Coldrinks',
      foodPrice: 70,
      foodDescription:
          "Quench your thirst with our refreshing Chilled Cold Drinks! Ice-cold beverages that are bursting with flavors, from zesty citrus to sweet and fruity options. Each sip is a revitalizing experience that cools you down on a hot day. With a variety of choices to suit your taste buds, our Chilled Cold Drinks are the perfect companions for any occasion. So, sit back, relax, and enjoy the cool goodness in every refreshing gulp!"),
];

final List<String> screenButtons = [
  'C',
  'DEL',
  '÷',
  '×',
  '7',
  '8',
  '9',
  '+',
  '4',
  '5',
  '6',
  '-',
  '1',
  '2',
  '3',
  '.',
  '0',
  '=',
  '(',
  ')'
];

List<PaymentTypeModel> paymentTypes = [
  PaymentTypeModel(
      paymentIconURL: 'assets/icons/easypaisa_bg.png',
      paymentIsSelected: false),
  PaymentTypeModel(
      paymentIconURL: 'assets/icons/jazzCash_bg.png', paymentIsSelected: false),
  PaymentTypeModel(
      paymentIconURL: 'assets/icons/meezanBank_bg.png',
      paymentIsSelected: false),
  PaymentTypeModel(
      paymentIconURL: 'assets/icons/hbl_bg.png', paymentIsSelected: false),
];
