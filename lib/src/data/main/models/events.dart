import 'package:wrestling_hub/src/domain/main/entities/events_entity.dart';

class Events extends EventsEntity {

  Events({
    super.id,
    super.title,
    super.description,
    super.image,
    super.status,
    super.type,
    super.creationDateTime,
    super.dateStart,
    super.dateEnd,
    super.isDeleted,
    super.organizer,
  });

  Events.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? '';
    title = json['title'] ?? '';
    description = json['description'] ?? '';
    status = json['status'] ?? '';
    image = json['image'] ?? '';
    type = json['type'] ?? '';
    creationDateTime = json['creation_date_time'] ?? '';
    dateStart = json['date_start'] ?? '';
    dateEnd = json['date_end'] ?? '';
    isDeleted = json['is_deleted'] ?? '';
    organizer = json['organizer'] ?? '';
  }

  // Геттер: время до начала события
  Duration get timeLeft {
    try {
      final start = DateTime.parse(dateStart!);
      return start.difference(DateTime.now());
    } catch (e) {
      return Duration.zero;
    }
  }

  // Метод для копирования с новым значением времени
  Events copyWith({String? dateStart}) {
    return Events(
      id: id,
      title: title,
      description: description,
      image: image,
      status: status,
      type: type,
      creationDateTime: creationDateTime,
      dateStart: dateStart ?? this.dateStart,
      dateEnd: dateEnd,
      isDeleted: isDeleted,
      organizer: organizer,
    );
  }

}