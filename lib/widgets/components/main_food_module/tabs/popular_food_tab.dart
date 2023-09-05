import '../../../../utilities/imports.dart';

class PopularFoodTab extends StatefulWidget {
  const PopularFoodTab({super.key});

  @override
  State<PopularFoodTab> createState() => _PopularFoodTabState();
}

class _PopularFoodTabState extends State<PopularFoodTab> {
  @override
  Widget build(BuildContext context) {
    return CustomGridViewBuilder(
      itemCount: popularFoodList.length,
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
                        isFoodInApi: false,
                        popularFoodItem: popularFoodList[index],
                      ),
                    ));
              },
              contentWidget: FoodDisplayTile(
                foodImage: Image.asset(popularFoodList[index].foodImageURL),
                foodName: popularFoodList[index].foodName,
                bottomWidget: Text(
                  "Rs.${popularFoodList[index].foodPrice}",
                  textScaleFactor: 1,
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 16.5,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )),
        );
      },
    );
  }
}
