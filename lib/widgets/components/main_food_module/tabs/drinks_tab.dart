import 'package:http/http.dart' as http;

import '../../../../utilities/imports.dart';

class DrinksTab extends StatefulWidget {
  const DrinksTab({super.key});

  @override
  State<DrinksTab> createState() => _DrinksTabState();
}

class _DrinksTabState extends State<DrinksTab> {
  void _detailsNotPossible() {
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

  void _detailsNotPossibleIOS() {
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

  Future fetchDrinksData() async {
    var uri = Uri.parse(HttpEndpoints.drinksEndpoint);
    final response = await http.get(uri);

    if (response.statusCode == 200 || response.statusCode == 201) {
      var data = jsonDecode(response.body);
      var drinksJson = data['drinks'] as List;
      setState(() {
        drinksList = drinksJson.map((e) => Drinks.fromJson(e)).toList();
      });
      return drinksList;
    } else {}
  }

  @override
  void initState() {
    fetchDrinksData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return drinksList.isEmpty
        ? const Center(
            child: CircularProgressIndicator(
              color: AppColors.appThemeColor,
            ),
          )
        : CustomGridViewBuilder(
            itemCount: drinksList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(10),
                child: CustomCard(
                    elevation: 6,
                    cardTap: () {
                      Platform.isIOS
                          ? _detailsNotPossibleIOS()
                          : _detailsNotPossible();
                    },
                    contentWidget: FoodDisplayTile(
                      foodImage: Image.network(
                          drinksList[index].strDrinkThumb.toString()),
                      foodName: drinksList[index].strDrink,
                      bottomWidget: Text(
                        "Meal # ${drinksList[index].idDrink ?? ""}",
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
