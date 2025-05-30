import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConfig {
 static const bool forceProd = true;
 static bool isIos = Platform.isIOS ? true : false;
 static String googleOauthClientID = dotenv.get("GOOGLE_CLIENT_ID");
 static String googleOauthServerClientID = dotenv.get('GOOGLE_CLIENT_SERVER_ID');
}