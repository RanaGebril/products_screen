import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:products_screen/core/theme/app_theme_data.dart';
import 'features/products/presentation/screens/products_screen.dart';

bool isConnected = false;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('productsBox');

  // Check initial internet connection status
  isConnected = await InternetConnectionChecker.instance.hasConnection;

  // Listen for future internet connection changes
  InternetConnectionChecker.instance.onStatusChange.listen((status) {
    if (status == InternetConnectionStatus.connected) {
      print('Connected to the internet');
      isConnected = true;
    } else {
      print('Disconnected from the internet');
      isConnected = false;
    }
  });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppThemeData.lightTheme,
      initialRoute: ProductsScreen.route_name,
      routes: {ProductsScreen.route_name: (context) => ProductsScreen()},
    );
  }
}
