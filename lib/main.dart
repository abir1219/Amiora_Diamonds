import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app/my_app.dart';
import 'core/constants/app_colors.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: AppColors.LOGO_BACKGROUND_RED_COLOR,
      systemNavigationBarIconBrightness: Brightness.light, // for white icons
      statusBarColor: AppColors.LOGO_BACKGROUND_RED_COLOR,
      statusBarIconBrightness: Brightness.light, // for white icons on status bar
      statusBarBrightness: Brightness.dark, // for iOS
    ),
  );

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((_) async {
    runApp(MyApp());
  });
}