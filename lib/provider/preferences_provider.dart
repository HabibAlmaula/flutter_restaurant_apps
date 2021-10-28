import 'package:flutter/foundation.dart';
import 'package:restaurant_app/preferences/preferences_helper.dart';

class PreferencesProvider extends ChangeNotifier{
  PreferencesHelper preferencesHelper;

  PreferencesProvider({required this.preferencesHelper}){
    _getDailyRestaurantPreferences();
  }

  bool _isDailyRestaurantActive = false;

  bool get isDailyRestaurantActive => _isDailyRestaurantActive;


  void _getDailyRestaurantPreferences() async{
    _isDailyRestaurantActive = await preferencesHelper.isDailyRestaurantActive;
    notifyListeners();
  }

  void enableDailyRestaurant(bool value){
    preferencesHelper.setDailyRestaurant(value);
    _getDailyRestaurantPreferences();
  }


}