import '../../../utilities/imports.dart';

class PopularFoodTile extends StatefulWidget {
  const PopularFoodTile({super.key});

  @override
  State<PopularFoodTile> createState() => _PopularFoodTileState();
}

class _PopularFoodTileState extends State<PopularFoodTile> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: ListView.builder(
        itemExtent: 190,
        scrollDirection: Axis.horizontal,
        itemCount: popularFoodList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomCard(
              elevation: 10,
              cardTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EachFoodDetailsScreen(
                          isFoodInApi: false,
                          popularFoodItem: popularFoodList[index]),
                    ));
              },
              contentWidget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 2,
                    child: Image.asset(
                      popularFoodList[index].foodImageURL,
                      fit: BoxFit.contain,
                      width: 75,
                      height: 60,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      popularFoodList[index].foodName,
                      maxLines: 1,
                      textAlign: TextAlign.center,
                      textScaleFactor: 1,
                      style: const TextStyle(fontSize: 17.5),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Rs ${popularFoodList[index].foodPrice} ",
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
