class CategoryFoodModel {
  final String iconURL;
  final String iconName;
  const CategoryFoodModel({required this.iconURL, required this.iconName});
}

List<CategoryFoodModel> foodCategories = [
  const CategoryFoodModel(
      iconURL: "assets/icons/pizza_icon.png", iconName: "Pizza"),
  const CategoryFoodModel(
      iconURL: "assets/icons/pasta_icon.png", iconName: "Chinese"),
  const CategoryFoodModel(
      iconURL: "assets/icons/biryani_icon.png", iconName: "Biryani"),
  const CategoryFoodModel(
      iconURL: "assets/icons/hamburger_icon.png", iconName: "Burger"),
  const CategoryFoodModel(
      iconURL: "assets/icons/cold_drink_icon.png", iconName: "Drink"),
  const CategoryFoodModel(
      iconURL: "assets/icons/french_fries_icon.png", iconName: "Fries"),
  const CategoryFoodModel(
      iconURL: "assets/icons/fruits_icon.png", iconName: "Fruits"),
  const CategoryFoodModel(
      iconURL: "assets/icons/ice_cream_icon.png", iconName: "Ice Cream"),
  const CategoryFoodModel(
      iconURL: "assets/icons/donut_icon.png", iconName: "Bakery"),
];
