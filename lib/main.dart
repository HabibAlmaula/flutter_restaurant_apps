import 'dart:io';
import 'package:android_alarm_manager/android_alarm_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_restaurant/pages/detail_restaurant.dart';
import 'package:flutter_restaurant/pages/restaurant_page.dart';
import 'package:flutter_restaurant/pages/setting_page.dart';
import 'package:flutter_restaurant/pages/splash_screen.dart';
import 'package:flutter_restaurant/preferences/preferences_helper.dart';
import 'package:flutter_restaurant/provider/database_provider.dart';
import 'package:flutter_restaurant/provider/preferences_provider.dart';
import 'package:flutter_restaurant/provider/restaurant_provider.dart';
import 'package:flutter_restaurant/provider/scheduling_provider.dart';
import 'package:flutter_restaurant/utils/background_service.dart';
import 'package:flutter_restaurant/utils/notification_helper.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'data/db/database_helper.dart';
import 'data/service/api_service.dart';
import 'pages/favourite_page.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final NotificationHelper _notificationHelper = NotificationHelper();
  final BackGroundService _backgroundService = BackGroundService();

  _backgroundService.initializeIsolate();
  if (Platform.isAndroid) {
    await AndroidAlarmManager.initialize();
  }
  await _notificationHelper.initNotification(flutterLocalNotificationsPlugin);

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final NotificationHelper _notificationHelper = NotificationHelper();

  @override
  void initState() {
    _notificationHelper.configureSelectNotificationSubject(DetailRestaurantPage.routeName);
    super.initState();
  }
  @override
  void dispose() {
    selectNotificationSubject.close();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => RestaurantProvider(apiService: ApiService()).getRestaurants(),
        ),
        ChangeNotifierProvider(create: (_) => SchedulingProvider()),
        ChangeNotifierProvider(
          create: (_) => PreferencesProvider(
            preferencesHelper: PreferencesHelper(
              sharedPreferences: SharedPreferences.getInstance(),
            ),
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => DatabaseProvider(databaseHelper: DatabaseHelper()),
        )
      ],
      child: MaterialApp(
        navigatorKey: Get.key,
        navigatorObservers: [GetObserver()],
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: Colors.deepOrange,
            visualDensity: VisualDensity.adaptivePlatformDensity),
        initialRoute: SplashScreen.routeName,
        routes: {
          SplashScreen.routeName: (context) => const SplashScreen(),
          RestaurantPage.routeName: (context) => const RestaurantPage(),
          DetailRestaurantPage.routeName: (context) => DetailRestaurantPage(
                idRestaurant:
                    ModalRoute.of(context)?.settings.arguments as String,
              ),
          SettingPage.routeName: (context) => const SettingPage(),
          FavouritePage.routeName: (context) => const FavouritePage(),
        },
      ),
    );
  }
}
