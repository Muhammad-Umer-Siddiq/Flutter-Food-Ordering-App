import 'package:food_ordering_app/screens/login_module/splash.dart';
import 'package:food_ordering_app/utilities/imports.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          tooltipTheme: TooltipThemeData(
              waitDuration: const Duration(seconds: 5),
              textStyle: const TextStyle(color: Colors.white),
              decoration: BoxDecoration(color: Colors.black.withOpacity(0.4))),
          appBarTheme: const AppBarTheme(
              color: Colors.white, surfaceTintColor: Colors.white),
          listTileTheme: const ListTileThemeData(
              leadingAndTrailingTextStyle:
                  TextStyle(color: Colors.black, fontSize: 18),
              titleTextStyle: TextStyle(fontSize: 18, color: Colors.black)),
          iconTheme: const IconThemeData(color: Colors.white),
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.appThemeColor)
              .copyWith(background: Colors.white),
        ),
        home: const SplashScreen());
  }
}
