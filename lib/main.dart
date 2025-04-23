import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tap_bill/controllers/nav_controller.dart';
import 'package:tap_bill/controllers/new_bill%20_controller.dart';
import 'package:tap_bill/controllers/theme_controller.dart';
import 'package:tap_bill/resources/app_theme.dart';
import 'package:tap_bill/screens/home_page.dart';
import 'package:tap_bill/screens/new_bill.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  _initControllers();
  runApp(MainApp());
}

Future<void> _initControllers() async {
  Get.put(ThemeController());
  Get.put(NavController());
  Get.put(NewBillController());
  await GetStorage.init();
}

class MainApp extends StatelessWidget {
  MainApp({super.key});
  final themeController = Get.find<ThemeController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          themeMode: themeController.themeMode,
          initialRoute: '/',
          getPages: [
            GetPage(name: '/', page: () => HomePage()),
            // GetPage(name: '/splash', page: () => const SplashScreen()),
            // GetPage(name: '/config', page: () => ConfigPage()),
            GetPage(name: '/newBill', page: () => NewBillPage()),
          ],
        ));
  }
}
