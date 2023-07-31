class RecommendedModel {
  String foodImageURL;
  String foodName;
  String foodPrice;
  RecommendedModel(
      {required this.foodImageURL,
      required this.foodName,
      required this.foodPrice});
}

List<RecommendedModel> foodRecommended = [
  RecommendedModel(
      foodImageURL: "assets/images/biryani_bg_r_pic.png",
      foodName: "Chicken Biryani",
      foodPrice: "Rs 180"),
  RecommendedModel(
      foodImageURL: "assets/images/burger_bg_r_pic.png",
      foodName: "Cheese Burger",
      foodPrice: "Rs 350"),
  RecommendedModel(
      foodImageURL: "assets/images/shawarma_bg_r_pic.png",
      foodName: "Mayo Shawarma",
      foodPrice: "Rs 220"),
  RecommendedModel(
      foodImageURL: "assets/images/italian_pizza_fries_bg_r_pic.png",
      foodName: "Italian Pizza Fries",
      foodPrice: "Rs 649"),
  RecommendedModel(
      foodImageURL: "assets/images/pasta_bg_r_pic.png",
      foodName: "Classic Pasta",
      foodPrice: "Rs 135"),
  RecommendedModel(
      foodImageURL: 'assets/images/cold_drink_bg_r_pic.png',
      foodName: 'Chilled Coldrinks',
      foodPrice: "Rs 70"),
  // Repeat
  RecommendedModel(
      foodImageURL: "assets/images/biryani_bg_r_pic.png",
      foodName: "Chicken Biryani",
      foodPrice: "Rs 180"),
  RecommendedModel(
      foodImageURL: "assets/images/burger_bg_r_pic.png",
      foodName: "Cheese Burger",
      foodPrice: "Rs 350"),
  RecommendedModel(
      foodImageURL: "assets/images/shawarma_bg_r_pic.png",
      foodName: "Mayo Shawarma",
      foodPrice: "Rs 220"),
  RecommendedModel(
      foodImageURL: "assets/images/italian_pizza_fries_bg_r_pic.png",
      foodName: "Italian Pizza Fries",
      foodPrice: "Rs 649"),
  RecommendedModel(
      foodImageURL: "assets/images/pasta_bg_r_pic.png",
      foodName: "Classic Pasta",
      foodPrice: "Rs 135"),
  RecommendedModel(
      foodImageURL: 'assets/images/cold_drink_bg_r_pic.png',
      foodName: 'Chilled Coldrinks',
      foodPrice: "Rs 70")
];
