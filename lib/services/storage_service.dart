import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  /// Instance -> indicate an object
  /// Init StorageService Singleton
  StorageService._privateConstructor();

  static final StorageService _instance = StorageService._privateConstructor();

  static StorageService get instance => _instance;

  /// properites -> variable
  /// method -> function

  /// Declare StorageService key
  static const String onboardingCompleted = 'onboarding_completed';

  /// Init Shared Preferences
  late SharedPreferences _prefs;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  /// Global Shared Preferences function

  /// set bool
  Future<void> setBool(String key, bool value) async {
    await _prefs.setBool(key, value);
  }

  /// get bool
  Future<bool> getBool(String key) async {
    return _prefs.getBool(key) ?? false;
  }

  /// set onboardingCompleted
  Future<void> setOnboardingCompleted({bool? value}) async {
    await setBool(onboardingCompleted, value ?? true);
  }

  /// get onboardingCompleted
  Future<bool> getOnboardingCompleted() async {
    return getBool(onboardingCompleted);
  }
}
