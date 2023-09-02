import '../../utilities/imports.dart';

class OrderPlacedScreen extends StatelessWidget {
  const OrderPlacedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomSizedBox(
          heightRatio: 1,
          widthRatio: 0.9,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Icon(
                Icons.check_circle_rounded,
                size: 100,
                color: Colors.redAccent,
              ),
              const CustomSizedBox(heightRatio: 0.02),
              const HeaderText(
                'Your order has been\nplaced successfully',
                fontSize: 32,
              ),
              const CustomSizedBox(heightRatio: 0.02),
              Text(
                "Sit & relax while your order is being\n worked on. It'll take ${AppValues.timeInOrderToArrive}min before you\nget it",
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 18, color: Colors.black),
              ),
              const CustomSizedBox(heightRatio: 0.05),
              CustomElevatedButton(
                buttonAlignment: Alignment.bottomCenter,
                buttonText: 'Go back to home',
                buttonPress: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MainFoodScreen(),
                      ));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
