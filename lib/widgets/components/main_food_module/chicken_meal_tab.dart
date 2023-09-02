import 'package:http/http.dart' as http;

import '../../../utilities/imports.dart';

class ChickenMealTab extends StatefulWidget {
  const ChickenMealTab({super.key});

  @override
  State<ChickenMealTab> createState() => _ChickenMealTabState();
}

class _ChickenMealTabState extends State<ChickenMealTab> {
  void _showDialogAndroid() {
    showDialog(
        context: context,
        builder: (context) => CustomAlertDialog(
              title: 'Coming Soon!',
              actionsAlignment: MainAxisAlignment.center,
              content: "Soon you would be allowed to see details & order them",
              actions: [
                CustomTextButton(
                  text: 'Ok',
                  buttonPress: () => Navigator.pop(context),
                )
              ],
            ));
  }

  void _showDialogIOS() {
    showDialog(
        context: context,
        builder: (context) => CustomCupertinoAlertDialog(
              actions: [
                CustomTextButton(
                  text: 'Ok',
                  buttonPress: () => Navigator.pop(context),
                )
              ],
              title: 'Coming Soon',
              content: "Soon you would be allowed to see details & order them",
            ));
  }

  Future fetchChickenMealsData() async {
    var uri = Uri.parse(HttpEndpoints.chickenEndpoint);
    final response = await http.get(uri);
    if (response.statusCode == 200 || response.statusCode == 201) {
      var data = jsonDecode(response.body);
      var chickenJson = data['meals'] as List;
      setState(() {
        chickenMealsList = chickenJson.map((e) => Meals.fromJson(e)).toList();
      });
      return chickenMealsList;
    } else {}
  }

  @override
  void initState() {
    super.initState();
    fetchChickenMealsData();
  }

  @override
  Widget build(BuildContext context) {
    return chickenMealsList.isEmpty
        ? const Center(
            child: CircularProgressIndicator(
              color: AppColors.appThemeColor,
            ),
          )
        : CustomGridViewBuilder(
            itemCount: chickenMealsList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(10),
                child: CustomCard(
                    elevation: 6,
                    cardTap: () {
                      Platform.isIOS ? _showDialogIOS() : _showDialogAndroid();
                    },
                    contentWidget: FoodDisplayTile(
                      foodImage: Image.network(
                          chickenMealsList[index].strMealThumb.toString()),
                      foodName: chickenMealsList[index].strMeal,
                      bottomWidget: Text(
                        "Meal # ${chickenMealsList[index].idMeal ?? ""}",
                        textScaleFactor: 1,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 16.5,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    )),
              );
            },
          );
  }
}
