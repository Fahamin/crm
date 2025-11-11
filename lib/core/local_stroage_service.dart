import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  static LocalStorageService? _instance;
  static SharedPreferences? _preferences;

  static Future<LocalStorageService> getInstance() async {
    _instance ??= LocalStorageService();
    _preferences ??= await SharedPreferences.getInstance();
    return _instance!;
  }

  // User preferences
  Future<void> setUserName(String token) async {
    await _preferences?.setString('user_token', token);
  }

  String? get userName => _preferences?.getString('user_token');

  Future<void> setUserType(String userId) async {
    await _preferences?.setString('user_id', userId);
  }

  String? get userType => _preferences?.getString('user_id');

  // App settings
  Future<void> setThemeMode(bool isDark) async {
    await _preferences?.setBool('is_dark_mode', isDark);
  }

  bool get isDarkMode => _preferences?.getBool('is_dark_mode') ?? false;

  Future<void> setLanguage(String language) async {
    await _preferences?.setString('language', language);
  }

  String get language => _preferences?.getString('language') ?? 'en';

  // Clear all data
  Future<void> clearAll() async {
    await _preferences?.clear();
  }

  // Remove specific key
  Future<void> remove(String key) async {
    await _preferences?.remove(key);
  }
}