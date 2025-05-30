import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'app_config.dart';

class AppUrls {

  //config
  static const String googlePlay = "https://play.google.com/store/apps/details?id=ru.amonlexasoftware.wresthub";
  static const String appStore = "https://apps.apple.com/ru/app/wrestling-hub/id6741020047";
  static String serverAddress = dotenv.get('API_URL');
  static String storeApp = AppConfig.isIos ? appStore  : googlePlay;

  //app helper links
  static const String donatLink = "https://www.donationalerts.com/r/amonlexa";
  static const String privacy = "https://docs.amonlexa.ru/privacy_wrestling_ru.html";
  static const String telegramBotAuth = 'https://t.me/AmonlexaWrestlingBot';
  static const String telegramAmonlexa = 'https://t.me/Amonlexa';
  static const String mailAmonlexa = 'struchkov.01@list.ru';

  //api
  static final getVideos = "$serverAddress${dotenv.get('API_VIDEOS')}";
  static final editUser = "$serverAddress${dotenv.get('API_USER_EDIT')}";
  static final getUser = "$serverAddress${dotenv.get('API_USER_GET')}";
  static final signInGoogle = "$serverAddress${dotenv.get('API_SIGN_GOOGLE')}";
  static final deleteUser = "$serverAddress${dotenv.get('API_USER_DELETE')}";
  static final confirmSmsCode = "$serverAddress${dotenv.get('API_CONFIRM_CODE')}";

  static final getMainContent = "$serverAddress${dotenv.get('API_MAIN')}";
  static final getFullNews = "$serverAddress${dotenv.get('API_NEWS_FULL')}";
  static final getSearchNews = "$serverAddress${dotenv.get('API_NEWS_SEARCH')}";
  static final getCommentNews = "$serverAddress${dotenv.get('API_NEWS_COMMENTS')}";
  static final sendCommentNews = "$serverAddress${dotenv.get('API_NEWS_SEND_COMMENT')}";

  // static const sendImageServer = "https://files.in-reservy.ru/upload_image.php";




}