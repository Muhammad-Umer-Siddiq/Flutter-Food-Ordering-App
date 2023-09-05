import '../utilities/imports.dart';

// dynamic data items
List<Categories> regularMealsList = [];
List<Drinks> drinksList = [];
List<Meals> chickenMealsList = [];
List<CartItem> cartItems = [];

// static data items
final List<PopularFoodModel> popularFoodList = [
  PopularFoodModel(
      foodImageURL: 'assets/images/steak_bg_r_pic.png',
      foodName: 'Steak',
      foodPrice: 490,
      foodDescription:
          "Savor our sizzling Steak! Juicy cuts, perfectly seared for a caramelized crust. Each bite is a journey of savory goodness. Paired with delightful sides, it's a carnivore's dream. Treat yourself to our unforgettable Steak - a true delight for meat lovers!",
      foodExtras: 'Garlic Butter Sauce.',
      extrasCheck: false,
      extrasPrice: 15,
      foodQuantity: 1),
  PopularFoodModel(
      foodImageURL: 'assets/images/tikka_boti_pic.jpg',
      foodName: 'Tikka Boti',
      foodPrice: 230,
      extrasCheck: false,
      extrasPrice: 40,
      foodDescription:
          "Delight in our Tikka Boti! Tender, marinated chunks of meat, grilled to smoky perfection. Each piece is a flavorful explosion of spices that will thrill your taste buds. With a hint of charred goodness, this dish captures the essence of barbecue perfection. Indulge in the mouthwatering experience of our Tikka Boti - a taste sensation that's sure to satisfy!",
      foodExtras: 'Green Chutney',
      foodQuantity: 1),
  PopularFoodModel(
      extrasCheck: false,
      extrasPrice: 45,
      foodQuantity: 1,
      foodExtras: 'Extra Cucumber',
      foodImageURL: "assets/images/shawarma_bg_r_pic.png",
      foodName: "Mayo Shawarma",
      foodPrice: 180,
      foodDescription:
          "Experience the mouthwatering delight of our Chicken Mayo Shawarma! Tender, marinated chicken, creamy mayo, fresh veggies, and warm pita come together for a taste of the Mediterranean. Savor the perfect blend of flavors and textures in every bite. Don't miss out on this heavenly treat!"),
  PopularFoodModel(
      extrasCheck: false,
      extrasPrice: 120,
      foodQuantity: 1,
      foodExtras: 'Double Cheese',
      foodImageURL: "assets/images/italian_pizza_fries_bg_r_pic.png",
      foodName: "Italian Pizza Fries",
      foodPrice: 849,
      foodDescription:
          "Indulge in the deliciousness of our Italian Pizza Fries! Crispy golden fries topped with melted cheese, zesty marinara sauce, and a medley of Italian spices. Each bite is a burst of flavors reminiscent of your favorite pizza. It's the perfect combination of comfort food and Italian cuisine that will leave you craving for more. Treat yourself to this mouthwatering fusion of pizza and fries - a delightful twist that will surely satisfy your taste buds!"),
  PopularFoodModel(
      extrasCheck: false,
      extrasPrice: 25,
      foodQuantity: 1,
      foodExtras: 'Hot Spicy',
      foodImageURL: "assets/images/pasta_bg_r_pic.png",
      foodName: "Classic Pasta",
      foodPrice: 135,
      foodDescription:
          "Indulge in our Classic Pasta! Perfectly cooked pasta in rich tomato sauce, infused with herbs and garlic. Each bite is a heavenly blend of flavors. With a sprinkle of Parmesan, this Italian masterpiece is simply satisfying. Treat yourself to the timeless taste of our Classic Pasta!"),
  PopularFoodModel(
      extrasCheck: false,
      extrasPrice: 30,
      foodQuantity: 1,
      foodExtras: 'Paper glasses',
      foodImageURL: 'assets/images/cold_drink_bg_r_pic.png',
      foodName: 'Chilled Coldrinks',
      foodPrice: 70,
      foodDescription:
          "Quench your thirst with our refreshing Chilled Cold Drinks! Ice-cold beverages that are bursting with flavors, from zesty citrus to sweet and fruity options. Each sip is a revitalizing experience that cools you down on a hot day. With a variety of choices to suit your taste buds, our Chilled Cold Drinks are the perfect companions for any occasion. So, sit back, relax, and enjoy the cool goodness in every refreshing gulp!"),
  PopularFoodModel(
      extrasCheck: false,
      extrasPrice: 80,
      foodQuantity: 1,
      foodExtras: 'Chicken Piece',
      foodImageURL: "assets/images/biryani_bg_r_pic.png",
      foodName: "Chicken Biryani",
      foodPrice: 180,
      foodDescription:
          "Get ready to savor the spiciest Chicken Biryani in town! Our dish combines tender chicken with aromatic Basmati rice, all cooked to perfection. The blend of flavorful spices creates a mouthwatering experience that will leave you wanting more. Don't miss out on this deliciously hot and delightful culinary delight!"),
  PopularFoodModel(
      extrasCheck: false,
      extrasPrice: 90,
      foodQuantity: 1,
      foodExtras: 'Extra Cheese',
      foodImageURL: "assets/images/burger_bg_r_pic.png",
      foodName: "Cheese Burger",
      foodPrice: 350,
      foodDescription:
          "Dive into cheesy goodness with our classic Cheese Burger! Picture this: a juicy, perfectly grilled beef patty topped with melty, gooey cheese. The buns are soft and toasted just right for that extra crunch. Each bite is a harmonious symphony of flavors that will make your taste buds sing. Treat yourself to the ultimate comfort food experience with our delectable Cheese Burger - a true crowd-pleaser!"),
];

final List<PaymentTypeModel> paymentTypes = [
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
