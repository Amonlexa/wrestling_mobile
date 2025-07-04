import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'core/wrestling_hub_app.dart';
import 'core/di.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> sectionANavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'sectionANav');

void main() async {
  await dotenv.load(fileName: '.env');
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  setWhiteStatusBar();
  runApp(const WrestlingSakhaApp());
}

void setWhiteStatusBar() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // Прозрачный фон
      statusBarIconBrightness: Brightness.light, // Белые иконки (Android)
      statusBarBrightness: Brightness.dark,  // Для iOS (влияет на текст)
    ),
  );
}

