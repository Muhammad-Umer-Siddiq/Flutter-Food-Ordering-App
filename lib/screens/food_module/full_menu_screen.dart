import '../../utilities/imports.dart';

class FullMenuScreen extends StatefulWidget {
  const FullMenuScreen({super.key});

  @override
  State<FullMenuScreen> createState() => _FullMenuScreenState();
}

class _FullMenuScreenState extends State<FullMenuScreen> {
  final List<String> _tabsTitle = ['Popular', 'Meals', 'Drinks', 'Chicken'];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return DefaultTabController(
      initialIndex: 0,
      animationDuration: const Duration(milliseconds: 200),
      length: 4,
      child: Scaffold(
          appBar: AppBar(
            actions: <IconButton>[
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MainFoodScreen(),
                        ));
                  },
                  tooltip: 'Home',
                  icon: const Icon(
                    Icons.fastfood_outlined,
                    color: Colors.white,
                  ))
            ],
            bottom: TabBar(
                indicatorColor: Colors.white,
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorPadding: const EdgeInsets.only(bottom: 1),
                unselectedLabelColor: Colors.white,
                labelColor: Colors.white,
                labelStyle: TextStyle(fontSize: width < 400 ? 17 : 19),
                unselectedLabelStyle:
                    TextStyle(fontSize: width < 400 ? 16 : 18),
                tabs: List.generate(
                    4,
                    (index) => Tab(
                          child: Text(
                            _tabsTitle[index],
                            maxLines: 1,
                          ),
                        ))),
            automaticallyImplyLeading: false,
            toolbarHeight: 75,
            title: const Text(" F U L L   M E N U "),
            backgroundColor: Colors.red.shade700,
            titleTextStyle: const TextStyle(
                fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.grey.shade200,
          body: const TabBarView(
            children: <Widget>[
              PopularFoodTab(),
              MealsTab(),
              DrinksTab(),
              ChickenMealTab(),
            ],
          )),
    );
  }
}
