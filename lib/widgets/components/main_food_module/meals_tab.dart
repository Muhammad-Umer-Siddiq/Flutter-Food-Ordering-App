import 'package:http/http.dart' as http;

import '../../../utilities/imports.dart';

class MealsTab extends StatefulWidget {
  const MealsTab({super.key});

  @override
  State<MealsTab> createState() => _MealsTabState();
}

class _MealsTabState extends State<MealsTab> {
  Future fetchMealsData() async {
    var uri = Uri.parse(HttpEndpoints.regularMealsEndpoint);
    final response = await http.get(uri);
    if (response.statusCode == 200 || response.statusCode == 201) {
      var data = jsonDecode(response.body);
      var mealsJson = data['categories'] as List;

      setState(() {
        regularMealsList =
            mealsJson.map((e) => Categories.fromJson(e)).toList();
      });
      return regularMealsList;
    } else {}
  }

  @override
  void initState() {
    super.initState();
    fetchMealsData();
  }

  @override
  Widget build(BuildContext context) {
    return regularMealsList.isEmpty
        ? const Center(
            child: CircularProgressIndicator(
              color: AppColors.appThemeColor,
            ),
          )
        : CustomGridViewBuilder(
            itemCount: regularMealsList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(10),
                child: CustomCard(
                    elevation: 6,
                    cardTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EachFoodDetailsScreen(
                              isFoodInApi: true,
                              categoriesFoodItem: regularMealsList[index],
                            ),
                          ));
                    },
                    contentWidget: FoodDisplayTile(
                        foodImage: Image.network(regularMealsList[index]
                            .strCategoryThumb
                            .toString()),
                        foodName: regularMealsList[index].strCategory,
                        bottomWidget: Text(
                          "Meal # ${regularMealsList[index].idCategory}",
                          textScaleFactor: 1,
                          maxLines: 1,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 16.5,
                            fontWeight: FontWeight.bold,
                          ),
                        ))),
              );
            },
          );
  }
}
