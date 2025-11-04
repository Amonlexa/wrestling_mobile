
import 'package:wrestling_hub/src/data/main/models/events.dart';
import 'package:wrestling_hub/src/data/main/models/news.dart';

class MainEntity {

  bool? auth;
  String? message;
  String? currentTime;
  String? timeZone;
  String? timeFormat;
  List<String>? adsList;
  List<News>? news;
  List<Events>? events;

  MainEntity({
    this.auth,
    this.message,
    this.currentTime,
    this.timeZone,
    this.timeFormat,
    this.adsList,
    this.news,
    this.events,
  });
}