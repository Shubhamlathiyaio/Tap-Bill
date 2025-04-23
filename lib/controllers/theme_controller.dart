import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeController extends GetxController {
  final _storage = GetStorage();
  final _key = 'isDarkMode';

  RxBool isDarkMode = false.obs;

  @override
  void onInit() {
    isDarkMode.value = _loadThemeFromStorage();
    super.onInit();
  }

  bool _loadThemeFromStorage() => _storage.read(_key) ?? false;

  _saveThemeToStorage(bool isDark) => _storage.write(_key, isDark);

  ThemeMode get themeMode => isDarkMode.value ? ThemeMode.dark : ThemeMode.light;

  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    _saveThemeToStorage(isDarkMode.value);
    Get.changeThemeMode(themeMode);
  }
}
