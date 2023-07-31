class CategoryModel {
  String iconURL;
  String iconName;
  CategoryModel({required this.iconURL, required this.iconName});
}

List<CategoryModel> foodCategories = [
  CategoryModel(iconURL: "assets/icons/pizza_icon.png", iconName: "Pizza"),
  CategoryModel(iconURL: "assets/icons/pasta_icon.png", iconName: "Pasta"),
  CategoryModel(iconURL: "assets/icons/biryani_icon.png", iconName: "Biryani"),
  CategoryModel(iconURL: "assets/icons/hamburger_icon.png", iconName: "Burger"),
  CategoryModel(iconURL: "assets/icons/cold_drink_icon.png", iconName: "Drink"),
  CategoryModel(
      iconURL: "assets/icons/french_fries_icon.png", iconName: "Fries"),
  CategoryModel(iconURL: "assets/icons/fruits_icon.png", iconName: "Fruits"),
  CategoryModel(
      iconURL: "assets/icons/ice_cream_icon.png", iconName: "Ice Cream"),
  CategoryModel(iconURL: "assets/icons/donut_icon.png", iconName: "Bakery"),
  // Repeat
  CategoryModel(iconURL: "assets/icons/pizza_icon.png", iconName: "Pizza"),
  CategoryModel(iconURL: "assets/icons/pasta_icon.png", iconName: "Pasta"),
  CategoryModel(iconURL: "assets/icons/biryani_icon.png", iconName: "Biryani"),
  CategoryModel(iconURL: "assets/icons/hamburger_icon.png", iconName: "Burger"),
  CategoryModel(iconURL: "assets/icons/cold_drink_icon.png", iconName: "Drink"),
  CategoryModel(
      iconURL: "assets/icons/french_fries_icon.png", iconName: "Fries"),
  CategoryModel(iconURL: "assets/icons/fruits_icon.png", iconName: "Fruits"),
  CategoryModel(
      iconURL: "assets/icons/ice_cream_icon.png", iconName: "Ice Cream"),
  CategoryModel(iconURL: "assets/icons/donut_icon.png", iconName: "Bakery"),
];
