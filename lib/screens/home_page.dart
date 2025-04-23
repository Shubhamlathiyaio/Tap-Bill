import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tap_bill/commons/common_spacing.dart';
import 'package:tap_bill/commons/common_text.dart';
import 'package:tap_bill/controllers/nav_controller.dart';
import 'package:tap_bill/controllers/theme_controller.dart';

class HomePage extends StatelessWidget {
  final NavController navCtrl = Get.put(NavController());

  final pages = [
    Center(child: Text("Home")),
    Center(child: Text("Home")),
    Center(child: Text("Home")),
    Center(child: Text("Add Bill")),
    Center(child: Text("Add Bill")),
    Center(child: Text("Settings")),
  ];


  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          appBar: AppBar(
            title: Text("Tap Bill"),
            actions: [
              GestureDetector(
                onTap: Get.find<ThemeController>().toggleTheme,
                child: Get.find<ThemeController>().isDarkMode.value
                    ? FaIcon(FontAwesomeIcons.sun)
                    : FaIcon(FontAwesomeIcons.moon),
              ),
              w16,
            ],
          ),
          body: pages[navCtrl.currentIndex.value],
          bottomNavigationBar: BottomAppBar(
            shape: CircularNotchedRectangle(),
            notchMargin: 6,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildNavItem(
                    icon: Icons.home,
                    label: "Home",
                    index: 0,
                    context: context),
                buildNavItem(
                    icon: Icons.receipt_long,
                    label: "My Bill",
                    index: 1,
                    context: context),
                buildNavItem(
                    icon: Icons.business,
                    label: "Companies",
                    index: 3,
                    context: context),
                buildNavItem(
                    icon: Icons.person,
                    label: "Me",
                    index: 4,
                    context: context),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => navCtrl.changeTab(2),
            shape: CircleBorder(),
            child: Icon(Icons.add),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
        ));
  }

  Widget buildNavItem({
    required IconData icon,
    required String label,
    required int index,
    required BuildContext context,
  }) {
    final navCtrl = Get.find<NavController>();
    final theme = Theme.of(context);

    return Obx(() {
      final color = navCtrl.currentIndex.value == index
          ? theme.colorScheme.primary
          : Colors.grey;

      return GestureDetector(
        onTap: () => navCtrl.changeTab(index),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: color,
            ),
            CommonText(
              data: label,
              fontColor: color,
              fontSize: 12,
            ),
          ],
        ),
      );
    });
  }
}
