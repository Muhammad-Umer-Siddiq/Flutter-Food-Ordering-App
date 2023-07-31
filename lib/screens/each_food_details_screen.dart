import 'package:flutter/material.dart';

import '../models/custom_models/custom_recommended_model.dart';

class EachFoodDetailsScreen extends StatelessWidget {
  final RecommendedModel foodItem;
  const EachFoodDetailsScreen({super.key, required this.foodItem});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(),
    );
  }
}
