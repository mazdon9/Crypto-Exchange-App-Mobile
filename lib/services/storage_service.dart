import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  // instance => indicate an object
  //init storageService singleton
  StorageService._privateConstructor();
  static final StorageService _instance = StorageService._privateConstructor();
  static StorageService get instance => _instance;
  // declare keys
  static const String onboardingCompleted = "onboarding_completed";
  //init shared preferences
  late SharedPreferences _prefs;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  //global shared preferences instance

  //set bool
  Future<void> setBool(String key, bool value) async {
    await _prefs.setBool(key, value);
  }

  // get bool
  Future<bool> getBool(String key) async {
    return _prefs.getBool(key) ?? false;
  }

  // set onboarding completed
  Future<void> setOnboardingCompleted({bool? value}) async {
    await setBool(onboardingCompleted, value ?? true);
  }

  // get onboarding completed
  Future<bool> getOnboardingCompleted() async {
    return getBool(onboardingCompleted);
  }

  // set darkMode
}
