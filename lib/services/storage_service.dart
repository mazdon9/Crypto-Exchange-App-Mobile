import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  // instance => indicate an object
  //init storageService singleton
  StorageService._privateConstructor();
  static final StorageService _instance = StorageService._privateConstructor();
  static StorageService get instance => _instance;

  // declare keys
  static const String onboardingCompleted = "onboarding_completed";
  static const String _favoritesTokens = 'favoritesTokens';

  // Static stream controller for favorites changes
  static final StreamController<List<String>> _favoritesChangeController =
      StreamController<List<String>>.broadcast();

  // Stream that emits whenever favorite tokens change
  Stream<List<String>> get favoritesChangeStream =>
      _favoritesChangeController.stream;

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

  // get favorite tokens by lowercase
  List<String> getFavoriteTokens() {
    List<String> favoriteTokens = _prefs.getStringList(_favoritesTokens) ?? [];

    /// to lowercase for every item in the list
    /// example -> BTCUSDT -> btcusdt
    for (var i = 0; i < favoriteTokens.length; i++) {
      favoriteTokens[i] = favoriteTokens[i].toLowerCase();
    }

    return favoriteTokens;
  }

  // Toggle favorite token, check if it's exsit -> remove , otherwise add
  Future<void> toggleFavoriteToken(String symbol) async {
    List<String> favoriteTokens = getFavoriteTokens();

    if (favoriteTokens.contains(symbol)) {
      favoriteTokens.remove(symbol);
    } else {
      favoriteTokens.insert(0, symbol);
    }

    // save the new list of favorite tokens
    await _prefs.setStringList(_favoritesTokens, favoriteTokens);

    // emit the new list to stream controller
    _favoritesChangeController.add(favoriteTokens);
  }
}
