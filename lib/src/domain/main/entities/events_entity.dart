class EventsEntity {

  String? id;
  String? title;
  String? description;
  String? image;
  String? type;
  String? status;
  String? isDeleted;
  String? creationDateTime;
  String? dateStart;
  String? dateEnd;
  String? organizer;

  EventsEntity({
    this.id,
    this.title,
    this.description,
    this.image,
    this.type,
    this.status,
    this.isDeleted,
    this.creationDateTime,
    this.dateStart,
    this.dateEnd,
    this.organizer,
  });
}